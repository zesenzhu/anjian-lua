# Sys.isRunning 判断指定包名是否运行

> 来源: https://res.anjian.com/expand/sys/isRunning.html

---

### 函数名称

Sys.isRunning 判断指定应用是否运行

### 函数功能

判断指定应用是否运行（包括前、后台运行）

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.2.0 | 3.2.0 | ✖ | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | ✖ | 13.0 | 8.0 |

### 函数语法

ret = Sys.isRunning(packName)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| packName | string | 是 | 指定应用的包名 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：已运行  
false：未运行 |

### 代码范例

```sourceCode lua
Dim packName = "com.companyName.appName"
RunApp packName //启动指定包名应用
Delay 2000
KeyPress "home" //返回桌面,后台挂起当前应用
Delay 2000
TracePrint sys.IsRunning(packName)
```

### 备注说明

该命令区别于sys.AppIsFront()只识别是否在前台运行，后台挂起的应用也会被识别到

应用包名可通过Sys.GetFront()获取前台包名或通过助手编辑器左侧【基本命令】-【其他命令】-【应用程序】包名列表查看

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }