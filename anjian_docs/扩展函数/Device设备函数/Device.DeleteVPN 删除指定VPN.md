# Device.DeleteVPN 删除指定VPN

> 来源: https://res.anjian.com/expand/device/DeleteVPN.html

---

### 函数名称

Device.DeleteVPN 删除指定VPN

### 函数功能

删除系统设置中已添加的指定VPN连接

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.3.0 | ✖ | ✖ | 2.5.0 | ✖ |
| 最低系统版本 | windows 7 | ✖ | ✖ | 13.0 | ✖ |

### 函数语法

result = Device.DeleteVPN(VPNName)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| VPNName | string | 是 | 要删除的VPN名称 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回响应结果信息的键值表 |

resp 包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |
| data | table | 固定为空字符串”” |

### 代码范例

```sourceCode lua
Dim result,VPNConfig =  {"dispName": "VPN名称", "VPNType": 0, "server": "VPN服务器地址", "authorization": "VPN账号", "password": "VPN密码", "VPNLocalIdentifier": "", "VPNRemotedentifier": "", "secret": "密钥"}
result = Device.AddVPN(VPNConfig)
TracePrint Encode.TableToJson(result)

result = Device.SelectVPN("VPN名称")
TracePrint Encode.TableToJson(result)

result = Device.DeleteVPN("VPN名称")
TracePrint Encode.TableToJson(result)

result = Device.GetVPNList()
If result["code"] = 0 Then 
    For i = 1 To Len(result["data"])
        TracePrint result["data"][i]
    Next
Else 
    TracePrint result["code"],result["msg"]
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }