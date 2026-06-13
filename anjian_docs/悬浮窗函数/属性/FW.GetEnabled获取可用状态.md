# FW.GetEnabled获取可用状态

> 来源: https://res.anjian.com/fw/property/GetEnabled.html

---

### 函数名称

FW.GetEnabled 获取可用状态

### 函数功能

获取控件是否为可用状态

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = FW.GetEnabled(eleName)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 控件名称 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | 可用状态  
0：禁用  
1：启用 |

### 代码范例

```sourceCode lua
//创建悬浮窗
FW.NewFWindow("浮窗名", 0, 0, 800, 800)
//创建按钮控件
FW.AddButton "浮窗名", "but1", "but1", 0, 0, 500, 150
FW.SetOnClick "but1", but1
FW.AddButton "浮窗名", "禁用", "禁用", 0, 200, 150, 60
FW.SetOnClick "禁用", setAttrFalse
FW.AddButton "浮窗名", "启用", "启用", 160, 200, 150, 60
FW.SetOnClick "启用", setAttrTrue
FW.AddButton "浮窗名", "获取属性", "获取属性", 0, 300, 200, 100
FW.SetOnClick "获取属性", getAttr
//显示悬浮窗
FW.Show("浮窗名")

Do
    Delay 999
Loop

Function setAttrFalse()
    TracePrint FW.SetEnabled("but1", 0)
End Function

Function setAttrTrue()
    TracePrint FW.SetEnabled("but1", 1)
End Function

Function getAttr()
    TracePrint FW.GetEnabled("but1")
End Function

Function but1()
    TracePrint "but1 is clicked"
End Function
```

### 备注说明

创建的控件默认都为可用状态；禁用控件将使控件无效化，一系列控件功能都将无法操作

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }