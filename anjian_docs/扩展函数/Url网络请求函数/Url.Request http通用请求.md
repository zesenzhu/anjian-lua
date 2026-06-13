# Url.Request http通用请求

> 来源: https://res.anjian.com/expand/url/Request.html

---

### 函数名称

Url.Request http通用请求

### 函数功能

以通用http协议发起请求并响应返回

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.1.1 | 5.0.0 | 5.0.0 | 2.3.0 | ✖ |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | ✖ |

### 函数语法

ret\_table = Url.Request(body)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| body | table | 是 | 包含请求信息的键值表 |

body包含以下字段：

   
| 字段名 | 字段类型 | 是否必选 | 字段说明 |
| --- | --- | --- | --- |
| url | string | 是 | 请求的链接地址，支持HTTP/HTTPS |
| method | string | 否 | 请求的类型，支持：GET/POST/PUT/DELECT/PATCH；默认为 GET |
| headers | table | 否 | 请求头信息以key:value的形式组合成键值表进行传递；范例：{“Content-Type”:“application/json”, “User-Agent”:“Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0”} |
| params | table  
string | 否 | 需要提交的数据，会自动根据不同的请求类型和header里的Content-Type值来进行处理。GET请求会自动转化成url的参数，其他类型请求会自动处理成对应的字符串 |
| cookie | table  
string | 否 | 需要提交的cookie数据，可以是键值表，也可以是key=value格式的字符串 |
| timeout | int | 否 | 设置连接的超时时间，单位为秒，默认为10秒 |
| proxy | table | 否 | 包含了代理ip和端口号的键值表，范例：{ “ip”: “192.168.0.1”, “port”: 8888 } |
| redirect | bool | 否 | 设定是否允许自动重定向，true为允许自动重定向，false为不重定向，默认为true |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回响应结果信息的键值表 |

result 包含以下字段：

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 请求命令的结果状态码，并非HTTP状态码，0为请求成功，-1为请求失败，失败原因查看msg字段 |
| msg | string | 请求结果的描述，请求失败则描述具体的失败原因 |
| statusCode | int | 请求返回的HTTP状态码 |
| header | table | 返回的请求头信息；格式为key:value的形式组合成键值表 |
| cookie | string | 返回的cookie数据 |
| data | string | 返回的请求结果内容 |

### 代码范例

```sourceCode lua
Dim body = {null}
Dim resp
// Get请求
body["url"] = "https://httpbin.org/get?page=1"
body["method"] = "GET"
body["headers"] = {"Authorization":"Bearer my_secret_toke"}
body["params"] = {"user_id":"12345", "token":"abcdef"}
resp = Url.Request(body)
If resp["code"] = 0 Then 
    TracePrint resp["data"]
Else 
    TracePrint "请求失败：" & resp["msg"]
End If

// Post请求
body["url"] = "https://httpbin.org/post"
body["method"] = "POST"
body["headers"] = {"Content-Type": "application/x-www-form-urlencoded"}
body["params"] = {"user_id":"12345", "token":"abcdef"}
resp = Url.Request(body)
If resp["code"] = 0 Then 
    TracePrint resp["data"]
Else 
    TracePrint "请求失败：" & resp["msg"]
End If

// Post提交json请求
body["url"] = "https://httpbin.org/post"
body["method"] = "POST"
body["headers"] = {"Content-Type": "application/json"}
body["params"] = {"user_id":"12345", "token":"abcdef"}
resp = Url.Request(body)
If resp["code"] = 0 Then 
    TracePrint resp["data"]
Else 
    TracePrint "请求失败：" & resp["msg"]
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }