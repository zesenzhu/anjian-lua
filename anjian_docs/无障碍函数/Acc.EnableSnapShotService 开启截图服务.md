# Acc.EnableSnapShotService 开启截图服务

> 来源: https://res.anjian.com/acc/EnableSnapShotService.html

---

### 函数名称

Acc.EnableSnapShotService 开启截图服务

### 函数功能

请求开启当前安卓APP的无障碍模式截图服务，请求成功后将弹出授权弹窗，需手动完成授权

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 5.0.0 | ✖ | 5.0.0 | ✖ | ✖ |
| 最低系统版本 | windows 7 | ✖ | 7.0 | ✖ | ✖ |

### 函数语法

ret = Acc.EnableSnapShotService()

### 函数参数

无

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：请求成功  
false：请求失败 |

### 代码范例

```vbscript
If Device.GetOSType() = "android_acc" then accInit()

Function accInit()
    accInit = false
    Do
        If not acc.GetAccessibilityServiceState() Then 
            TracePrint "无障碍服务未开启，前往开启，需手动完成授权"
            acc.EnableAccessibilityService()
        End If
        
        If not acc.GetSnapShotServiceState() Then 
            TracePrint "无障碍截图服务未开启，前往开启，需手动完成授权"
            acc.EnableSnapShotService()
        End If
        
        If acc.GetAccessibilityServiceState() and acc.GetSnapShotServiceState() Then 
            TracePrint "无障碍和无障碍截图服务都已开启"
            accInit = true
            Exit Function
        End If
        delay 999
    Loop
End Function
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }