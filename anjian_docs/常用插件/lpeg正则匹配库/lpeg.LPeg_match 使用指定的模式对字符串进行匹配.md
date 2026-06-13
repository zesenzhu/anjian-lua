# lpeg.LPeg_match 使用指定的模式对字符串进行匹配

> 来源: https://res.anjian.com/plugin/lpeg/LPeg_match.html

---

### 函数名称

lpeg.LPeg\_match 使用指定的模式对字符串进行匹配

### 函数功能

使用指定的 LPeg 模式对字符串进行匹配，并返回**匹配成功后的位置索引**。

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

index = lpeg.LPeg\_match(pattern, text)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| pattern | userdata | 是 | LPeg 模式对象，由 `lpeg.LPeg_P`、`lpeg.LPeg_R`、`lpeg.LPeg_S` 命令返回 |
| text | string | 是 | 需要进行匹配的字符串 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| index | int | 匹配成功：返回**匹配到的字符串的后一个索引位置**  
匹配失败：返回 `null` |

### 代码范例

```sourceCode lua
Import "lpeg.lua"
Dim pattern, text, ret

pattern = lpeg.LPeg_P("http://")
text = "http://www.anjian.com"

ret = lpeg.LPeg_match(pattern, text)
If ret Then
    TracePrint "匹配成功！是标准的HTTP网址"
Else
    TracePrint "匹配失败，不是以 http:// 开头"
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }