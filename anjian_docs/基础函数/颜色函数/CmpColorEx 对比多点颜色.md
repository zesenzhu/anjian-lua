# CmpColorEx 对比多点颜色

> 来源: https://res.anjian.com/basic/color/CmpColorEx.html

---

### 函数名称

CmpColorEx 对比多个点颜色

### 函数功能

同时比较指定的多个坐标点的颜色，支持多色、偏色、相似度比较

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.5.3 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = CmpColorEx(mul\_color,sim)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| mul\_color | string | 是 | 需要对比的点坐标和16进制颜色，坐标和颜色用 `|` 连接，支持偏色，多组颜色用 `,` 连接  
格式：`x坐标|y坐标|颜色-偏色,x坐标|y坐标|颜色-偏色` |
| sim | float | 是 | 相似度,取值范围0-1 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 返回0代表没找到，返回1代表找到 |

### 代码范例

```sourceCode lua
// 对比坐标300,500颜色是否是FFFFFF或者FF00FF，偏色202020
If CmpColorEx("300|500|FFFFFF|FF00FF-202020",0.9) = 1 Then
    TracePrint "颜色相等"
Else
    TracePrint "颜色不符合"
End If

// 对比坐标300,500颜色是否是FFFFFF，坐标400,600的颜色是否是FF00FF
If CmpColorEx("300|500|FFFFFF,400|600|FF00FF",0.9) = 1 Then
    TracePrint "全部点颜色相等"
Else
    TracePrint "有一个或多个颜色不符合"
End If
```

### 备注说明

偏色是微调，指对RBG三色分别确定取色范围

相似度是粗调，指对颜色整体做百分比判断

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }