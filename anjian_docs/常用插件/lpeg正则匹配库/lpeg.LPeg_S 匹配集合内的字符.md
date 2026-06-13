# lpeg.LPeg_S 匹配集合内的字符

> 来源: https://res.anjian.com/plugin/lpeg/LPeg_S.html

---

### 函数名称

lpeg.LPeg\_S 匹配集合内的字符

### 函数功能

用于匹配目标字符串的**起始位置**是否包含**指定字符集合**中的字符，可限定连续匹配的次数

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

pattern = lpeg.LPeg\_S(str\[, count\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| str | string | 是 | 字符集合字符串，表示允许匹配的字符集合，例如 `"abc"` 表示可匹配字符 `a`、`b` 或 `c` |
| count | int | 否 | 连续匹配 `str` 的次数限制：  
正数：表示至少连续匹配 `count` 次（默认值：1）  
负数：表示至多连续匹配 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| pattern | userdata | 返回一个 LPeg 模式对象，可用于后续 `lpeg.LPeg_match` 使用 |

### 代码范例

**基础匹配**

```sourceCode lua
Import "lpeg.lua"
Dim pattern, text, ret

// 匹配加减乘除任意一个符号
// 只要开头是 + - * / 中的任意一个，就算匹配成功
pattern = lpeg.LPeg_S("+-*/")

text = "+100 Point"

ret = lpeg.LPeg_match(pattern, text)
If ret Then
    TracePrint "匹配成功！这是一个运算符表达式。"
Else
    TracePrint "匹配失败，不是以运算符开头。"
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }