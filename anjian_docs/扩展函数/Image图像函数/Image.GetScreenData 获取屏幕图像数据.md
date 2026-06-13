# Image.GetScreenData 获取屏幕图像数据

> 来源: https://res.anjian.com/expand/image/GetScreenData.html

---

### 函数名称

Image.GetScreenData 获取屏幕颜色数据

### 函数功能

获取屏幕指定范围内的颜色数据

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.2.6 | 3.2.6 | 5.0.0 | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Image.GetScreenData(x1,y1,x2,y2)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| x1 | int | 是 | 区域左上x坐标 |
| y1 | int | 是 | 区域左上y坐标 |
| x2 | int | 是 | 区域右下x坐标 |
| y2 | int | 是 | 区域右下y坐标 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回屏幕的颜色数据，返回格式：  
ret = \[  
\[ //第1列  
\[b, g, r\], //第1行像素的颜色值  
\[b, g, r\], //第2行像素的颜色值  
… //更多行…  
\],  
\[ //第2列  
\[b, g, r\], //第1行像素的颜色值  
\[b, g, r\], //第2行像素的颜色值  
… //更多行…  
\],  
… //更多列…  
\]  
  
`ret[x][y]` 表示图片中 **第 x 列、第 y 行** 的像素点颜色  
每个像素点以 `[b, g, r]` 形式返回（**BGR 顺序**）  
len(ret)即为图像的宽度（像素数，从左到右）  
len(ret\[1\])即为图像的高度（像素数，从上到下） |

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

获取屏幕图像数据存储在三维数组中，后期可自由扩展图像处理功能。  
注意：图像数据会占用内存，不需要时可以使用Null释放，如：数组 = Null

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }