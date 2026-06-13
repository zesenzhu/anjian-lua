# ML.RunCoreMl 运行识别目标

> 来源: https://res.anjian.com/expand/ml/RunCoreMl.html

---

### 函数名称

ML.RunCoreMl 运行识别目标

### 函数功能

运行神经网络引擎识别匹配指定范围内的目标对象并返回结果

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.0.2 | ✖ | ✖ | 2.1.0 | ✖ |
| 最低系统版本 | windows 7 | ✖ | ✖ | 13.0 | ✖ |

**支持机型**：iPhone7或以上

### 函数语法

ret = ml.runCoreMl(index,left,top,right,bottom\[,options\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| index | int | 是 | 运行识别的模型索引序号，建议取值范围：0-9 |
| left | int | 是 | 识别区域的左上角x坐标 |
| top | int | 是 | 识别区域的左上角y坐标 |
| right | int | 是 | 识别区域的右下角x坐标 |
| bottom | int | 是 | 识别区域的右下角y坐标 |
| options | table | 否 | 扩展参数集合，用于额外配置和未来扩展 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回响应结果信息的键值表 |

ret包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |
| data | table | 识别到结果内容的键值表 |

data 包含的字段：

| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| label | string | 识别到目标的标签字符串 |
| x | int | 识别到目标的左上角x坐标 |
| y | int | 识别到目标的左上角y坐标 |
| w | int | 识别到目标的范围宽度 |
| h | int | 识别到目标的范围高度 |
| score | float | 识别到目标的可信度，0到1之间的小数 |

### 代码范例

```sourceCode lua
//例1：设置并运行.mlpackage格式模型
Dim ranTime,ret
//将模型文件下载或通过附件释放到本地均可
PutAttachment "", "*"
Dim modelPath = GetTempDir() & "yolov8n.mlpackage"
Dim modelZipPath = GetTempDir() &"yolov8n.mlpackage.zip"
TracePrint dir.Exist(modelZipPath)
//解压模型文件到本地目录
UnZip modelZipPath,GetTempDir()
TracePrint dir.Exist(modelPath)
//设置序号为1的演示模型目录路径，目录路径必须是.mlpackage结尾
ret = ml.setModel(1, modelPath)
If ret["code"] = 0 Then 
    TracePrint "set model successed"
Else 
    TracePrint "set model failed,error msg:"&ret["msg"]
    ExitScript
End If
Do
    ranTime = TickCount()
    //运行神经网络引擎识别匹配序号为1的模型并返回键值表，模型设置成功后可打开相机拍照查看返回结果
    ret = ml.runCoreMl(1, 0, 0, 0, 0)
    TracePrint TickCount()-ranTime
    If ret["code"] = 0 Then 
        For i = 1 To Len(ret["data"])
            For Each k , v In ret["data"][i]
                TracePrint k,v
            Next
        Next
    Else
        TracePrint "error code:"& ret["code"] &",error msg:"&ret["msg"]
    End If
    Delay 2000
Loop
```

```sourceCode lua
//例2：设置并运行.mlmodel格式模型
Dim ranTime,ret
//将模型文件下载或通过附件释放到本地均可
PutAttachment "", "*"
//演示模型：https://ml-assets.apple.com/coreml/models/Image/ObjectDetection/YOLOv3Tiny/YOLOv3TinyInt8LUT.mlmodel
Dim modelPath = GetTempDir() & "YOLOv3TinyInt8LUT.mlmodel"
TracePrint dir.Exist(modelPath)
//设置序号为1的演示模型目录路径，模型路径设置到.mlmodel文件即可
ret = ml.setModel(1, modelPath)
TracePrint Encode.TableToJson(ret)
If ret["code"] = 0 Then 
    TracePrint "set model successed"
Else 
    TracePrint "set model failed,error msg:"&ret["msg"]
    ExitScript
End If
Do
    ranTime = TickCount()
    //运行神经网络引擎识别匹配序号为1的模型并返回键值表，模型设置成功后可打开相机拍照查看返回结果
    ret = ml.runCoreMl(1, 0, 0, 0, 0)
    TracePrint TickCount()-ranTime
    TracePrint Encode.TableToJson(ret)
    If ret["code"] = 0 Then 
        For i = 1 To Len(ret["data"])
            For Each k , v In ret["data"][i]
                TracePrint k,v
            Next
        Next
    Else
        TracePrint "error code:"& ret["code"] &",error msg:"&ret["msg"]
    End If
    Delay 2000
Loop
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }