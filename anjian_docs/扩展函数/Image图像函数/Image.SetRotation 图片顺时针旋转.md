# Image.SetRotation 图片顺时针旋转

> 来源: https://res.anjian.com/expand/image/SetRotation.html

---

### 函数名称

Image.SetRotation 图片顺时针旋转

### 函数功能

获取将图片按照顺时针方向旋转后的颜色数据

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Image.SetRotation(path, degrees)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| path | string | 是 | 图片路径 |
| degrees | int | 是 | 顺时针旋转度数，有效值：90、180、270，其他值将置为90 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回图片的颜色数据，返回格式：  
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
Dim ret,blue,green,red,imgPath = GetTempDir() & "test.png",imgPathNew
SnapShot imgPath,0,0,99,99
ret = Image.GetPicData(imgPath)
blue = ret[1][1][1]
green = ret[1][1][2]
red = ret[1][1][3]
TracePrint "旋转前第一个点0,0的b、g、r颜色分量值：" & blue,green,red
TracePrint "旋转前第一个点0,0的bgr十六进制颜色值：" & UCase(Hex(RGB(red,green,blue)))
creatFw() :Delay 1500 //创建悬浮窗并查看图片旋转效果

For i = 90 To 270 Step 90
    ret = Image.SetRotation(imgPath, i) //获取旋转后颜色数据
    blue = ret[1][1][1]
    green = ret[1][1][2]
    red = ret[1][1][3]
    TracePrint "旋转"& i & "度后第一个点0,0的b、g、r颜色分量值："& blue,green,red
    TracePrint "旋转"& i & "度后第一个点0,0的bgr十六进制颜色值："& UCase(Hex(RGB(red,green,blue)))
    imgPathNew = GetTempDir() & i & "test.png"
    Image.SavePixelData ret,imgPathNew //保存旋转后颜色数据为本地图片并设置到悬浮窗
    if dir.Exist(imgPathNew) = 0 then TracePrint "img isnt exist"
    FW.SetImageView "图像内容", imgPathNew, 0, 0, 100, 100
    Delay 1500
Next

ret = Null //注意：当变量ret不再使用时，请用Null释放空间，防止内存溢出导致崩溃

Function creatFw()
    FW.NewFWindow("浮窗名", 0, 300, 100, 100)
    FW.AddImageView("浮窗名", "图像内容", imgPath, 0, 0, 100, 100)
    FW.Show("浮窗名")
End Function
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }