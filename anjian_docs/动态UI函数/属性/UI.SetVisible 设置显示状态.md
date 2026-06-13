# UI.SetVisible 设置显示状态

> 来源: https://res.anjian.com/uiDynamic/property/SetVisible.html

---

### 函数名称

UI.SetVisible 设置显示状态

### 函数功能

设置控件的显示状态

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.0 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.SetVisible(eleName,\_type)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |
| \_type | int | 是 | 显示方式  
1：显示控件  
2：隐藏控件  
3：隐藏控件且不占用布局空间 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：成功  
false：失败 |

### 代码范例

```sourceCode lua
//创建一个名称为"layout1"的布局控件
TracePrint UI.Newlayout ("layout1") 
//以下例子是通过GetVisible命令配合按钮3点击事件来获取当前输入框的显示状态
TracePrint UI.AddEditText("layout1", "输入框1", "请在此输入内容") 
TracePrint UI.NewRow("layout1", "new_row_1")
TracePrint UI.AddButton("layout1", "按钮1", "显示输入框") 
TracePrint UI.NewRow("layout1", "new_row_2" )
TracePrint UI.AddButton("layout1", "按钮2", "隐藏输入框") 
TracePrint UI.NewRow("layout1", "new_row_3")
TracePrint UI.AddButton("layout1", "按钮3", "隐藏输入框且不占用布局空间") 
TracePrint UI.NewRow("layout1", "new_row_4")
TracePrint UI.AddButton("layout1", "获取属性", "获取属性")
UI.SetOnClick "按钮1",显示输入框
UI.SetOnClick "按钮2", 隐藏输入框1
UI.SetOnClick "按钮3", 隐藏输入框2
UI.SetOnClick "获取属性",getAttr
//显示名称为："layout1" 的布局控件
TracePrint UI.Show ("layout1") 

Function getAttr()
    Select Case UI.GetVisible ("输入框1")
    Case 1
        TracePrint "输入框为显示状态"
    Case 2
        TracePrint "输入框为隐藏状态"
    Case 3
        TracePrint "输入框为隐藏状态且不占用布局空间"
    End Select
End Function

Function 显示输入框 //点击事件
    UI.SetVisible("输入框1",1)
End Function

Function 隐藏输入框1
    UI.SetVisible("输入框1",2)
End Function

Function 隐藏输入框2
    UI.SetVisible("输入框1",3)
End Function
```

### 备注说明

创建的控件默认都为显示状态；隐藏控件将使控件在界面不显示，但是原本的控件属性等还是可以正常获取

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }