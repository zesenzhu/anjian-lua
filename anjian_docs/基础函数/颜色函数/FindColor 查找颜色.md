# FindColor 查找颜色

> 来源: https://res.anjian.com/basic/color/FindColor.html

---

### 函数名称

FindColor 范围找色

### 函数功能

在指定区域内查找指定的颜色

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.5.3 | 5.0.0 | 2.0.0 | 1.7.1 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = FindColor(x1, y1, x2, y2, color,dir,sim,intX,intY)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 区域左上角x坐标 |
| y1 | int | 是 | 区域左上角y坐标 |
| x2 | int | 是 | 区域右下角x坐标 |
| y2 | int | 是 | 区域右下角y坐标 |
| color | string | 是 | 要对比的16进制颜色，格式为 `BBGGRR` 多个颜色用 `|` 分割  
如果需要对比偏色，则中间用`-`号分隔，比如：“FFFFFF|00FF00-101010” |
| sim | float | 是 | 相似度，取值范围0-1 |
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
| ret | int | 返回找到的颜色的序号，从0开始索引，没找到返回-1 |

### 代码范例

```sourceCode lua
Dim intX,intY, ret
FindColor 0,0,0,0,"123456-000000|aabbcc-030303|ddeeff-202020",0,0.8,intX,intY
If intX > -1 then
    Traceprint "找到"
Else
    Traceprint "没有找到"
End If

//返回找到的颜色序号
ret = FindColor(0, 0, 0, 0, "0000FF-101010|FFFFFF-000000|FF00FF", 0, 0.9, intX, intY)
If ret > -1 Then
    TracePrint "找到的颜色序号为" & ret & ",坐标在" & intX & "," & intY
Else
    TracePrint "全部没找到"
End If
```

### 备注说明

当区域范围均为0时，表示全屏查找颜色

偏色是微调，指对RBG三色分别确定取色范围

相似度是粗调，指对颜色整体做百分比判断

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }