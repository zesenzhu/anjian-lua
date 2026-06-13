# dir.Rename 重命名文件

> 来源: https://res.anjian.com/expand/dir/Rename.html

---

### 函数名称

dir.Rename 重命名文件或文件夹

### 函数功能

重命名文件或文件夹并可使其移动到另一个文件路径中保存

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = dir.Rename(dir1,dir2)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| dir1 | string | 是 | 原文件或文件夹路径 |
| dir2 | string | 是 | 新文件或文件夹路径 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：成功  
false：失败 |

### 代码范例

```sourceCode lua
Dim ret,content = "我爱你"
Dim filePath = GetTempDir() & "anjian.txt",filePathNew = GetTempDir() & "anjianNew.txt"
//先将内容写入到文本中
File.Write filePath, content
If Dir.Exist(filePath) = 0 Then TracePrint "file isnt exist"
//将路径1文件重命名并移动到文件路径2中
TracePrint Dir.Rename(filePath, filePathNew)
If Dir.Exist(filePathNew) = 0 Then TracePrint "fileNew isnt exist"
//读取文件路径2中的文本内容
ret = file.Read(filePathNew)
TracePrint ret
//返回0说明原路径文件不存在即已被移走
TracePrint Dir.Exist(filePath)
```

### 备注说明

可以使用RE管理器之类的安卓应用来查看手机文件路径

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }