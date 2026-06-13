# iOSElement.Cache 启用元素缓存

> 来源: https://res.anjian.com/expand//Cache.html

---

### 函数名称

iOSElement.Cache 启用元素缓存

### 函数功能

获取当前页面的元素节点数据到缓存，之后所有元素查找函数均在缓存中查找，直到禁用缓存后恢复从实时页面中查找

### 函数语法

result = iOSElement.Cache(isEnable,packageName)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| isEnable | bool | 是 | 是否启用，true启用，false禁用 |
| packageName | string | 否 | 启用缓存的包名，默认缓存当前页面所有包名的节点 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回响应结果信息的键值表 |

result 包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |
| data | string | 固定为空字符 |

### 代码范例

```sourceCode lua
Dim result,ranTime, selector = {"text":"通用"}
RunApp "com.apple.Preferences"
Delay 2000
ranTime = TickCount()
result = iOSElement.Find(selector)
TracePrint "耗时："& TickCount() - ranTime &"ms"
If result["code"] = 0 Then
    TracePrint Encode.TableToJson(result)
Else 
    TracePrint result["msg"]
End If

iOSElement.Cache(true)  // 对当前页面的元素数据进行缓存
iOSElement.Click ({"text":"蓝牙"})
Delay 1000
ranTime = TickCount()
result = iOSElement.Find(selector)
TracePrint "耗时："& TickCount() - ranTime &"ms"
If result["code"] = 0 Then // 因为上面对元素进行了缓存，所以这里其实是从缓存中查找，能找到【通用】这个元素
    TracePrint Encode.TableToJson(result)
Else 
    TracePrint result["msg"]
End If
iOSElement.Cache(false)
```

### 备注说明

支持版本：iOS新版引擎v2.4.2或以上版本

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }