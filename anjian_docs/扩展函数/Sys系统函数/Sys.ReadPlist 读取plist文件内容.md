# Sys.ReadPlist 读取plist文件内容

> 来源: https://res.anjian.com/expand/sys/ReadPlist.html

---

### 函数名称

Sys.ReadPlist 读取plist文件内容

### 函数功能

读取并返回plist文件内容

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.2.0 | ✖ | ✖ | 2.4.1 | ✖ |
| 最低系统版本 | windows 7 | ✖ | ✖ | 13.0 | ✖ |

### 函数语法

ret = Sys.ReadPlist(filePath)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| filePath | string | 是 | 需要读取的plist文件路径 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回响应结果信息的键值表 |

ret包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |
| data | table | 获取到的plist文件内容 |

### 代码范例

```sourceCode lua
//读取和写入plist文件
PutAttachment "", "*"
dim ret,filePath = GetTempDir()&"app.plist"
If Dir.Exist(filePath) = 1 Then 
    ret = sys.readPlist(filePath)
    If ret["code"] = 0 Then
        TracePrint Encode.TableToJson(ret["data"])
    Else 
        TracePrint "读取文件失败，错误码："& ret["code"] & "，错误原因：" & ret["msg"]
    End If
Else 
    TracePrint "文件不存在"
End If

TracePrint ret["data"]["items"][1]["metadata"]["bundle-version"]
ret["data"]["items"][1]["metadata"]["bundle-version"] = "999"
Dim filePathNew = GetTempDir()&"appNew.plist"
ret = sys.writePlist(filePathNew, ret["data"])
If ret["code"] = 0 Then
    TracePrint ret["msg"]
    TracePrint "文件是否存在：" & dir.Exist(filePathNew)
Else 
    TracePrint "写入失败，错误码："& ret["code"] & "，错误原因：" & ret["msg"]
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }