# UI.SetPadding 设置控件内边距

> 来源: https://res.anjian.com/uiDynamic/method/SetPadding.html

---

### 函数名称

UI.SetPadding 设置控件内边距

### 函数功能

设置控件内边距

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.0 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.SetPadding(eleName, \_left,top, \_right,bottom)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |
| \_left | number | 是 | 左边距，推荐：10-50 |
| top | number | 是 | 上边距，推荐：10-50 |
| \_right | number | 是 | 右边距，推荐：10-50 |
| bottom | number | 是 | 下边距，推荐：10-50 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：成功  
false：失败 |

### 代码范例

```sourceCode lua
//创建一个名称为"layout1"的布局控件
UI.NewLayout "layout1"
UI.AddButton("layout1","按钮1","点此观察我的文字位置",300,200)
UI.SetOnClick "按钮1", 设置控件内边距
//显示名称为："layout1" 的布局控件
TracePrint UI.Show ("layout1") 
Function 设置控件内边距()
    TracePrint  UI.SetPadding("按钮1",50,50,50,50)//查看控件文字位置是否发生变化
End Function   
```

### 备注说明

注意：该命令是设置控件的内边距，可以利用它来微调部分控件的文字位置等

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }