# TracePrint调试输出

> 来源: https://res.anjian.com/basic/other/TracePrint.html

---

### 函数名称

TracePrint 调试输出

### 函数功能

打印输出调试信息到按键精灵手机助手调试面板，log.open开启状态下会同时写入到日志文件

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

TracePrint(param1\[,param2,…\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| param1 | any | 是 | 任意有效值，可以是数据、变量、表达式、函数返回值等  
支持一个或多个参数，最多1024个 |
| param2 | any | 否 | 任意有效值，可以是数据、变量、表达式、函数返回值等 |

### 函数返回

无

### 代码范例

```sourceCode lua
//打印输出“按键精灵，我爱你”
TracePrint "按键精灵，我爱你"

//打印输出2
TracePrint 1 + 1

//打印输出true
TracePrint 1 = 1

dim int1 = 1,int2 = 2
//打印输出多个变量
TracePrint int1,int2 
//打印输出testFunc函数返回值
TracePrint testFunc(int1,int2)

Function testFunc(p1,p2)
    testFunc = p1 + p2
End Function
```

### 备注说明

TracePrint是排错的重要手段，需要善用

table类型数据不能直接打印，需要遍历或转成json字符串后打印

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }