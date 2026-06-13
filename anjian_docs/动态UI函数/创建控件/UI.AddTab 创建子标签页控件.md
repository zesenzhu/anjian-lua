# UI.AddTab 创建子标签页控件

> 来源: https://res.anjian.com/uiDynamic/create/AddTab.html

---

### 函数名称

UI.AddTab 创建子标签页控件

### 函数功能

创建子标签页控件

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.0 | 3.1.0 | 5.0.0 | 2.0.0 | 1.6.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UI.AddTab(layoutName,eleName,title)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| layoutName | string | 是 | 布局名称或父控件名称 |
| eleName | string | 是 | 控件名称 |
| title | string | 是 | 标签页标题 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：成功  
false：失败 |

### 代码范例

```sourceCode lua
//创建一个名称为"layout1"的布局控件
TracePrint UI.Newlayout ("layout1") 
//以下例子是创建一个包含子标签1和子标签2的标签页，俩个子标签里再分别创建一个按钮控件
TracePrint UI.AddTabHost ("layout1", "标签页1")
TracePrint UI.AddTab ("标签页1", "标签1", "子标签1")
TracePrint UI.AddTab ("标签页1", "标签2", "子标签2")
TracePrint UI.AddButton("标签1", "按钮1", "子标签1按钮") 
TracePrint UI.AddButton("标签2", "按钮2", "子标签2按钮") 
//显示名称为："layout1" 的布局控件
TracePrint UI.Show ("layout1")
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }