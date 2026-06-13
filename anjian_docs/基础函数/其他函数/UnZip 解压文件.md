# UnZip 解压文件

> 来源: https://res.anjian.com/basic/other/UnZip.html

---

### 函数名称

UnZip解压文件

### 函数功能

解压文件到指定目录

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.6.3 | 4.2.0 | 5.0.0 | 2.0.0 | 1.6.6 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = UnZip(zipPath,releasePath\[,password\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| zipPath | string | 是 | 压缩包文件路径，暂只支持zip格式 |
| releasePath | string | 是 | 释放路径，路径需存在，否则请自行创建 |
| password | string | 否 | 解压密码  
注意：该参数支持版本：安卓版v4.2.0，iOS新版引擎v2.3.0或以上版本 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | bool | 执行结果，true：成功，false：失败 |

### 代码范例

```sourceCode lua
Dim filePath,savePath,releasePath,password,result
filePath = "/mnt/shared/Pictures/test/"
savePath = "/mnt/shared/Pictures/test.zip"
releasePath = "/mnt/shared/Pictures/test1/"
password = "a123456"
TracePrint dir.Exist(filePath)

result = Zip(filePath, savePath, password)
TracePrint result
TracePrint dir.Exist(savePath)
result = UnZip(savePath, releasePath, password)
TracePrint result
TracePrint dir.Exist(releasePath)
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }