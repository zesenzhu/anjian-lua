# PutAttachment 释放附件

> 来源: https://res.anjian.com/basic/other/PutAttachment.html

---

### 函数名称

PutAttachment 释放附件

### 函数功能

将当前脚本附件释放到指定目录下

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

PutAttachment path\[,fileName\]

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| path | string | 是 | 释放路径，路径需存在否则会释放失败  
路径为null或空字符串”“时，会将附件释放到按键精灵的临时文件目录下，目录路径可以通过GetTempDir() 获得 |
| fileName | string | 否 | 要释放的文件名，支持只释放一个或多个文件，支持通配符 \* 和 ?  
文件名为null或空字符串”“时，将释放本脚本附件中的所有文件 |

### 函数返回

无

### 代码范例

```sourceCode lua
//把所有扩展名为png的文件释放到按键精灵的临时文件目录下。 
PutAttachment "", "*.png"

//释放所有附件到sd卡指定目录
Dim path = GetSdcardDir() & "/test/"
if dir.Exist(path) = 0 then dir.Create path
PutAttachment path, ""
TracePrint dir.Exist(path & "111.png")
```

### 备注说明

通配符 \* ：匹配零个或多个任意字符

通配符 ? ：匹配恰好一个任意字符

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }