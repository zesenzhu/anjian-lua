# Sub 子程序

> 来源: https://res.anjian.com/basic/control/Sub.html

---

### 函数名称

Sub 子程序

### 函数功能

定义一个子程序，可以使用 Exit Sub强制结束子程序执行

因为function函数有返回值，子程序没有返回值，函数可以覆盖所有子程序功能，而子程序无法代替函数，建议使用函数

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Sub subName(\[param1, …\])  
执行语句  
End Sub

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| subName | sub | 是 | 子程序名称，需遵循标识符命名规则：  
只能由英文字母、中文字符、数字和下划线 \_ 组成；  
不区分大小写；  
不能以数字开头；  
不能与关键字重名。 |
| param1 | any | 否 | 自定义参数1，自定义参数+子程序内定义局部变量总数不能大于200个 |

### 函数返回

无

### 代码范例

```sourceCode lua
//例子1：子程序调用
Call 子程序1()
Sub 子程序1()
    TracePrint "我是子程序1,被你调用了"
End Sub
```

```sourceCode lua
//例子2：子程序调用并传入参数，参数可支持多个。
Dim 变量1,变量2
变量1="我是字符串信息"
变量2=123
Call 子程序2(变量1,变量2,"第三个参数",456)
//定义一个过程,可以在脚本中调用这个过程
Sub 子程序2(参数1,参数2,参数3,参数4)
    TracePrint "我是子程序2,被你调用了"
    TracePrint "参数1=" & 参数1
    TracePrint "参数2=" & 参数2
    TracePrint "参数3=" & 参数3
    TracePrint "参数4=" & 参数4
End Sub
```

### 备注说明

若省略调用关键字Call与参数的括号，则子程序与自定义参数之间必须用空格隔开

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }