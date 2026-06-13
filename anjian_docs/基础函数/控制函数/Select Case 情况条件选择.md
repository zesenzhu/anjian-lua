# Select Case 情况条件选择 

> 来源: https://res.anjian.com/basic/control/Select.html

---

### 函数名称

Select Case 情况条件选择

### 函数功能

根据情况条件来选择执行对应语句

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Select Case varName  
Case value1\[, value2,…\]  
执行语句1  
Case Else  
执行语句2  
End Select

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| varName | variable | 是 | 任意有效变量，用于与下方case条件值判断 |
| value1 | string  
number  
bool | 是 | 任意有效值，不支持判断语句，多个值用逗号“,”分隔，表示逻辑运算中的“或” |
| value2 | string  
number  
bool | 否 | 任意有效值，不支持判断语句，多个值用逗号“,”分隔，表示逻辑运算中的“或” |

### 函数返回

无

### 代码范例

```sourceCode lua
//不支持判断语句，如：Case a>0
//以下是选择条件结结构判断
Dim 变量=1
Select Case 变量
//可支持判断多个值,中间以逗号隔开
Case 0,1
    TracePrint "你输入的数字为：0或者1"  
Case 2
    TracePrint "你输入的数字为：2" 
Case 3
    TracePrint "你输入的数字为：3" 
Case 4
    TracePrint "你输入的数字为：4" 
Case 5
    TracePrint "你输入的数字为：5" 
Case 6
    TracePrint "你输入的数字为：6" 
Case 7
    TracePrint "你输入的数字为：7" 
Case 8
    TracePrint "你输入的数字为：8" 
Case 9
    TracePrint "你输入的数字为：9" 
Case Else
    TracePrint "你输入的数字不正确，请输入（0~9）数字！"
End Select
```

### 备注说明

Select Case后面跟的是一个变量，下面Case条件跟的是值，不能跟判断语句，比如i>0之类的不支持

一个Select Case判断必须要有一个End Select来配对，里面的Case可以有多个，但是Case Else最多只能有一个，并且Case Else只能放在最后一个条件上

Select Case语句与If语句类似，但是两者也有区别，If主要用于多个不同条件的判断，而Select Case则是用于同一个条件多个不同结果的判断

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }