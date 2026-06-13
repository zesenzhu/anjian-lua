# For 循环一定次数

> 来源: https://res.anjian.com/basic/control/For.html

---

### 函数名称

For 循环一定次数

### 函数功能

For 循环是一种有限次数的循环，特别适合需要精确控制循环次数的场景。可以通过 `Exit For` 语句提前退出循环

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

[语法详解](https://help.anjian.com/docs/mobile/syntax/control/%E5%BE%AA%E7%8E%AF%E8%AF%AD%E5%8F%A5.html)

### 函数参数

无

### 函数返回

无

### 代码范例

```sourceCode lua
// 循环固定次数
For 5
    TracePrint "循环过程"
Next
```

```sourceCode lua
// 从1循环到5
For i = 1 To 5
    TracePrint i
Next
```

```sourceCode lua
// 设定步长，从1循环到10，每次增加2
For i = 1 To 10 Step 2
    TracePrint i  // 输出：1, 3, 5, 7, 9
Next
```

```sourceCode lua
// 递减循环，Step必须为负数
For i = 10 To 1 Step -1
    TracePrint i  // 输出：10, 9, 8, 7, 6, 5, 4, 3, 2, 1
Next
```

```sourceCode lua
// 递减循环，当i=5时退出循环
For i = 10 To 1 Step -1
    TracePrint i  // 输出：10, 9, 8, 7, 6, 5
    if i = 5 then Exit For
Next
```

```sourceCode lua
// 使用 For Each 语法遍历哈希表
Dim t = {"name":"Tom", "age":18}
For Each key, value In t
    TracePrint "键名：" & key & ", 键值：" & value 
Next
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }