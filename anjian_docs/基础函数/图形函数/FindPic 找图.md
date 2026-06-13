# FindPic 找图

> 来源: https://res.anjian.com/basic/pic/FindPic.html

---

### 函数名称

FindPic 找图

### 函数功能

查找指定的图片，支持多图、偏色、相似度查找，支持查找透明图，只返回第一个找到的图片序号与坐标

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = FindPic(x1,y1,x2,y2,pic\_name,delta\_color,dir,sim,intX,intY)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 区域左上角x坐标 |
| y1 | int | 是 | 区域左上角y坐标 |
| x2 | int | 是 | 区域右下角x坐标 |
| y2 | int | 是 | 区域右下角y坐标 |
| pic\_name | string | 是 | 要找的图片名称，多个图片用 `|` 分割，支持附件和本地路径：  
附件路径：开头固定字符串：“Attachment:”，例如：“Attachment:1.png”  
本地路径：本地绝对路径，例如：“/storage/emulated/0/1.png” |
| delta\_color | string | 是 | 偏色，16进制字符串 |
| sim | float | 是 | 相似度,取值范围0-1 |
| dir | int | 是 | 查找方向  
0：从左上向右下  
1：从中心往四周查找  
2：从右下向左上查找  
3：从左下向右上查找  
4：从右上向左下查找 |
| intX | int | 是 | 存储返回的x坐标 |
| intY | int | 是 | 存储返回的y坐标 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 返回找到的图片序号，从0开始索引，如果没找到返回-1 |

### 代码范例

```sourceCode lua
Dim intX, intY,ret
FindPic 0, 0, 0, 0, "Attachment:1.png","000000",0, 0.8, intX, intY
If intX >-1 then
    TracePrint "找到，坐标：" & intX & "," & intY
Else
    TracePrint "没找到"
End If

//返回找到的图片序号
Dim imgPath = GetSdcardDir() & "/test.png"
SnapShotEx imgPath,101,101,200,200,0
TracePrint dir.Exist(imgPath)
ret = FindPic(0, 0, 0, 0, "Attachment:1.png|Attachment:2.png|"&imgPath,"000000",0, 0.8, intX, intY)
If ret >- 1 then
    TracePrint "找到，图片序号：" & ret & ",坐标：" & intX & "," & intY
Else
    TracePrint "全部没找到"
End If
```

### 备注说明

当区域范围均为0时，表示全屏查找

偏色是微调，指对RBG三色分别计算是否在偏色范围内

相似度是粗调，指对RBG颜色整体偏色做百分比判断

透明图是指当图片4个角的颜色均相同时，则这张图片中的所有这个颜色将被视为透明色，在找图匹配点过程中，将忽略这些点的颜色（实际视为匹配通过）

PNG格式图片中的透明点匹配逻辑同以上透明色

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }