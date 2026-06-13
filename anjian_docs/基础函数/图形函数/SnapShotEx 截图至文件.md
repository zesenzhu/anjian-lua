# SnapShotEx 截图至文件

> 来源: https://res.anjian.com/basic/pic/SnapShotEx.html

---

### 函数名称

SnapShotEx 截图至文件

### 函数功能

截屏并保存为JPG文件，可压缩图片质量

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.3.8 | 3.3.8 | 5.0.0 | 2.0.0 | 1.6.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

SnapShotEx imgPath\[,x1,y1,x2,y2,ratio\]

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| imgPath | string | 是 | 截取图片的保存路径 |
| x1 | int | 否 | 区域左上角x坐标 |
| y1 | int | 否 | 区域左上角y坐标 |
| x2 | int | 否 | 区域右下角x坐标 |
| x2 | int | 否 | 区域右下角y坐标 |
| ratio | int | 否 | 压缩比，取值范围：0-100，默认值：75，数值越大，图片质量越低，传0则不压缩 |

### 函数返回

无

### 代码范例

```sourceCode lua
//例子1,全屏截图,命名为test.jpg并保存至按键临时目录
Dim imgPath = GetTempDir() & "/test.jpg"
SnapShotEx imgPath
TracePrint dir.Exist(imgPath),Encode.TableToJson(Image.Size(imgPath))
```

```sourceCode lua
//例子2,只截取屏幕左上角101,101到右下角300,300范围图片,压缩比50，命名为test.jpg并保存至按键临时目录
Dim imgPath = GetTempDir() & "/test.jpg"
SnapShotEx imgPath, 101, 101, 300, 300,10
TracePrint dir.Exist(imgPath),Encode.TableToJson(Image.Size(imgPath)),File.bytes(imgPath)

SnapShotEx imgPath, 101, 101, 300, 300,80
TracePrint dir.Exist(imgPath),Encode.TableToJson(Image.Size(imgPath)),File.bytes(imgPath)
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }