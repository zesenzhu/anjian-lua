# Yolo.SetModel 设置Yolo模型

> 来源: https://res.anjian.com/expand/yolo/SetModel.html

---

### 函数名称

Yolo.SetModel 设置Yolo模型

### 函数功能

设置Yolo模型，支持yolov8、11

iOS建议使用ML神经网络引擎函数

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.5.0 | 4.2.0 | 5.0.0 | ✖ | ✖ |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | ✖ | ✖ |

### 函数语法

result = Yolo.SetModel(index,targetSize,paramPath,binPath,labelPath\[,creatThreadsNum,runThreadsNum,options\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| index | int | 是 | 模型索引，支持设置多个模型，不运行不占用资源，停止脚本时自动销毁，建议取值范围：0-9 |
| targetSize | int | 是 | 模型精度，需与训练模型时精度一致，建议：640 |
| paramPath | string | 是 | param文件路径 |
| binPath | string | 是 | bin文件路径 |
| labelPath | string | 是 | label标签文件路径，文件编码建议使用utf-8，标签数量需要与训练时保持一致 |
| creatThreadsNum | int | 否 | 每个模型可以并行的线程数量，默认：1 |
| runThreadsNum | int | 否 | 每个模型运行识别可以并行的线程数量，默认：1 |
| options | table | 否 | 扩展参数集合，用于额外配置和未来扩展 |

options包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| modelType | int | 模型类型，默认1，支持yolov8、11  
1：ncnn简化版，适用将.pt直转.ncnn的模型  
2：ncnn标准版，适用将.pt按照ncnn官方教程修改参数后再转.ncnn的模型  
如遇报错模型类型错误，请尝试切换以上模型类型参数  
[.pt转.ncnn教程](https://help.anjian.com/docs/mobile/expand/yolo/ModelChange.html) |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回响应结果信息的键值表 |

result 包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| code | int | 执行函数的结果状态码，0为执行成功，非0为失败，失败原因查看msg字段 |
| msg | string | 执行结果的描述，失败则描述具体的失败原因 |

### 代码范例

```sourceCode lua
Dim paramPath,binPath,lablePath,ranTime,ret,modelPath = GetTempDir() & "yolov8/"
Dir.Create modelPath
//将配置文件通过附件释放或url下载放置到模型目录皆可
PutAttachment modelPath, "*"
paramPath = modelPath & "model.ncnn.param"
binPath = modelPath & "model.ncnn.bin"
lablePath = modelPath & "classes.txt"
//检查3个配置文件是否存在，1：存在，0：不存在
TracePrint dir.Exist(paramPath),dir.Exist(binPath),dir.Exist(lablePath)
//设置模型1，ncnn简化版模型
ret = yolo.setModel(1, 640, paramPath, binPath, lablePath)
//设置模型2，ncnn标准版模型
//ret = yolo.setModel(2, 640, paramPath, binPath, lablePath,1,1,{"modelType":2})
If ret["code"] = 0 Then 
    TracePrint "set model successed"
Else 
    TracePrint "set model failed,error msg:"&ret["msg"]
    ExitScript
End If

Do
    ranTime = TickCount()
    //通过已设置模型1识别返回目标
    ret = Yolo.runModel(1,0.75)
    TracePrint TickCount()-ranTime
    If ret["code"] = 0 Then 
        For i = 1 to len(ret["data"])
            TracePrint "识别到目标：" & ret["data"][i]["text"] &_
            ",左上角x坐标：" & ret["data"][i]["x"] &_
            ",左上角y坐标：" & ret["data"][i]["y"] &_
            ",区域宽：" & ret["data"][i]["w"] &_
            ",区域高：" & ret["data"][i]["h"] &_
            ",可信度：" & ret["data"][i]["score"]
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