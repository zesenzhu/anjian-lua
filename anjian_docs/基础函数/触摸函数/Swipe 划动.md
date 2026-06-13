# Swipe 划动 

> 来源: https://res.anjian.com/basic/touch/Swipe.html

---

### 函数名称

Swipe 划动

### 函数功能

模拟手指在屏幕上的划动操作，按照设定划动延时，从点1划动到点2

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Swipe(x1,y1,x2,y2\[,time\])

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 划动的起点x坐标 |
| y1 | int | 是 | 划动的起点y坐标 |
| x2 | int | 是 | 划动的终点x坐标 |
| y2 | int | 是 | 划动的终点y坐标 |
| time | int | 是 | 划动耗时(可省略),单位毫秒,省略默认为100毫秒 |

### 函数返回

无

### 代码范例

```sourceCode lua
//用300毫秒的时间，从点100,100划动到点200,200
Swipe 100,100,200,200,300
```

### 备注说明

坐标是通过抓抓来获取的，不管你的设备画面是横屏还是竖屏，所有坐标一律都是以抓抓显示为准。

滑动(Swipe x1,y1,x2,y2)操作本质是：按下(TouchDown x,y,标记)+等待(Delay 毫秒)+移动(TouchMove x,y,标记)+等待(Delay 毫秒,已被固定写死)+弹起(TouchUp 标记)

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }