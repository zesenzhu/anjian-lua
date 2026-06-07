-- =========================================================================
-- @file: xb_logger.lua
-- @description: 按键精灵手机版 TCP 日志上报插件 (符合 Nest.js tcp-socket 服务规范)
-- @author: Antigravity AI
-- @date: 2026-06-07
-- =========================================================================

-- 导入按键官方常用插件
Import "socket.lua"

-- 尝试安全导入 cjson，如不存在则使用本插件内置的纯 Lua 转换器作为降级方案
local has_cjson, cjson = pcall(function()
    Import "cjson.lua"
    return cjson
end)

if not has_cjson then
    cjson = nil
end

-- =========================================================================
-- 1. 内置极简 JSON 兼容转换模块 (确保无 Cjson 时绝不报错崩溃)
-- =========================================================================

local function escape_str(s)
    s = tostring(s)
    s = string.gsub(s, "\\", "\\\\")
    s = string.gsub(s, "\"", "\\\"")
    s = string.gsub(s, "\n", "\\n")
    s = string.gsub(s, "\r", "\\r")
    s = string.gsub(s, "\t", "\\t")
    return s
end

local function serialize(val)
    local t = type(val)
    if t == "string" then
        return "\"" .. escape_str(val) .. "\""
    elseif t == "number" or t == "boolean" then
        return tostring(val)
    elseif t == "table" then
        -- 判断是否为数组
        local is_array = true
        local max_idx = 0
        for k, v in pairs(val) do
            if type(k) ~= "number" then
                is_array = false
                break
            end
            if k > max_idx then
                max_idx = k
            end
        end
        if is_array and max_idx > 0 then
            local parts = {}
            for i = 1, max_idx do
                table.insert(parts, serialize(val[i]))
            end
            return "[" .. table.concat(parts, ",") .. "]"
        else
            local parts = {}
            for k, v in pairs(val) do
                if type(k) == "string" then
                    table.insert(parts, "\"" .. escape_str(k) .. "\":" .. serialize(v))
                end
            end
            return "{" .. table.concat(parts, ",") .. "}"
        end
    else
        return "null"
    end
end

local function json_encode(tbl)
    if cjson and cjson.Encode then
        local ok, str = pcall(cjson.Encode, tbl)
        if ok then return str end
    end
    return serialize(tbl)
end

local function get_json_field(json_str, field)
    -- 匹配 "field" : "value"
    local pattern = "\"" .. field .. "\"%s*:%s*\"([^\"]*)\""
    local val = string.match(json_str, pattern)
    if val then
        return val
    end
    -- 匹配 "field" : number/boolean/null
    pattern = "\"" .. field .. "\"%s*:%s*([%w%.]+)"
    val = string.match(json_str, pattern)
    return val
end

local function json_decode_field(json_str, field)
    if cjson and cjson.Decode then
        local ok, res = pcall(cjson.Decode, json_str)
        if ok and res and res[field] ~= nil then
            return tostring(res[field])
        end
    end
    return get_json_field(json_str, field)
end

-- =========================================================================
-- 2. QMPlugin 全局导出模块定义
-- =========================================================================

QMPlugin = {}

--- 初始化配置，由主线程调用
-- @param ip 服务器IP
-- @param port 服务器端口
-- @param code 注册码
-- @param deviceId 设备唯一ID
-- @param appName 应用/脚本名称
function QMPlugin.Init(ip, port, code, deviceId, appName)
    -- 将配置和参数注入多线程共享变量中，供后台发送子线程读取
    Thread.SetShareVar("xb_logger_ip", ip or "127.0.0.1")
    Thread.SetShareVar("xb_logger_port", tonumber(port) or 8082)
    Thread.SetShareVar("xb_logger_code", code or "")
    Thread.SetShareVar("xb_logger_device_id", deviceId or "")
    Thread.SetShareVar("xb_logger_app_name", appName or "AnjianClient")
    
    -- 共享队列读写指针重置
    Thread.SetShareVar("xb_logger_write_idx", 0)
    Thread.SetShareVar("xb_logger_read_idx", 0)
    
    -- 状态控制变量
    Thread.SetShareVar("xb_logger_status", "initialized")
    Thread.SetShareVar("xb_logger_is_streaming", 0) -- 0: 仅本地缓存, 1: 开启实时日志流推送
    Thread.SetShareVar("xb_logger_force_exit", 0)  -- 0: 运行中, 1: 要求子线程退出并归档
    
    TracePrint "Nest TCP 日志插件初始化完毕"
end

--- 内部通用的日志压栈函数
local function push_log(level, module_name, content)
    local status = Thread.GetShareVar("xb_logger_status")
    if not status or status == "uninitialized" then
        return
    end

    -- 获取当前时间
    local time_str = os.date("%X") -- 格式化当前时分秒 12:34:56
    local timestamp = os.time() * 1000 -- 生成毫秒级时间戳供后端使用

    local log_item = {
        level = level,
        module = module_name or "CLIENT",
        content = content or "",
        time = time_str,
        timestamp = timestamp
    }

    local log_json = json_encode(log_item)

    -- 主线程将日志转为字符串，写入全局多线程队列缓存
    local write_idx = tonumber(Thread.GetShareVar("xb_logger_write_idx")) or 0
    write_idx = write_idx + 1
    
    Thread.SetShareVar("xb_logger_item_" .. write_idx, log_json)
    Thread.SetShareVar("xb_logger_write_idx", write_idx)
end

--- 写入 INFO 日志
function QMPlugin.Info(module_name, content)
    push_log("INFO", module_name, content)
end

--- 写入 WARN 日志
function QMPlugin.Warn(module_name, content)
    push_log("WARN", module_name, content)
end

--- 写入 ERROR 日志
function QMPlugin.Error(module_name, content)
    push_log("ERROR", module_name, content)
end

--- 主线程要求安全退出并切断 TCP
function QMPlugin.Close()
    Thread.SetShareVar("xb_logger_force_exit", 1)
    TracePrint "已向 Nest 日志守护线程发送安全关闭指令"
end

-- =========================================================================
-- 3. 后台子线程 Worker (由主脚本通过 Thread.Start(xb_logger.ThreadWorker) 拉起)
-- =========================================================================

function QMPlugin.ThreadWorker()
    -- 读取连接配置
    local ip = Thread.GetShareVar("xb_logger_ip")
    local port = tonumber(Thread.GetShareVar("xb_logger_port")) or 8082
    local code = Thread.GetShareVar("xb_logger_code")
    local device_id = Thread.GetShareVar("xb_logger_device_id")
    local app_name = Thread.GetShareVar("xb_logger_app_name")

    if not code or code == "" or not device_id or device_id == "" then
        TracePrint "Nest TCP 守护线程启动失败: 注册码或设备ID缺失"
        Thread.SetShareVar("xb_logger_status", "error_config")
        return
    end

    TracePrint "Nest TCP 守护线程启动成功，正在尝试连接: " .. ip .. ":" .. port

    -- 建立 TCP 连接
    local connect_ok = socket.ClientConnect(ip, port)
    if not connect_ok then
        TracePrint "Nest TCP 连接失败，请检查网络或端口是否开放"
        Thread.SetShareVar("xb_logger_status", "disconnected")
        return
    end

    Thread.SetShareVar("xb_logger_status", "connected")

    -- 1. 发送第一帧: 鉴权激活数据帧
    local auth_payload = json_encode({
        action = "auth",
        code = code,
        deviceId = device_id,
        appName = app_name
    })

    socket.ClientSend(auth_payload .. "\n")

    -- 2. 接收服务器的鉴权结果 (设置 2000ms 超时)
    local auth_resp = socket.ClientReceive(0, 2000)
    if auth_resp and auth_resp ~= "" then
        local status = json_decode_field(auth_resp, "status")
        if status == "ok" then
            Thread.SetShareVar("xb_logger_status", "authorized")
            TracePrint " Nest TCP 鉴权激活成功，开始运行心跳及日志监听。"
        else
            local errMsg = json_decode_field(auth_resp, "message") or "未知原因"
            TracePrint " Nest TCP 鉴权失败: " .. errMsg
            socket.ClientClose()
            Thread.SetShareVar("xb_logger_status", "auth_failed")
            return
        end
    else
        TracePrint " Nest TCP 鉴权超时，未收到服务器应答"
        socket.ClientClose()
        Thread.SetShareVar("xb_logger_status", "auth_timeout")
        return
    end

    -- 3. 运行心跳、监听与发送循环
    local last_ping_time = os.time()
    local local_read_idx = 0
    local archive_logs = {} -- 子线程维护的内存队列，用于存储所有产生的日志，供退出时一次性归档
    local is_streaming = false -- 默认实时流关闭，只保存在本地缓存中

    while true do
        -- 检查主线程是否通知退出
        local force_exit = tonumber(Thread.GetShareVar("xb_logger_force_exit")) or 0
        if force_exit == 1 then
            TracePrint " Nest TCP 接收到主线程退出信号，准备发送归档日志..."
            break
        end

        -- 检查连接健康状态
        local current_status = Thread.GetShareVar("xb_logger_status")
        if current_status == "auth_failed" or current_status == "auth_timeout" or current_status == "kicked" then
            break
        end

        local now = os.time()

        -- A. 心跳发送维护 (每 30 秒发送一次 ping)
        if now - last_ping_time >= 30 then
            local ping_payload = json_encode({
                action = "ping",
                deviceId = device_id
            })
            socket.ClientSend(ping_payload .. "\n")
            last_ping_time = now
        end

        -- B. 非阻塞监听服务器指令下发 (超时设为 50ms 防止卡顿子线程)
        local server_msg = socket.ClientReceive(0, 50)
        if server_msg and server_msg ~= "" then
            -- 按照换行符 \n 切分指令帧以防粘包
            for line in string.gmatch(server_msg, "[^\n]+") do
                local cmd = json_decode_field(line, "cmd")
                if cmd == "start_log_stream" then
                    is_streaming = true
                    Thread.SetShareVar("xb_logger_is_streaming", 1)
                    TracePrint " Nest 下发指令：开始实时推送日志"
                elseif cmd == "stop_log_stream" then
                    is_streaming = false
                    Thread.SetShareVar("xb_logger_is_streaming", 0)
                    TracePrint " Nest 下发指令：停止实时推送，日志进入本地缓存"
                elseif cmd == "force_kick" then
                    local kickMsg = json_decode_field(line, "message") or "设备被强制解绑"
                    TracePrint " Nest 下发指令：您的设备已被后台强制断开: " .. kickMsg
                    socket.ClientClose()
                    Thread.SetShareVar("xb_logger_status", "kicked")
                    return
                end
            end
        end

        -- C. 检查消费主线程新产生的日志
        local write_idx = tonumber(Thread.GetShareVar("xb_logger_write_idx")) or 0
        if local_read_idx < write_idx then
            local chunk_logs = {}

            -- 从共享变量缓冲区中逐条取出日志
            for i = local_read_idx + 1, write_idx do
                local log_item_str = Thread.GetShareVar("xb_logger_item_" .. i)
                if log_item_str and log_item_str ~= "" then
                    -- 压入本次要发送的数据帧
                    table.insert(chunk_logs, log_item_str)
                    
                    -- 解析日志，追加到内存的历史归档数组中
                    local ok, res = pcall(function()
                        if cjson and cjson.Decode then
                            return cjson.Decode(log_item_str)
                        else
                            return {
                                level = get_json_field(log_item_str, "level"),
                                module = get_json_field(log_item_str, "module"),
                                content = get_json_field(log_item_str, "content"),
                                timestamp = tonumber(get_json_field(log_item_str, "timestamp"))
                            }
                        end
                    end)
                    if ok and res then
                        table.insert(archive_logs, res)
                    end

                    -- 清空对应的共享变量，防止大量日志累积撑爆按键精灵内存
                    Thread.SetShareVar("xb_logger_item_" .. i, "")
                end
            end

            -- 更新共享的读取索引进度
            local_read_idx = write_idx
            Thread.SetShareVar("xb_logger_read_idx", local_read_idx)

            -- 如果实时日志流开启，则把新产生的日志立即通过 log_chunk 发送
            if is_streaming and #chunk_logs > 0 then
                local logs_array_str = "[" .. table.concat(chunk_logs, ",") .. "]"
                local chunk_payload = "{\"action\":\"log_chunk\",\"deviceId\":\"" .. device_id .. "\",\"logs\":" .. logs_array_str .. "}"
                socket.ClientSend(chunk_payload .. "\n")
            end
        end

        -- D. 毫秒级延时，防止子线程无限循环导致 CPU 空转和发热
        Delay 100
    end

    -- 4. 退出阶段: 批量归档保存历史日志 (exit_log)
    if #archive_logs > 0 then
        TracePrint("正在上传退出的归档历史日志，条数: " .. #archive_logs)
        local exit_payload = json_encode({
            action = "exit_log",
            deviceId = device_id,
            logs = archive_logs
        })
        socket.ClientSend(exit_payload .. "\n")
        -- 稍微等待以便 TCP 数据完全发送出去
        Delay 250
    end

    -- 5. 切断物理连接，彻底释放 socket 连接句柄
    socket.ClientClose()
    Thread.SetShareVar("xb_logger_status", "closed")
    TracePrint "Nest TCP 守护线程已安全切断并退出。"
end
