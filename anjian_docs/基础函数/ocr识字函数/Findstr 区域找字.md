# Findstr 区域找字

> 来源: https://res.anjian.com/basic/ocr/FindStr.html

---

### 函数名称

Findstr 区域找字

### 函数功能

在屏幕范围(x1,y1,x2,y2)内,查找string(可以是任意个字符串的组合),  
并返回符合color\_format的坐标位置,  
相似度sim同Ocr接口描述.(多色,差色查找类似于Ocr接口,不再重述)

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 2.5.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = FindStr(x1,y1,x2,y2,string,color\_format,sim,intX,intY)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 区域的左上X坐标 |
| y1 | int | 是 | 区域的左上Y坐标 |
| x2 | int | 是 | 区域的右下X坐标 |
| y2 | int | 是 | 区域的右下Y坐标 |
| string | string | 是 | 待查找的字符串,可以是字符串组合， |
| color\_format | string | 是 | 颜色格式串. 可以包含换行分隔符,语法 |
| sim | float | 是 | 相似度,取值范围0.1-1.0 |
| intX | int | 是 | 变参指针，返回X坐标，没找到返回-1 |
| intY | int | 是 | 变参指针，返回Y坐标，没找到返回-1 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 返回找到的字符串索引，没找到返回-1, 索引从0开始  
比如”长安|洛阳”,若找到长安，则返回0，找到洛阳则返回1 |

### 代码范例

```sourceCode lua
TracePrint SetDictEx(0, "Attachment:s1.txt")
//设置附件中的s1.txt文档为0号字库
TracePrint UseDict(0)
//使用0号字库文件，之后的找字、识别都在这个文件点阵中匹配
Dim ret,intX,intY
ret = FindStr(0,0,2000,2000,"长安","9f2e3f-000000",1.0,intX,intY)
If intX >= 0 and intY >= 0 Then
    Tap intX,intY
End If
ret = FindStr(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9,intX,intY)
If intX >= 0 and intY >= 0 Then
     Tap intX,intY
End If
ret = FindStr(0,0,2000,2000,"长安|洛阳","9f2e3f-000000",0.9,intX,intY)
Select Case ret
Case 0
    Traceprint "找到长安"
Case 1
    Traceprint "找到洛阳"
End Select 
```

### 备注说明

字库点阵的提取使用抓抓工具来制作字库

注意字库图片的截取要在手机抓抓图片里截取，修改字库文件后记得更新到脚本附件，目前只支持直接调用放在附件中的字库文档，还不支持绝对路径

四个坐标范围都为0则默认为全屏查找，建议设置好相应的查找范围，会有效提高找字效率

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }