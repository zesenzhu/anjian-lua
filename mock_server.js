/**
 * @file: mock_server.js
 * @description: 按键精灵 TCP 日志上报插件本地调试 Mock 服务器 (Nest.js tcp-socket 协议模拟器)
 * @author: Antigravity AI
 */

const net = require('net');
const readline = require('readline');

const PORT = 8082;
const clients = new Map(); // socket -> deviceId

const server = net.createServer((socket) => {
    console.log(`[TCP] 新的物理连接建立: ${socket.remoteAddress}:${socket.remotePort}`);
    socket.setEncoding('utf8');
    
    let buffer = '';
    let authenticated = false;
    let deviceId = '未知设备';

    socket.on('data', (data) => {
        buffer += data;
        let newlineIdx = buffer.indexOf('\n');
        
        while (newlineIdx !== -1) {
            const frame = buffer.substring(0, newlineIdx).trim();
            buffer = buffer.substring(newlineIdx + 1);
            
            if (frame) {
                try {
                    const payload = JSON.parse(frame);
                    handleFrame(socket, payload);
                } catch (err) {
                    console.error(`[TCP] 解析 JSON 数据帧失败: "${frame}", 错误: ${err.message}`);
                    socket.write(JSON.stringify({ status: 'error', message: 'Bad request frame format' }) + '\n');
                }
            }
            newlineIdx = buffer.indexOf('\n');
        }
    });

    socket.on('close', () => {
        console.log(`[TCP] 连接断开: ${deviceId}`);
        if (authenticated) {
            clients.delete(socket);
        }
    });

    socket.on('error', (err) => {
        console.error(`[TCP] 连接发生错误 (${deviceId}): ${err.message}`);
    });

    function handleFrame(sock, data) {
        const { action } = data;
        
        // 1. 鉴权激活握手
        if (action === 'auth') {
            deviceId = data.deviceId || 'unnamed';
            authenticated = true;
            clients.set(sock, deviceId);
            console.log(`[AUTH] 设备鉴权成功 -> ID: [${deviceId}], 注册码: [${data.code || '无'}], AppName: [${data.appName || '无'}]`);
            
            // 响应客户端成功
            sock.write(JSON.stringify({
                status: 'ok',
                message: 'Authentication successful',
                data: {
                    expireTime: Date.now() + 3600 * 1000 * 24 * 365,
                    maxActive: 5,
                    usedNum: 1
                }
            }) + '\n');

            // 延迟 1 秒，模拟后台管理员正在监听，下发开启实时日志流的指令
            setTimeout(() => {
                if (clients.has(sock)) {
                    console.log(`[CMD] 主动向设备 [${deviceId}] 下发: start_log_stream`);
                    sock.write(JSON.stringify({ cmd: 'start_log_stream' }) + '\n');
                }
            }, 1000);
            return;
        }

        // 验证鉴权状态
        if (!authenticated) {
            console.warn(`[WARN] 收到未授权数据帧，强制关闭: ${JSON.stringify(data)}`);
            sock.write(JSON.stringify({ status: 'error', message: 'Unauthorized' }) + '\n');
            sock.end();
            return;
        }

        // 2. 心跳机制
        if (action === 'ping') {
            console.log(`[PING] 收到设备 [${deviceId}] 的心跳包`);
            sock.write(JSON.stringify({ status: 'ok', message: 'pong' }) + '\n');
            return;
        }

        // 3. 实时日志传输
        if (action === 'log_chunk') {
            const logs = data.logs || [];
            console.log(`[STREAM] 收到设备 [${deviceId}] 实时推流日志 (${logs.length} 条):`);
            logs.forEach(log => {
                console.log(`  [${log.time || 'N/A'}] [${log.level || 'INFO'}] [${log.module || 'CLIENT'}] ${log.content || ''}`);
            });
            return;
        }

        // 4. 定期定量落库归档日志
        if (action === 'exit_log') {
            const logs = data.logs || [];
            console.log(`[ARCHIVE] 收到设备 [${deviceId}] 定期落库归档日志 (${logs.length} 条):`);
            logs.forEach(log => {
                console.log(`  * [DB_SAVE] [${log.level || 'INFO'}] [${log.module || 'CLIENT'}] ${log.content || ''}`);
            });
            sock.write(JSON.stringify({ status: 'ok', message: 'Exit logs archived successfully' }) + '\n');
            return;
        }

        console.warn(`[WARN] 收到未知 Action: ${action}`);
        sock.write(JSON.stringify({ status: 'error', message: 'Unknown action type' }) + '\n');
    }
});

server.listen(PORT, '0.0.0.0', () => {
    console.log(`\n======================================================`);
    console.log(` Nest TCP Socket Mock 测试服务器启动成功！`);
    console.log(` 监听端口: ${PORT}`);
    console.log(`======================================================`);
    console.log(`提示：您可以在本控制台中输入以下指令进行实时交互控制：`);
    console.log(`  start  - 下发指令开启客户端实时日志流上报`);
    console.log(`  stop   - 下发指令关闭客户端实时日志流，进入本地缓冲`);
    console.log(`  kick   - 模拟解绑，向客户端发送 force_kick 并断开`);
    console.log(`======================================================\n`);
});

// 监听控制台命令行输入
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.on('line', (line) => {
    const cmd = line.trim().toLowerCase();
    if (clients.size === 0) {
        console.log(`[MOCK] 当前无任何已连接的设备`);
        return;
    }

    for (const [sock, deviceId] of clients.entries()) {
        if (cmd === 'start') {
            console.log(`[CMD] 下发 start_log_stream -> ${deviceId}`);
            sock.write(JSON.stringify({ cmd: 'start_log_stream' }) + '\n');
        } else if (cmd === 'stop') {
            console.log(`[CMD] 下发 stop_log_stream -> ${deviceId}`);
            sock.write(JSON.stringify({ cmd: 'stop_log_stream' }) + '\n');
        } else if (cmd === 'kick') {
            console.log(`[CMD] 下发 force_kick -> ${deviceId}`);
            sock.write(JSON.stringify({ cmd: 'force_kick', message: 'Kicked by administrator' }) + '\n');
            sock.end();
            clients.delete(sock);
        } else {
            console.log(`[MOCK] 未知控制台指令: "${cmd}"`);
        }
    }
});
