# Url.HttpGet 发送HttpGET请求

> 来源: https://res.anjian.com/expand/url/HttpGet.html

---

### 函数名称

Url.HttpGet 发送HttpGET请求

### 函数功能

发送HttpGET请求（以curl方式请求）

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Url.HttpGet(body)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| body | table | 是 | 包含请求信息的键值表 |

body包含以下字段：

   
| 字段名 | 字段类型 | 是否必选 | 字段说明 |
| --- | --- | --- | --- |
| url | string | 是 | 请求的链接地址，支持HTTP/HTTPS |
| code | string | 否 | 编码格式，默认：“UTF-8”，可通过右击查看网页源码中的charset获知正确编码 |
| header | table | 否 | 请求头信息以key:value的形式组合成键值表进行传递；范例：{“Content-Type”:“application/json”, “User-Agent”:“Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0”} |
| cookie | string | 否 | 要提交的cookie字符串 |
| setcookie | string | 否 | 保存cookie的路径 |
| timeout | int | 否 | 设置连接的超时时间，单位为秒，默认为10秒 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | string | 返回响应结果信息 |

### 代码范例

```sourceCode lua
Dim ret,body = {null}
body["url"] = "https://httpbin.org/get?page=1"
body["header"] = {"Authorization":"Bearer my_secret_toke"}
ret = Url.HttpGet(body)
TracePrint ret
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }