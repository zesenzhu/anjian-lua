# Image.PicFindMultiColor 二值化图片区域多点找色

> 来源: https://res.anjian.com/expand/image/PicFindMultiColor.html

---

### 函数名称

Image.PicFindMultiColor 二值化图片区域多点找色

### 函数功能

对二值化后的图片进行多点找色，返回第一个找到的特征坐标

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Image.PicFindMultiColor(imgPath,x1, y1, x2, y2, firstColor, offsetColor)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| imgPath | string | 是 | 待找色的二值化后图片路径 |
| x1 | int | 是 | 以图片左上角为起点0,0的查找区域的左上x相对坐标，参数2-5都传0则表示在全图范围内查找 |
| y1 | int | 是 | 查找区域的左上y相对坐标 |
| x2 | int | 是 | 查找区域的右下x相对坐标 |
| y2 | int | 是 | 查找区域的右下y相对坐标 |
| firstColor | int | 是 | 需查找颜色特征第一个点的颜色，0：黑色，255：白色 |
| offsetColor | string | 是 | 偏移点的颜色特征，格式为： `偏移x坐标|偏移y坐标|十进制颜色值` ，多个偏移点用 `,` 分割 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回第一个找到的特征坐标，未找到则返回：\[-1,-1\] |

### 代码范例

```sourceCode lua
Dim ret,value = 150,imgPath = GetTempDir() & "test.png"
ret = Image.Binaryzation(271,60,475,138, value)
Image.SavePixelData(ret, imgPath) //保存二值化后图像数据到本地文件
if dir.Exist(imgPath) = 0 then TracePrint "img isnt exist"
ret = Image.PicFindMultiColor(imgPath,0, 0, 0, 0, 255,"23|10|255,12|1|255,138|-3|255")
If ret[1] > -1 Then 
    TracePrint ret[1],ret[2]
Else 
    TracePrint "not found"
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }