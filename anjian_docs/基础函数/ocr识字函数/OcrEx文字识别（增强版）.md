# OcrEx文字识别（增强版）

> 来源: https://res.anjian.com/basic/ocr/ocrEx.html

---

### 函数名称

OcrEx文字识别（增强版）

### 函数功能

返回指定区域内所有识别到的文本，无需自制字库，识别范围越小，效率越高，结果越准确

**注意**：安卓版按键APP需在设置页下载安装【ocrEx组件库】，如在主程序（不含插件、命令库）中调用该函数，则在打包小精灵时会自动添加资源组件

如在插件、命令库中调用该函数，v5.0.0及以上版本助手打包小精灵时勾选OcrEx即可，v5.0.0以下版本需在主程序中添加ocrEx关键字

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 4.0.0 | 3.8.0 | 5.0.0 | 2.0.0 | ✖ |
| 最低系统版本 | windows 7 | 5.0 | 7.0 | 13.0 | ✖ |

### 函数语法

ret = OcrEx (leftX,topY,rightX,bottomY\[,mode,language,options\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| leftX | int | 是 | 识别区域的左上角x坐标 |
| topY | int | 是 | 识别区域的左上角y坐标 |
| rightX | int | 是 | 识别区域的右下角x坐标 |
| bottomY | int | 是 | 识别区域的右下角y坐标 |
| mode | int | 否 | 识别模式，0：精准模式，1：快速模式，默认：0 |
| language | string | 否 | 识别语种，支持多语种，分隔符”,“，默认：”0”  
“0”：中文+英文  
“1”：中文  
“2”：英文 |
| options | table | 否 | 扩展参数集合，用于额外配置和未来扩展 |

options包含的字段

  
| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| modelType | string | 模型类型，默认值：default  
default：默认模型，iOS13系统默认模型不支持中文  
paddleV5：飞桨v5  
**该参数支持版本**：iOS新版v2.8.0或以上版本引擎 |
| searchKeywords | string | 要查找的关键字，可一定程度解决非关联字粘连问题，仅iOS新版default默认模型支持  
多个关键字用半角逗号分割，例如”keyword1,keyword2,keyword3”  
**该参数支持版本**：iOS新版v2.7.3或以上版本引擎 |
| targetSize | int | 目标精度，以识别图像宽高中的较长边为准，设置对应精度可有效提高识别准确率，精度越高消耗性能越大  
有效值：320、640、960、1280、1920，默认值：960  
**该参数支持版本**：安卓版v5.0.0或以上版本 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回含有数组的键值表的响应结果信息，如存在n个结果，则table长度为n |

result 包含的字段

| 字段名 | 字段类型 | 字段说明 |
| --- | --- | --- |
| text | string | 识别到的文本内容 |
| x | int | 识别到文本区域的左上角x坐标 |
| y | int | 识别到文本区域的左上角y坐标 |
| h | int | 识别到文本区域的高度 |
| w | int | 识别到文本区域的宽度 |
| score | float | 识别到文本区域的可信度 |

### 代码范例

```sourceCode lua
//例1：在全屏范围内识别文本、精准模式、中文+英文
Dim ret,ranTime
Do
    ranTime = TickCount()
    ret = OcrEx (0,0,0,0)
    TracePrint TickCount()-ranTime
    If Len(ret) = 1 and ret[1] = "" Then 
        TracePrint "没有识别到文本"
    Else 
        For i = 1 to len(ret)
            TracePrint "识别到目标：" & ret[i]["text"] &_
            ",左上角x坐标：" & ret[i]["x"] &_
            ",左上角y坐标：" & ret[i]["y"] &_
            ",区域宽：" & ret[i]["w"] &_
            ",区域高：" & ret[i]["h"] &_
            ",可信度：" & ret[i]["score"]
        Next  
    End If
    Delay 1000
Loop
```

```sourceCode lua
//例2：使用飞浆v5模型，暂只支持iOS新版v2.7.0或以上版本引擎
Dim ret,ranTime
Do
    ranTime = TickCount()
    ret = OcrEx (0,0,0,0,0,"0",{"modelType":"paddleV5"})
    TracePrint TickCount()-ranTime
    If Len(ret) = 1 and ret[1] = "" Then 
        TracePrint "没有识别到文本"
    Else 
        For i = 1 to len(ret)
            TracePrint "识别到目标：" & ret[i]["text"] &_
            ",左上角x坐标：" & ret[i]["x"] &_
            ",左上角y坐标：" & ret[i]["y"] &_
            ",区域宽：" & ret[i]["w"] &_
            ",区域高：" & ret[i]["h"] &_
            ",可信度：" & ret[i]["score"]
        Next  
    End If
    Delay 1000
Loop
```

```sourceCode lua
//例3：查找指定字符，暂只支持iOS新版v2.7.3或以上版本引擎
Dim ret,ranTime
Do
    ranTime = TickCount()
    ret = OcrEx (0,0,0,0,0,"0",{"searchKeywords":"搜索关键字1,搜索关键字2"})
    TracePrint TickCount()-ranTime
    If Len(ret) = 1 and ret[1] = "" Then 
        TracePrint "没有识别到文本"
    Else 
        For i = 1 to len(ret)
            TracePrint "识别到目标：" & ret[i]["text"] &_
            ",左上角x坐标：" & ret[i]["x"] &_
            ",左上角y坐标：" & ret[i]["y"] &_
            ",区域宽：" & ret[i]["w"] &_
            ",区域高：" & ret[i]["h"] &_
            ",可信度：" & ret[i]["score"]
        Next  
    End If
    Delay 1000
Loop
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }