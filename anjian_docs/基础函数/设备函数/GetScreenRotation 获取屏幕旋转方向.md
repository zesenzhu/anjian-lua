# GetScreenRotation 获取屏幕旋转方向

> 来源: https://res.anjian.com/basic/device/GetScreenRotation.html

---

### 函数名称

GetScreenRotation 获取屏幕旋转方向

### 函数功能

获取当前屏幕的旋转方向

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = GetScreenRotation()

### 函数参数

无

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 返回当前屏幕的旋转方向  
0：屏幕没有旋转  
1：屏幕逆时针旋转90度  
2：屏幕逆时针旋转180度  
3：屏幕逆时针旋转270度 |

### 代码范例

```sourceCode lua
Dim ret
ret = GetScreenRotation()
If ret = 0 Then
    TracePrint "屏幕没有旋转"
ElseIf ret = 1 Then
    TracePrint "屏幕逆时针旋转90度"
ElseIf ret = 2 Then
    TracePrint "屏幕逆时针旋转180度"
ElseIf ret = 3 Then
    TracePrint "屏幕逆时针旋转270度"
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }