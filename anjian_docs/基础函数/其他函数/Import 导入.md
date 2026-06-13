# Import 导入

> 来源: https://res.anjian.com/basic/other/Import.html

---

### 函数名称

Import 导入模块

### 函数功能

导入插件或命令库，导入后可在程序内调用其内函数

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Import fileName

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| fileName | string | 是 | 支持类型：  
lua：插件  
luae：加密插件  
mql：命令库  
mqle：加密命令库 |

### 函数返回

无

### 代码范例

```sourceCode lua
//例子1：导入插件
Import "Str.lua"
Import "StrE.luae" //加密版本
Dim 当前时间
当前时间 = Str.Now()
TracePrint 当前时间
当前时间 = StrE.Now()
TracePrint 当前时间

//例子2：导入命令库
Import "test.mql"
Import "testE.mqle" //加密版本
Dim ret
ret = test.ranNum()
TracePrint ret
ret = testE.ranNum()
TracePrint ret
```

### 备注说明

1、调试和打包时，请先确认按键精灵手机助手“/安装目录/Plugin”目录下有对应插件，“CommandLib”目录下有对应命令库

2、打包小精灵apk或扫码工具，会自动打包插件和命令库到脚本资源中

3、即便插件或命令库后缀格式不同，也应不导入同名模块，以免命令空间名称错乱

4、按键app本地执行源码需要自行传输插件或命令到设备上按键app安装目录的对应目录

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }