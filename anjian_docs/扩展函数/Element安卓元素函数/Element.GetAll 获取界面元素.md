# Element.GetAll 获取界面元素

> 来源: https://res.anjian.com/expand/element/GetAll.html

---

### 函数名称

Element.GetAll 获取界面元素

### 函数功能

获取当前界面元素内容并返回键值表

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.5.8 | 3.5.8 | 5.0.0 | ✖ | 1.0.0 |
| 最低系统版本 | windows 7 | 5.0 | 7.0 | ✖ | 8.0 |

### 函数语法

ret = Element.GetAll()

### 函数参数

无

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 包含以下字段：  
text：文字内容  
class：类名  
resource-id：资源ID  
left：左上角x坐标  
top：左上角y坐标  
right：右下角x坐标  
bottom：右下角y坐标 |

### 代码范例

```sourceCode lua
Dim ret = Element.GetAll()
TracePrint Encode.TableToJson(ret)
If Len(ret) = 0 Then
    TracePrint "not found"
Else 
    //打印第一个元素属性内容
    TracePrint "文本内容：" & ret[1]["text"] &_
    "，类名：" & ret[1]["class"] &_
   "，资源ID：" & ret[1]["resource-id"] &_
   "，左上角x坐标：" & ret[1]["left"] &_
   "，左上角y坐：" & ret[1]["top"] &_
   "，右下角x坐标：" & ret[1]["right"] &_
   "，右下角y坐标：" & ret[1]["bottom"]
End If
```

### 备注说明

iOS新版请使用iOSElement函数

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }