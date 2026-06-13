# FindMultiColor 多点找色

> 来源: https://res.anjian.com/basic/color/FindMultiColor.html

---

### 函数名称

FindMultiColor 多点找色

### 函数功能

在指定范围内查找多特征点颜色坐标（起点色坐标在查找范围内即可，偏移色坐标不限制必须在查找范围内）

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.5.3 | 5.0.0 | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

FindMultiColor(x1,y1,x2,y2,first\_color,offset\_color,dir,sim,intX,intY)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 查找区域左上x坐标 |
| y1 | int | 是 | 查找区域左上y坐标 |
| x2 | int | 是 | 查找区域右下x坐标 |
| y2 | int | 是 | 查找区域右下y坐标 |
| first\_color | string | 是 | 第一个点的颜色特征，用十六进制字符串表示的颜色，格式为 `BBGGRR` ，多个颜色用 `|` 分割 |
| offset\_color | string | 是 | 偏移点的颜色特征，格式为： `偏移x坐标|偏移y坐标|颜色值-偏色` ，多个偏移点用 `,` 分割  
如果需要对比偏色，则中间用`-`号分隔，比如：“FFFFFF|00FF00-101010” |
| dir | int | 是 | 查找方向  
0：从左上向右下  
1：从中心往四周查找  
2：从右下向左上查找  
3：从左下向右上查找  
4：从右上向左下查找 |
| sim | float | 是 | 相似度，取值范围：0-1.0 |
| intX | int | 是 | 存储返回的x坐标 |
| intY | int | 是 | 存储返回的y坐标 |

### 函数返回

无

### 代码范例

```sourceCode lua
Dim intX,intY
FindMultiColor 0,0,0,0,"FFFFFF","4|1|2F9772-000000|123456-101010,3|7|378757",0,0.9,intX,intY
If intX > -1 Then
    TracePrint "找到啦，坐标在"&intX&","&intY
Else
    TracePrint "没找到"
End If
```

### 备注说明

当区域范围均为0时，表示全屏查找颜色

偏色是微调，指对RBG三色分别确定取色范围

相似度是粗调，指对颜色整体做百分比判断

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }