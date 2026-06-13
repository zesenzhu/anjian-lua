# Image.BinaryzationImg 图片二值化

> 来源: https://res.anjian.com/expand/image/BinaryzationImg.html

---

### 函数名称

Image.BinaryzationImg 图片二值化

### 函数功能

返回本地指定图片二值化数据

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Image.BinaryzationImg(imgPath, value)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| imgPath | string | 是 | 本地图片路径 |
| value | int | 是 | 将图像二值化的灰度值阈值，取值范围：0-255  
小于阈值则将该点颜色置为黑色（即：0,0,0）  
大于等于阈值则将该点颜色置为白色（即：255,255,255）  
灰度值计算公式：value = int(0.299 \* r + 0.514 \* g + 0.114 \* b) |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回二值化后的图像颜色数据，返回格式：  
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
Dim value = 150,imgPath = GetTempDir() & "test.png"
TracePrint dir.Exist(imgPath)
Dim ret = Image.BinaryzationImg(imgPath, value)
TracePrint len(ret) //输出长度为100，即图像的宽度为100
TracePrint len(ret[1]) //输出长度为50，即图像的高度为50
TracePrint ret[1][1][3],ret[1][1][2],ret[1][1][1]   //输出第一个点0,0二值化后的r、g、b颜色分量值
TracePrint UCase(Hex(RGB(ret[1][1][3],ret[1][1][2],ret[1][1][1]))) //输出第一个点0,0二值化后的bgr十六进制颜色值
ret = Null //注意：当变量ret不再使用时，请用Null释放空间，防止内存溢出导致崩溃
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }