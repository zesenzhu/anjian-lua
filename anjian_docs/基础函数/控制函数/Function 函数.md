# Function 函数

> 来源: https://res.anjian.com/basic/control/Function.html

---

### 函数名称

Function 函数

### 函数功能

定义一个函数，可以使用 Exit Function强制结束函数执行

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Function funcName(\[param1,param2, …\])  
执行语句  
\[函数名=返回值\]  
End Function

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| funcName | function | 是 | 自定义函数名称，需遵循标识符命名规则：  
只能由英文字母、中文字符、数字和下划线 \_ 组成；  
不区分大小写；  
不能以数字开头；  
不能与关键字重名。 |
| param1 | any | 否 | 自定义参数1，自定义参数+函数内定义局部变量总数不能大于200个 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | any | 可选，自定义返回值 |

### 代码范例

```sourceCode lua
Function Countdown(times)
    For i = times To 1 Step -1
        ShowMessage "倒计时：" & i & "秒"
        Delay 1000
    Next
End Function

// 调用函数
Countdown(10)

// 带返回值的函数
Function RandEx(min, max)
    RandEx = Int((max - min + 1) * Rnd() + min)
End Function

// 调用并使用返回值
For i = 1 To 5
    TracePrint "随机数：" & RandEx(1, 10)
Next

Function FindItem(key)
    Dim t = {"洛阳", "长安", "开封", "咸阳"}
    For i = 1 To Len(t)
        If key = t[i] Then 
            FindItem = i        // 设置返回值
            Exit Function       // 立即退出函数
        End If
    Next
    FindItem = 0               // 未找到时返回0
End Function

// 使用返回值进行判断
If FindItem("开封") > 0 Then 
    TracePrint "找到了"
Else 
    TracePrint "没找到"
End If
```

### 备注说明

[语法详解](https://help.anjian.com/docs/mobile/syntax/%E5%87%BD%E6%95%B0.html)

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }