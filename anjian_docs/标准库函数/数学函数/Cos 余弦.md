# Cos 余弦

> 来源: https://res.anjian.com/standard/math/Cos.html

---

### 函数名称

Cos 余弦

### 函数功能

计算某个角度的余弦值，参数必须使用**弧度制**

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = Cos(number)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| number | number | 是 | 以**弧度**表示的角度数值 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | number | 返回角度的余弦值 |

### 代码范例

```sourceCode lua
// 通过 cos/sin 计算圆坐标
Dim rad, pi, r, cx, cy, x, y
pi = 3.14
r = 20      // 半径
cx = 313    // 圆心 X 坐标
cy = 483    // 圆心 Y 坐标
For angle = 0 To 360
    // 将角度转换为弧度，公式：弧度 = 角度 * π / 180
    rad = angle * pi / 180
    
    // 计算圆周上的坐标
    x = cx + r * Cos(rad)
    y = cy + r * Sin(rad)
    TracePrint x, y
Next
```

### 备注说明

Cos 函数是根据弧度制来计算在水平方向上的分量，通常和 Sin 函数配合使用

**角度转换弧度公式：**角度 = 弧度 \* 180 / π

**弧度转换角度公式：**弧度 = 角度 \* π / 180

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }