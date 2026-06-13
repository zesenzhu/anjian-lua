# InStrRev 反方向查找字符

> 来源: https://res.anjian.com/standard/string/InstrRev.html

---

### 函数名称

InStrRev 反向查找字符

### 函数功能

查找某字符串在另一字符串中第一次出现的位置，从末位向前查找

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = InStrRev(wholeString,searchString,startPosition\[,comparision\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| wholeString | string | 是 | 包含要查找子字符串的完整字符串 |
| searchString | string | 是 | 要查找的子字符串，即希望在wholeString参数中查找的字符串 |
| startPosition | int | 是 | 开始查找的位置：  
0或-1：从最后一个字符的位置开始向前（左）查找  
其他值n：从正序的第n位开始向前（左）查找 |
| comparision | bool | 否 | 是否忽略大小写，默认：false，即不忽略大小写 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | searchString在wholeString中第一次出现的位置，小于1则表示未找到 |

### 代码范例

```sourceCode lua
Dim ret,wholeString, searchString
wholeString = {"您好,按键精灵欢迎您","abc按键123"}
searchString = "按键"
For i = 1 To Len(wholeString)
    ret = InStrRev(wholeString[i], searchString,-1) //该函数中一个汉字占用3长度
    If ret > 0 Then
        TracePrint "找到：" & searchString & "，位置为：" & wholeString[i] & "的第：" & ret & "位"
    Else 
        TracePrint "没有找到：" & searchString
    End If
Next
```

### 备注说明

该函数的汉字和全角字符占用3个字符位置，而UTF8字符插件中汉字占用1个字符位置，如果参数中包含汉字，建议使用UTF8函数

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }