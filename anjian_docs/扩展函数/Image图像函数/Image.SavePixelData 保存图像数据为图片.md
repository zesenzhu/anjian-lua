# Image.SavePixelData 保存图像数据为图片

> 来源: https://res.anjian.com/expand/image/SavePixelData.html

---

### 函数名称

Image.SavePixelData 保存图像数据为图片

### 函数功能

保存图像数据为图片

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Image.SavePixelData(pixelData,path)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| pixelData | table | 是 | 从屏幕或图片中获取的图像表数据 |
| path | string | 是 | 图片保存路径 |

### 函数返回

无

### 代码范例

```sourceCode lua
Dim ret,blue,green,red,savePath = GetTempDir() & "test.png"
ret = Image.GetScreenData(101,101,300,300) //获取指定屏幕范围内颜色数据
blue = ret[1][1][1]
green = ret[1][1][2]
red = ret[1][1][3]
TracePrint blue,green,red   //输出第一个点0,0的b、g、r颜色分量值
TracePrint UCase(Hex(RGB(red,green,blue))) //输出第一个点0,0的bgr十六进制颜色值
Image.SavePixelData(ret, savePath) //保存颜色数据到本地图片
If dir.Exist(savePath) = 0 then TracePrint "img isnt exist"
ret = Null //注意：当变量PixelData不再使用时，请用Null释放空间，防止内存溢出导致崩溃
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }