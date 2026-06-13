# CatchTouchPoint 获取用户点击坐标

> 来源: https://res.anjian.com/basic/touch/CatchTouchPoint.html

---

### 函数名称

CatchTouchPoint 获取用户点击坐标

### 函数功能

获取屏幕上点击的坐标，执行该函数后将进入阻塞状态直到点击屏幕任意位置后恢复执行

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.2.6 | 3.2.6 | ✖ | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | ✖ | 13.0 | 8.0 |

### 函数语法

ret = CatchTouchPoint(number)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| number | int | 是 | 设置需要获取的点击次数 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回点击的屏幕坐标 |

### 代码范例

```sourceCode lua
//获取用户点击坐标，3次（执行该函数后将进入阻塞状态直到点击屏幕任意位置后恢复执行）
dim ret = CatchTouchPoint(3)
//遍历获取到的坐标
For i = 1 To Len(ret)
    TracePrint ret[i][1],ret[i][2]
Next
```

### 备注说明

注意：此命令存在设备兼容问题，获取的坐标可能会不准确。

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }