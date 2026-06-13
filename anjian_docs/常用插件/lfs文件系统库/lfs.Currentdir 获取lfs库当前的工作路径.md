# lfs.Currentdir 获取lfs库当前的工作路径

> 来源: https://res.anjian.com/plugin/lfs/Currentdir.html

---

### 函数名称

lfs.Currentdir 获取lfs库当前的工作路径

### 函数功能

获取lfs库当前的工作路径

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

dir = lfs.Currentdir()

### 函数参数

无

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| dir | string | 返回当前lfs库的工作路径，默认返回按键的临时目录 `GetTempDir()`  
**注意：** `Chdir()` 命令设置工作目录后，如果目录被删除，则返回 `null` |

### 代码范例

```sourceCode lua
Import "lfs.lua"

Dim filePath
filePath = GetTempDir() & "anjian.txt"
If Dir.Exist(filePath) = 0 Then 
    File.Write filePath, "Hello World"
End If

lfs.Chdir (GetTempDir())
TracePrint "当前lfs库的工作目录是：" & lfs.Currentdir()

// 直接使用相对路径
Dim fileSize = lfs.Attributes("anjian.txt", "size")
TracePrint "文件大小：" & fileSize
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }