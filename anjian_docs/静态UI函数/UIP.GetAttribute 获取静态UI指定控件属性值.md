# UIP.GetAttribute 获取静态UI指定控件属性值

> 来源: https://res.anjian.com/uiStatic/GetAttribute.html

---

### 函数名称

UIP.GetAttribute 获取静态UI控件的属性值列表

### 函数功能

获取指定静态UI控件的属性值列表，只支持在静态ui事件中调用，不支持在主程序中调用

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = UIP.GetAttribute(eleName)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 需读取属性值列表的静态UI控件名称，区分大小写 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回指定控件各属性的key和value |

### 代码范例

```sourceCode lua
//以下是界面ui代码，复制到【界面】左侧代码
界面:
{
    标签页1:
    {
        按钮:{注释:"文字大小、高度、宽度是可选属性，如需使用默认值，可保持值为0或直接删除此属性",名称:"按钮1",显示内容:"显示内容",点击响应:"OnClick",文字大小:0,高度:0,宽度:0},
        文字框:{注释:"文字大小、高度、宽度是可选属性，如需使用默认值，可保持值为0或直接删除此属性",名称:"文字框1",显示内容:"这是文字框1的内容",文字大小:0,高度:0,宽度:0},
        文字框:{注释:"文字大小、高度、宽度是可选属性，如需使用默认值，可保持值为0或直接删除此属性",名称:"文字框2",显示内容:"显示内容2",文字大小:0,高度:0,宽度:0},
    },
}


//以下是界面ui事件代码，复制到【界面】右侧代码
//预览此例子界面，点击按钮1可以改变与其关联的其他控件属性
Function onClick()
    Dim ret = uip.GetAttribute("文字框1")
    Dim 显示内容 = ret["显示内容"]
    For i = 1 To 5
        ret["显示内容"] = 显示内容 & i
        UIP.SetAttribute "文字框2", ret
        Delay 999
    Next
End Function
```

### 备注说明

控件属性中的“点击响应”事件函数名必须与ui事件代码中的函数名一致

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }