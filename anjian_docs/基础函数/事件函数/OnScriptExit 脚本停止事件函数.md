# OnScriptExit 脚本停止事件函数

> 来源: https://res.anjian.com/basic/event/OnScriptExit.html

---

### 函数名称

OnScriptExit 脚本停止事件函数

### 函数功能

当脚本停止时触发该事件

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.2.1 | 3.2.0 | 5.0.0 | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

Function OnScriptExit()

​ // 停止事件代码

End Function

### 函数参数

无

### 函数返回

无

### 代码范例

```sourceCode lua
//例子1:
TracePrint "开始脚本停止事件测试"
For i = 3 to 1 step -1 
    TracePrint i & "秒后停止脚本并触发停止事件"
    Delay 1000
Next

//例子2:
TracePrint "开始脚本停止事件测试"
EndScript //强制结束脚本并触发脚本停止事件，以下延时代码不会被执行
For i = 3 to 1 step -1 
    TracePrint i & "秒后停止脚本并触发停止事件"
    Delay 1000
Next

//在脚本停止时执行以下停止事件
Function OnScriptExit()
    TracePrint "脚本停止事件触发！"
    TracePrint UI.Newlayout ("脚本停止事件测试") 
    TracePrint UI.AddTextView("脚本停止事件测试","文字框1","触发了脚本停止事件!创建了该动态UI弹窗~") 
    UI.SetTextColor "文字框1", "0000FF"
    UI.SetTextSize("文字框1", 15)
    TracePrint UI.SetPadding("文字框1",50,50,50,50)
    TracePrint UI.Show ("脚本停止事件测试") 
End Function
```

### 备注说明

触发条件：

1、脚本运行至最后一行停止脚本；

2、脚本运行至EndScript停止脚本；

3、用户按音量键或者点击悬浮窗停止脚本；

4、RestartScript停止并重新启动脚本

5、动态UI上点击退出按钮停止脚本

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }