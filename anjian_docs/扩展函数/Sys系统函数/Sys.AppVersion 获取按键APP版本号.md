# Sys.AppVersion 获取按键APP版本号

> 来源: https://res.anjian.com/expand/sys/AppVersion.html

---

### 函数名称

Sys.AppVersion 获取按键APP版本号

### 函数功能

获取按键APP版本号，执行平台为小精灵则返回小精灵APP版本号

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.6.0 | 3.6.0 | 5.0.0 | 2.0.0 | 1.7.2 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Sys.AppVersion()

### 函数参数

无

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | string | 应用版本号，如：1.7.1 |

### 代码范例

```sourceCode lua
dim ret,appType = Device.GetAppType()
ret = Sys.AppVersion()
TracePrint ret
If appType = 1 Then 
    TracePrint "当前执行脚本的应用平台类型为：按键精灵，app版本号："&ret
ElseIf appType = 2 Then 
    TracePrint "当前执行脚本的应用平台类型为：小精灵，app版本号："&ret
Else 
    TracePrint "未知平台：" & appType,ret
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }