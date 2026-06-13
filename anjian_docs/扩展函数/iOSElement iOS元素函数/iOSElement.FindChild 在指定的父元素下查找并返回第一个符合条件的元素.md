# iOSElement.FindChild 在指定的父元素下查找并返回第一个符合条件的元素

> 来源: https://res.anjian.com/expand//FindChild.html

---

### 函数名称

iOSElement.FindChild 在指定的父元素下查找并返回第一个符合条件的元素

### 函数功能

在指定的父元素下查找并返回第一个符合条件的元素信息键值表

### 函数语法

result = iOSElement.FindChild(parent, selector\[, isRegex\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| parent | table | 是 | 父元素节点键值表 |
| selector | table | 是 | 元素的查找条件 |
| isRegex | bool | 否 | 是否使用正则匹配查找，只支持text属性 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回响应结果信息的键值表 |

result 包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |
| data | table | 找到的第一个符合条件的元素节点键值表 |

### 代码范例

```sourceCode lua
Dim result, parent, selector
RunApp "com.apple.Preferences"
Delay 1000
parent = {"type": "UITableViewCellContentView"}
selector = {"id":"UITableViewLabel"}
result = iOSElement.Find(parent)
If result["code"] = 0 Then 
    result = iOSElement.FindChild(result["data"], selector)
    If result["code"] = 0 Then 
        TracePrint Encode.TableToJson(result["data"])
    Else 
        TracePrint result["msg"]
    End If
Else 
    TracePrint result["msg"]
End If

// 使用正则匹配模糊查找
parent = {"index": 55}
selector = {"text":"[\\u4e00-\\u9fa5]"} '匹配中文
result = iOSElement.Find(parent)
If result["code"] = 0 Then 
    result = iOSElement.FindChild(result["data"], selector, true)
    If result["code"] = 0 Then 
        TracePrint Encode.TableToJson(result["data"])
    Else 
        TracePrint result["msg"]
    End If
Else 
    TracePrint result["msg"]
End If
```

### 备注说明

支持版本：iOS新版引擎v2.3.0或以上版本

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }