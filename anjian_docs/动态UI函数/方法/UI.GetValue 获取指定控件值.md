# UI.GetValue 获取指定控件值

> 来源: https://res.anjian.com/uiDynamic/method/GetValue.html

---

### 函数名称

UI.GetValue 获取控件属性值

### 函数功能

获取布局内指定控件属性值

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.0 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.GetValue(eleName)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回包含控件名称和属性值的键值表 |

### 代码范例

```sourceCode lua
//创建一个名称为"layout1"的布局控件
UI.NewLayout ("layout1")
//以下例子为分别创建文字框、输入框、按钮等控件并使用获取GetValue它们的值
UI.AddTextView("layout1", "文字框1", "姓名：") 
Dim 内容= UI.GetValue("文字框1")
TracePrint 内容["文字框1"]
UI.AddEditText("layout1", "输入框1", "请在此输入内容") 
Dim 内容2= UI.GetValue("输入框1")
TracePrint 内容2["输入框1"]
UI.AddButton("layout1", "按钮1", "这是个按钮") 
Dim 内容3= UI.GetValue("按钮1")
TracePrint 内容3["按钮1"]
UI.NewRow("layout1", "new_row_0")
UI.AddRadioGroup("layout1","单选框1",{"1小瓶", "2中瓶", "3大瓶"},0)
Dim 内容4= UI.GetValue("单选框1")
TracePrint 内容4["单选框1"]
UI.AddCheckBox("layout1", "多选框1","多选框选项1", false)
Dim 内容5= UI.GetValue("多选框1")
TracePrint 内容5["多选框1"]
UI.NewRow("layout1", "new_row_1")
Dim SpinnerTable = {"湖南", "湖北", "广东", "广西"}
UI.AddSpinner("layout1", "下拉框1", SpinnerTable, 0)
Dim 内容6= UI.GetValue("下拉框1")
TracePrint 内容6["下拉框1"]
//显示名称为："layout1" 的布局控件
UI.Show ("layout1")
```

### 备注说明

此命令不支持获取图像控件、线控件、浏览器控件的值

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }