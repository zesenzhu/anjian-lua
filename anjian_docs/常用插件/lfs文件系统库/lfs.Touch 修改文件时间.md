# lfs.Touch 修改文件时间

> 来源: https://res.anjian.com/plugin/lfs/Touch.html

---

### 函数名称

lfs.Touch 修改文件时间

### 函数功能

设置文件访问

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = lfs.Touch(filePath\[,atime,mtime\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| filePath | string | 是 | 文件路径，支持相对路径和绝对路径  
相对路径：在使用 `lfs.Chdir` 设置了工作路径后，可以传入相对路径（路径开头不能有 `/`），例如：`anjian.txt`  
绝对路径：直接传入文件的绝对路径，例如：`/sdcard/com.cyjh.mobileanjian/anjian.txt` |
| atime | int | 否 | 文件的访问时间，秒级时间戳，默认为当前时间 |
| mtime | int | 否 | 文件的修改时间，秒级时间戳，默认为当前时间 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：修改成功  
false：修改失败 |

### 代码范例

```sourceCode lua
Import "lfs.lua"

Dim filePath
filePath = GetTempDir() & "anjian.txt"
File.Write(filePath, "Hello World")

TracePrint "当前文件访问时间：" & DateTime.Format("%Y-%m-%d", lfs.Attributes(filePath, "access"))
TracePrint "当前文件修改时间：" & DateTime.Format("%Y-%m-%d", lfs.Attributes(filePath, "modification"))

// 1天前的时间
Dim t = Time() - 86400
Dim ret = lfs.Touch(filePath, t, t)
If ret Then 
    TracePrint "文件时间修改成功"
    TracePrint "修改后文件访问时间：" & DateTime.Format("%Y-%m-%d", lfs.Attributes(filePath, "access"))
    TracePrint "修改后文件修改时间：" & DateTime.Format("%Y-%m-%d", lfs.Attributes(filePath, "modification"))
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }