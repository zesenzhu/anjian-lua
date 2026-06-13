# TouchMove 滑动指定点

> 来源: https://res.anjian.com/basic/touch/TouchMove.html

---

### 函数名称

TouchMove 滑动

### 函数功能

模拟滑动操作

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.2.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

TouchMove(x1,y1\[,id,time\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x | int | 是 | 要移动到的目标横坐标 |
| y | int | 是 | 要移动到的目标纵坐标 |
| id | int | 否 | 默认0，这个触点的自定义ID  
建议取值范围：0-9，超出范围后在安卓12或以上系统可能无法正常使用 |
| time | int | 否 | 滑动到目标点的耗时，单位毫秒，默认100毫秒 |

### 函数返回

无

### 代码范例

```sourceCode lua
//以下是多点触控的例子
//按住屏幕上的100,100坐标不放，并设置此触点ID=1
TouchDown 100, 100, 1
//按住屏幕上的200,200坐标不放，并设置此触点ID=2
TouchDown 200, 200, 2
//将ID=1的触点花200毫秒移动至300,300坐标
TouchMove 300, 300, 1, 200
//将ID=2的触点花200毫秒移动至500,500坐标
TouchMove 500, 500, 2, 200
//松开弹起ID=1的触点
TouchUp 1
//松开弹起ID=2的触点
TouchUp 2
```

### 备注说明

坐标是通过抓抓来获取的，不论设备画面是横屏还是竖屏，所有坐标一律以抓抓显示为准。

此命令需要配合TouchDown方可有效

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }