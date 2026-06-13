# SetRowsNumber 设置特征匹配像素点行数

> 来源: https://res.anjian.com/basic/ocr/SetRowsNumber.html

---

### 函数名称

SetRowsNumber 设置特征匹配像素点行数

### 函数功能

设置找字时算法匹配的像素点行数(默认为11行)

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.3 | 3.1.0 | 5.0.0 | 2.0.0 | 1.2.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = SetRowsNumber(rowsNum)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| rowsNum | int | 是 | 匹配的像素点行数，默认为11 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 失败：0  
成功：1 |

### 代码范例

```sourceCode lua
//设置后面所有找字代码找字时匹配的像素点行数为33行
TracePrint SetRowsNumber(33)
//设置附件中的s1.txt文档为0号字库
TracePrint SetDictEx(0, "Attachment:s1.txt")
//使用0号字库文件进行找字，此时后面找字代码的匹配行数都为33行
TracePrint UseDict(0)

//相关找字、识别文字代码（匹配行数33行）

//重新设置后面所有找字代码找字时匹配的行数为20行
TracePrint SetRowsNumber(20)

//相关找字、识别文字代码（匹配行数20行）
```

### 备注说明

注意：该命令针对新字库有效（版本号3.1.0支持）,与SetDictEx配合使用，针对旧字库的找字，设置该值没有意义。

一般来讲，设置的值越大，找字的速度越快，但准确率下降，有可能出现查找失败的情况，请合理使用该命令。

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }