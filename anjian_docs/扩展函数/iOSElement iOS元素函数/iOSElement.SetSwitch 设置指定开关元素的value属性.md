# iOSElement.SetSwitch 设置指定开关元素的value属性

> 来源: https://res.anjian.com/expand//SetSwitch.html

---

### 函数名称

iOSElement.SetSwitch 设置指定开关元素的value属性

### 函数功能

设置指定开关元素的value属性，支持完整目标元素节点或者元素查找条件，如查找到多个元素则只操作第一个元素

支持版本：iOS新版引擎v2.5.0或以上版本

### 函数语法

result = iOSElement.SetSwitch(element, value\[, isAnimated\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| element | table | 是 | 完整目标元素节点或者元素查找条件，元素type类型必须是：UISwitch |
| value | bool | 是 | 要设置的属性值，true：开启，false：关闭 |
| isAnimated | bool | 否 | 是否显示过渡动画，默认为true |

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
Dim selector,result,parentElement,subElement
RunApp "com.apple.Preferences"
Delay 1000
selector = {"text":"飞行模式", "type":"PSSwitchTableCell"}
result = iOSElement.Find(selector)
If result["code"] = 0 Then 
    parentElement = result["data"]
Else 
    TracePrint "没有找到元素"
    ExitScript
End If

selector = {"type":"UISwitch"}
result = iOSElement.FindChild(parentElement, selector)
If result["code"] = 0 Then 
    subElement = result["data"]
Else 
    TracePrint "没有找到子元素"
    ExitScript
End If

//开启飞行模式，不展示动画
result = iOSElement.SetSwitch(subElement, true,false)
TracePrint Encode.TableToJson(result)
Delay 2000
//关闭飞行模式，展示动画
result = iOSElement.SetSwitch(subElement, false)
TracePrint Encode.TableToJson(result)
```

### 备注说明

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }