# Url.Download 下载文件

> 来源: https://res.anjian.com/expand/url/Download.html

---

### 函数名称

Url.Download 下载文件

### 函数功能

以通用http协议下载文件

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.1.1 | 5.0.0 | 5.0.0 | 2.3.0 | ✖ |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | ✖ |

### 函数语法

result = Url.Download (request\_body)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| request\_body | table | 是 | 包含请求信息的键值表 |

request\_body字段

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| url | string | 是 | 请求的链接地址，支持HTTP/HTTPS |
| filepath | string | 是 | 文件保存的目录，如果是包含文件名的完整路径，下载文件后自动保存成此路径 |
| headers | table | 否 | 请求头信息以key:value的形式组合成键值表进行传递，格式：{“Content-Type”:“application/json”} |
| timeout | int | 否 | 设置请求的超时时间，单位为秒，默认为60秒 |
| progress | string | 否 | 下载过程的回调函数，填写回调函数名称字符串，函数包含三个参数  
total：要下载的文件的总大小，单位字节  
succ：下载成功的大小，单位字节  
url：下载的链接地址 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回响应结果信息的键值表result 包含的字段 |

result 包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 请求命令的结果状态码，并非HTTP状态码，0为请求成功，-1为请求失败，失败原因查看msg字段 |
| msg | string | 请求结果的描述，请求失败则描述具体的失败原因 |
| data | string | 下载完成的文件的绝对路径 |

### 代码范例

```sourceCode lua
Dim body = {null}
Dim resp
body["url"] = "https://bbs.anjian.com/templates/default/Images/logo1.png"
body["filepath"] = GetTempDir()
body["progress"] = "proc"
body["headers"] = {"Authorization":"Bearer my_secret_toke"}
resp = Url.download(body)
If resp["code"] = 0 Then 
    TracePrint "下载成功，文件路径：" & resp["data"]
    TracePrint dir.Exist(GetTempDir() & "logo1.png")
Else 
    TracePrint "下载失败：" & resp["msg"]
End If

Function proc(total, succ, _url)
    Dim splitPath = Split(_url, "/")
    Dim fileName = splitPath[Len(splitPath)]
    TracePrint "文件" & fileName & "下载进度 -> " & Int((succ / total) * 100) & "%" 
End Function
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }