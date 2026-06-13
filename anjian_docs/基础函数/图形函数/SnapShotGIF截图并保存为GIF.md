# SnapShotGIF截图并保存为GIF

> 来源: https://res.anjian.com/basic/pic/SnapShotGIF.html

---

### 函数名称

SnapShotGIF截图并保存为GIF

### 函数功能

截图并保存为GIF文件

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.4.2 | 4.1.2 | 5.0.0 | 2.6.3 | ✖ |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | ✖ |

### 函数语法

SnapShotGIF(leftX,topY,rightX,bottomY,savePath,seconds\[,picsPerSec,picQuality\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| leftX | int | 是 | 识别区域的左上角x坐标 |
| topY | int | 是 | 识别区域的左上角y坐标 |
| rightX | int | 是 | 识别区域的右下角x坐标 |
| bottomY | int | 是 | 识别区域的右下角y坐标 |
| savePath | string | 是 | 保存GIF图片文件的路径 |
| seconds | int | 是 | GIF图片持续时长，单位：秒，最小值：1，最大值：60 |
| picsPerSec | int | 否 | 每秒图片帧数，默认：10，最小值：1，最大值：24 |
| picQuality | int | 否 | 图片质量，默认：50，即原图质量的50%，最小值：1，最大值：100 |

### 函数返回

无

### 代码范例

```sourceCode lua
//将范围为全屏的画面制作成1张持续5秒，每秒15帧，图片质量10%的GIF图片并保存到临时目录
Dim savePath = getTempDir() & "test.gif"
SnapShotGIF(0, 0, 0, 0, savePath, 5, 15, 10)
TracePrint dir.Exist(savePath)
```

### 备注说明

由于合成图片需要一定额外时间，函数执行时长会略大于设置的GIF图片持续时长，这与设置的图片范围大小、持续时长、帧数、图片质量有关。

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }