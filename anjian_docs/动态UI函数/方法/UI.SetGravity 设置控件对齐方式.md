# UI.SetGravity 设置控件对齐方式

> 来源: https://res.anjian.com/uiDynamic/method/SetGravity.html

---

### 函数名称

UI.SetGravity 设置控件对齐方式

### 函数功能

设置控件的垂直对齐方式

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.0 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.SetGravity(eleName,alignType)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |
| alignType | int | 是 | 对齐方式，可以是指定整数值或对应常量名  
上对齐：48或UI.ALIGN\_TOP  
下对齐：80或UI.ALIGN\_BOTTOM  
居中对齐：16或UI.ALIGN\_CENTER\_VERTICAL |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：成功  
false：失败 |

### 代码范例

```sourceCode lua
UI.NewLayout("layout1",1,700,550)//创建layout1
UI.AddButton("layout1","按钮1","上对齐", 150, 50)//创建上对齐
UI.AddButton("layout1","按钮2","下对齐", 150, 50)//创建下对齐
UI.AddButton("layout1","按钮3","居中对齐", 150, 50)//创建居中对齐
UI.AddTextView("layout1", "文字框1", " ",10,300)
UI.SetOnClick "按钮1", 上对齐
UI.SetOnClick "按钮2", 下对齐
UI.SetOnClick "按钮3", 居中对齐
UI.Show ("layout1")

Function 上对齐()
    UI.SetGravity "按钮1", UI.ALIGN_TOP
End Function

Function 下对齐()
    UI.SetGravity "按钮2", 80
End Function

Function 居中对齐()
    UI.SetGravity "按钮3", 16
End Function 
```

### 备注说明

注意：该命令是设置控件的垂直对齐方式，可以利用它来优化控件排版等

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }