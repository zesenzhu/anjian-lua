# Xml.GetTag 获取 XML 的标签名

> 来源: https://res.anjian.com/plugin/xml/GetTag.html

---

### 函数名称

Xml.GetTag 获取 XML 的标签名

### 函数功能

获取指定 XML 的标签名称

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

tag= Xml.GetTag(xmlData)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| xmlData | table | 是 | XML 数据对象 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| tag | string | 返回 XML 的标签名称 |

### 代码范例

```sourceCode lua
Import "Xml.lua"

Dim xmlNode, xmlStr

xmlStr = "<bookstore>" &_
    "<book id=""1"" category=""fiction""></book>" &_
    "<book id=""2"" category=""science""></book>" &_
    "<book id=""3"" category=""programming""></book>" &_
    "</bookstore>"

xmlNode = Xml.ParseByXmlStr(xmlStr)
If xmlNode Then 
    xmlNode = Xml.Find(xmlNode, null, "category", "programming")
    If xmlNode Then 
        TracePrint "找到的节点的标签为：" & Xml.GetTag(xmlNode)
    End If
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }