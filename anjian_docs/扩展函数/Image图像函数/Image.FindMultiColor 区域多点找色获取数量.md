# Image.FindMultiColor 区域多点找色获取数量

> 来源: https://res.anjian.com/expand/image/FindMultiColor.html

---

### 函数名称

Image.FindMultiColor 多点找色并返回所有结果

### 函数功能

查找多点颜色特征并返回所有符合的结果

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.2.6 | 3.2.6 | 5.0.0 | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Image.FindMultiColor(x1,y1,x2,y2,first\_color,offset\_color,dir,sim)

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

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回所有符合特征的结果 |

### 代码范例

```sourceCode lua
Dim ret = Image.FindMultiColor(100,600,700,900, "5CD9FF-020202","9|-12|526CF3-030303,25|-11|FDE37B-030303,27|15|5D87FF-030303,12|14|4F2F20-030303",0,0.9)
If Len(ret) = 0 Then 
    TracePrint "not found"
Else 
    For i = 1 To len(ret)
        TracePrint ret[i][1],ret[i][2]
        if i >= 3 then Exit For
    Next
End If
```

### 备注说明

注意：查找特征的颜色点数量应多于3个以上使得特征相对明确，以减少特征相近的干扰数据

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }