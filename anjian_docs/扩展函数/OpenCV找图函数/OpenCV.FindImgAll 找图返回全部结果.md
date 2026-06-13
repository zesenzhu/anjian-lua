# OpenCV.FindImgAll 找图返回全部结果

> 来源: https://res.anjian.com/expand/opencv/FindImgAll.html

---

### 函数名称

OpenCV.FindImgAll 找图返回全部结果

### 函数功能

使用OpenCV多尺度模板找图，返回全部结果

**与FindPic的区别：**

**OpenCV找图：**基于特征相似性的找图，允许一定几何形变或颜色差异，从而提高多分辨率容兼及抗干扰能力，容错率较高，但查找速度较慢、消耗cpu性能较大

由于允许相似性差异，查找的目标图片应尽量完整包含特征轮廓以减少特征相近的干扰数据

**FindPic找图：**基于遍历像素点颜色的找图，查找速度较快、消耗cpu性能较小，但容错率较低，适用于特征固定的静态场景

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.4.0 | 4.1.0 | 5.0.0 | 2.6.0 | ✖ |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | ✖ |

### 函数语法

result = OpenCV.FindImgAll(left, top, right, bottom, imgs, sim\[, minScale, maxScale, stepCount,options\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| left | int | 是 | 识别区域的左上角x坐标 |
| top | int | 是 | 识别区域的左上角y坐标 |
| right | int | 是 | 识别区域的右下角x坐标 |
| bottom | int | 是 | 识别区域的右下角y坐标 |
| imgs | string | 是 | 要查找的图片，支持附件和本地路径图片，多个图片用“|”分隔，查找的图片越多耗时越长 |
| sim | float | 是 | 相似度阈值，过滤此相似度以下的结果，0到1之间的小数 |
| minScale | float | 否 | 目标图片最小缩放比例，默认为 `0.5` |
| maxScale | float | 否 | 目标图片最大缩放比例，默认为 `1.5` |
| stepCount | int | 否 | 缩放查找的步数，步数越大，精度越高，但耗时越长，默认为 `5` |
| options | table | 否 | 扩展参数集合，用于额外配置和未来扩展 |

options包含的字段：

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| isGray | bool | 是否使用灰度图：true=是，false=否（使用原图），默认：true  
该参数支持版本：安卓版v4.1.1、iOS新版引擎v2.6.0或以上版本 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回执行结果信息的键值表 |

result 包含的字段：

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |
| data | table | 返回找图结果数组键值表，如存在n个结果，则table长度为n |

data 包含的字段：

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| x | int | 识别到目标图片的左上角x坐标 |
| y | int | 识别到目标图片的左上角y坐标 |
| w | int | 识别到目标图片的范围宽度 |
| h | int | 识别到目标图片的范围高度 |
| pic | string | 识别到目标图片的名称（含路径） |
| score | float | 识别到目标图片的相似度，0到1之间的小数 |
| index | int | 识别到目标图片在图片参数中的序号，索引从1开始  
支持返回该字段版本：安卓版v4.1.3、iOS新版引擎v2.6.2或以上版本 |

### 代码范例

```sourceCode lua
Dim dirPath = GetTempDir() & "test/",picPath = dirPath & "000.png" 
Dim ret,ranTime
PutAttachment dirPath, "*"
TracePrint dir.Exist(picPath)
ranTime = TickCount()
ret = OpenCV.FindImgAll(0,0,0,0, picPath & "|Attachment:111.png|Attachment:222.png|Attachment:333.png|Attachment:444.png", 0.8, 0.9, 1.2, 10,{"isGray":false})
TracePrint TickCount() - ranTime
If ret["code"] = 0 Then 
    For i = 1 to len(ret["data"])
        TracePrint "识别到图片：" & ret["data"][i]["pic"] &_
        ",左上角x坐标：" & ret["data"][i]["x"] &_
        ",左上角y坐标：" & ret["data"][i]["y"] &_
        ",区域宽：" & ret["data"][i]["w"] &_
        ",区域高：" & ret["data"][i]["h"] &_
        ",可信度：" & ret["data"][i]["score"] &_
        ",图片序号：" & ret["data"][i]["index"]
    Next    
Else 
    TracePrint ret["msg"]
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }