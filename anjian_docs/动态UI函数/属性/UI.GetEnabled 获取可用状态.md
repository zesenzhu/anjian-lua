# UI.GetEnabled 获取可用状态

> 来源: https://res.anjian.com/uiDynamic/property/GetEnabled.html

---

### 函数名称

UI.GetEnabled 获取可用状态

### 函数功能

获取控件是否为可用状态

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.0 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.GetEnabled(eleName)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | 可用状态  
true：可用  
false：禁用 |

### 代码范例

```sourceCode lua
//创建一个名称为"layout1"的布局控件
TracePrint UI.Newlayout ("layout1") 
//以下例子是通过SetEnabled命令配合俩个按钮事件来控制输入框的可用状态
TracePrint UI.AddEditText("layout1", "输入框1", "请在此输入内容") 
TracePrint UI.NewRow("layout1", "new_row_1")
TracePrint UI.AddButton("layout1", "启用输入框", "启用输入框") 
TracePrint UI.AddButton("layout1", "禁用输入框", "禁用输入框") 
UI.SetOnClick "启用输入框",setAttrTrue
UI.SetOnClick "禁用输入框", setAttrFalse

TracePrint UI.NewRow("layout1", "new_row_2")
TracePrint UI.AddButton("layout1", "获取属性", "获取属性") 
UI.SetOnClick "获取属性",getAttr
//显示名称为："layout1" 的布局控件
TracePrint UI.Show ("layout1") 

Function setAttrTrue()
    UI.SetEnabled("输入框1",true)
End Function

Function setAttrFalse
    UI.SetEnabled("输入框1",false)
End Function

Function getAttr()
    If UI.GetEnabled("输入框1") Then 
        TracePrint "当前输入框为可用状态，可正常输入文字"
    Else 
        TracePrint "当前输入框为禁用状态，无法正常输入文字"
    End If
End Function
```

### 备注说明

创建的控件默认都为可用状态；禁用控件将使控件无效化，一系列控件功能都将无法操作

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }