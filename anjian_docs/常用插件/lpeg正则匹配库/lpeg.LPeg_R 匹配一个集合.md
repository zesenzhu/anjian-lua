# lpeg.LPeg_R 匹配一个集合

> 来源: https://res.anjian.com/plugin/lpeg/LPeg_R.html

---

### 函数名称

lpeg.LPeg\_R 匹配字符集合

### 函数功能

用于匹配目标字符串的**起始位置**是否包含**指定字符范围集合**中的字符，可限定连续匹配的字符数量

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

pattern = lpeg.LPeg\_R(str\[, count\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| str | string | 是 | 字符范围描述字符串，用于定义可匹配的字符集合。常用集合：  
`"az"`：表示匹配 `a` 到 `z` 之间的小写字母  
`"AZ"`：表示匹配 `A` 到 `Z` 之间的大写字母  
`"09"`：表示匹配 `0` 到 `9` 之间的数字  
**注意：**参数只能传入其中一种集合 |
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

// 定义一个模式，用来匹配数字字符 0–9
// "09" 表示字符范围，从 '0' 到 '9'
pattern = lpeg.LPeg_R("09")

text = "2023年度报告"

// 从字符串开头尝试匹配
ret = lpeg.LPeg_match(pattern, text)
If ret Then
    TracePrint "匹配成功，字符串是以数字开头的。"
Else
    TracePrint "没有匹配到数字开头。"
End If
```

**限定长度匹配**

```sourceCode lua
Import "lpeg.lua"
Dim pattern, str1, str2

// 匹配至少连续 4 位数字
pattern = lpeg.LPeg_R("09", 4)

str1 = "123 Error"      // 只有 3 位数字
str2 = "2023 Success"  // 有 4 位数字

// 测试文本 1
If lpeg.LPeg_match(pattern, str1) Then
    TracePrint "文本1 符合年份格式"
Else
    TracePrint "文本1 格式错误（数字长度不够）"
End If

// 测试文本 2
If lpeg.LPeg_match(pattern, str2) Then
    TracePrint "文本2 符合年份格式"
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }