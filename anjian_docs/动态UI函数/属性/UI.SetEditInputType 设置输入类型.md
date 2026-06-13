# UI.SetEditInputType 设置输入类型

> 来源: https://res.anjian.com/uiDynamic/property/SetEditInputType.html

---

### 函数名称

UI.SetEditInputType 设置输入类型

### 函数功能

设置指定输入框控件的输入类型

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.7 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.SetEditInputType(eleName,inputType)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |
| inputType | int | 是 | 限制的输入内容类型 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：成功  
false：失败 |

### 代码范例

```sourceCode lua
//创建一个名称为"layout1"的布局控件
TracePrint UI.Newlayout ("layout1") 
//添加一个名称为"输入框1"，初始内容为"请在此输入内容"的文本框控件
TracePrint UI.AddEditText("layout1", "输入框1", "请在此输入内容")
TracePrint UI.NewRow("layout1", "new_row_1")
TracePrint UI.AddButton("layout1", "设置属性", "设置属性")
UI.SetOnClick "设置属性",setAttr
//显示名称为："layout1" 的布局控件
TracePrint UI.Show ("layout1") 

Function setAttr()
    //设置"文字框1"的控件的输入类型为:2，数字文本
    TracePrint UI.SetEditInputType("输入框1", 2)
End Function
```

### 备注说明

注意：仅支持输入框控件的输入类型设置。

 
| 数值 | 类型描述 |
| --- | --- |
| 0 | 输入老式的普通文本 |
| 1 | 输入类型为普通文本 |
| 2 | 输入类型为数字文本 |
| 3 | 输入类型为电话号码 |
| 4 | 输入类型为日期和时间 |
| 15 | 输入类型为决定所给文本整体类的位掩码 |
| 16 | 输入URI |
| 16 | 输入类型为{@link#TYPE\_CLASS\_DATETIME}的缺省变化值，只允许输入一个日期 |
| 32 | 输入一个电子邮件地址 |
| 32 | 输入类型为{@link#TYPE\_CLASS\_DATETIME}的缺省变化值，只允许输入一个时间 |
| 48 | 输入电子邮件主题行 |
| 64 | 输入一个短的，可能是非正式的消息，如即时消息或短信 |
| 80 | 输入长内容，可能是正式的消息内容，比如电子邮件的主体 |
| 96 | 输入人名 |
| 112 | 输入邮寄地址 |
| 128 | 输入一个密码 |
| 144 | 输入对用户可见的密码 |
| 160 | 输入网页表单中的文本 |
| 176 | 输入文本以过滤列表等内容 |
| 192 | 输入语音发音输入文本，如联系人拼音名称字段 |
| 208 | 输入网页表单中的邮件地址 |
| 224 | 输入网页表单中的密码 |
| 4080 | 输入类型为决定基类内容变化的位掩码 |
| 4096 | 输入类型为所有字符大写 |
| 4096 | 输入类型为数字是带符号的，允许在开头带正号或者负号 |
| 8192 | 输入类型为每个单词的第一个字母大写 |
| 8192 | 输入类型为小数数字，允许十进制小数点提供分数值 |
| 16384 | 输入类型为每句的第一个字符大写 |
| 32768 | 输入类型为自动纠正文本类型 |
| 65536 | 输入类型为自动完成文本类型 |
| 131072 | 自动多行 |
| 262144 | 输入多行文本 |
| 524288 | 进行输入时，输入法无提示 |
| 16773120 | 输入类型为提供附加标志位选项的位掩码 |

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }