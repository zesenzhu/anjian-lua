# KillApp 关闭应用

> 来源: https://res.anjian.com/basic/other/KillApp.html

---

### 函数名称

KillApp 关闭应用

### 函数功能

结束指定应用进程

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | ✖ | 2.0.0 | 1.6.2 |
| 最低系统版本 | windows 7 | 4.4 | ✖ | 13.0 | 8.0 |

### 函数语法

KillApp(packName,flag)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| packName | string | 是 | 应用包名  
“\*“：关闭除引擎以外的所有非系统进程（安卓v3.8.0、iOS新版v2.0.0或以上版本支持） |
| flag | int | 是 | 结束方式，默认：0  
0：强制结束  
1：正常退出 |

### 函数返回

无

### 代码范例

```sourceCode lua
//关闭指定应用
KillApp "com.companyname.appname"
//关闭除引擎以外的所有非系统进程（安卓v3.8.0、iOS新版v2.0.0或以上版本支持）
KillApp "*"
```

### 备注说明

应用程序的包名可以通过“按键精灵手机助手”右边的“脚本命令”中的“其他命令”查看，或将app打开至前台后通过sys.GetFront()函数获取

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }