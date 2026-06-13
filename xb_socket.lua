
-- 定义全局变量
local sock = {}
QMPlugin = sock

last_error = ""	-- 最后一次错误信息

function print(...)
	LuaAuxLib.TracePrint(':', ...)
end
function try(try_func, catch_func, finally_func)
    local status, result = pcall(try_func)
    
	if not status then
        local e = {}
        e.line = string.match(result, ':(%d-):') - 1
        e.message = string.match(result, ': (.+)')
		last_error = e.message
		if catch_func then
			result = catch_func(e)
		else
			result = nil
		end
	else
		last_error = ""
	end
    
    if finally_func then
        finally_func()
    end
    
    return result
end

function sock.GetLastError()
	return last_error or ""
end


function sock.TcpConnect(ip, port)
	return try(function ()
		local socket = require("socket")
		local tcp, err = socket.tcp()
		assert(tcp, err)
		local ok, err = tcp:connect(ip, port)
		assert(ok, err)
		return tcp
	end)
end

function sock.TcpSend(tcp, data)
	return try(function ()
		assert(tcp and type(tcp) == "userdata", "TCP对象为空或类型错误")
		local ret, err = tcp:send(data)
		if not ret then
			return false
		end
		return true
	end)
end

function sock.TcpReceive(tcp, mode, ot)
	return try(function ()
		assert(tcp and type(tcp) == "userdata", "TCP对象为空或类型错误")
		tcp:settimeout(ot or 0, "t")
		local chunk, status, partial = tcp:receive(mode or "*a")
		return chunk or partial
	end)
end

function sock.TcpClose(tcp)
	return try(function ()
		assert(tcp and type(tcp) == "userdata", "TCP对象为空或类型错误")
		tcp:close()
		return true
	end, 
	function (e)
		return false
	end)
end



local tcp_handle = nil

function sock.CliendConnect(host, port)
	tcp_handle = sock.TcpConnect(host, port)
	if tcp_handle then
		return true
	else
		return false
	end
end

function sock.ClientConnect(host, port)
	tcp_handle = sock.TcpConnect(host, port)
	if tcp_handle then
		return true
	else
		return false
	end
end

function sock.ClientSend(msg)
	return sock.TcpSend(tcp_handle, msg)
end

function sock.ClientReceive(mode, ot)
    return sock.TcpReceive(tcp_handle, mode, ot)
end

function sock.ClientClose()
    return sock.TcpClose(tcp_handle)
end



