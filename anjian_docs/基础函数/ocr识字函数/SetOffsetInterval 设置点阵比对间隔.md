# SetOffsetInterval 设置点阵比对间隔

> 来源: https://res.anjian.com/basic/ocr/SetOffsetInterval.html

---

### 函数名称

SetOffsetInterval 设置点阵比对间隔

### 函数功能

设置找字时的点阵比对间隔，即每一次匹配都跳过所设置数量的行和列进行匹配

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.1.3 | 3.1.0 | 5.0.0 | 2.0.0 | 1.2.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = SetOffsetInterval(pixelNum)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| pixelNum | int | 是 | 比对间隔的像素点数量，默认为0 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 失败：0  
成功：1 |

### 代码范例

```sourceCode lua
//设置找字时匹配的像素点行数为33行
TracePrint SetRowsNumber(33)
//设置点阵对比间隔为1，即查找前后将跳1行和1列进行查找
TracePrint SetOffsetInterval(1)
//设置附件中的s1.txt文档为1号字库
TracePrint SetDictEx(0, "Attachment:s1.txt")
//使用0号字库文件进行找字
TracePrint UseDict(0)

//相关找字、识别文字代码...

//此时找字代码的匹配行数都为33行且每次查找后都跳1行和1列进行查找
```

### 备注说明

该命令参数默认为0，即字库中的每个字的所有像素点均需要逐一进行匹配。

一般来讲，设置的值越大，找字的速度越快，但准确率下降，有可能出现查找失败的情况，请合理使用

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }