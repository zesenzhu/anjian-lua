# Tap 短暂点击屏幕

> 来源: https://res.anjian.com/basic/touch/Tap.html

---

### 函数名称

Tap 点击

### 函数功能

短暂点击屏幕上指定的位置

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Tap(x1,y1)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 点击横坐标x |
| y1 | int | 是 | 点击纵坐标y |

### 函数返回

无

### 代码范例

```sourceCode lua
//点击屏幕坐标100,100位置
Tap 100,100
//以上操作等同于：
TouchDown 100, 100, 1
Delay 10 //延时可按照自身实际应用场景调整
TouchUp 1
```

### 备注说明

点击坐标是通过抓抓获取的，不论你的应用画面是横屏或竖屏，一律以抓抓获取为准（实际截图会保持与你的设备分辨率一致，即手机永久返回竖屏截图，平板pad永久返回横屏截图，不论你的应用画面是横屏或竖屏）

**注意：**触屏点击(Tap x,y)操作实质是：按下(TouchDown x,y,触点ID)+等待(Delay 延时(tap为写死延时))+抬起(TouchUp 触点ID)

如遇tap点击无效，可以尝试用以上方式调整delay延时替代

查看点击是否生效可以通过画板类app或打开系统开发者选项中的显示触摸轨迹进行验证

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }