# Do 循环

> 来源: https://res.anjian.com/basic/control/Do.html

---

### 函数名称

Do 循环

### 函数功能

条件循环语句。可以是无限循环，也可以是有限循环

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.3.2 | 5.0.0 | 2.1.0 | 1.6.2 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

5种语法格式，详见例子1―5，Exit Do退出当前Do循环

### 函数参数

无

### 函数返回

无

### 代码范例

```sourceCode lua
//例子1：无限循环（死循环）
Do 
    TracePrint "循环过程"
    delay 999
Loop
```

```sourceCode lua
//例子2：前置While条件判断，当循环条件成立时执行循环
Dim i=0
Do While i=0
    TracePrint "循环过程"
    delay 999
Loop
```

```sourceCode lua
//例子3：后置While条件判断，先执行一次循环后判断条件，条件成立则继续执行循环，不成立则退出循环
Dim i=0
Do 
   i = i + 1
   TracePrint "循环过程" & i
   Delay 999
Loop While i = 0
```

```sourceCode lua
//例子4：前置Until条件判断，当循环条件成立时退出循环
Dim i=0
Do Until i=0
    TracePrint "循环过程"
    delay 999
Loop
TracePrint "循环结束"
```

```sourceCode lua
//例子5：后置Until条件判断，先执行一次循环后判断条件，条件成立则退出循环，不成立则继续执行循环
Dim i=0
Do
    i = i + 1
    TracePrint "循环过程" & i
    delay 999
Loop Until i=1
```

### 备注说明

[语法详解](https://help.anjian.com/docs/mobile/syntax/control/%E5%BE%AA%E7%8E%AF%E8%AF%AD%E5%8F%A5.html)

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }