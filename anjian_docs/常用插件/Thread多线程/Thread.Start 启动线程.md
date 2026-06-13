# Thread.Start 启动线程

> 来源: https://res.anjian.com/plugin/thread/Start.html

---

### 函数名称

Thread.Start 启动线程

### 函数功能

创建一个多线程，在多线程中运行指定的函数

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

threadID = Thread.Start(threadFunc\[, var1, var2 …\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| threadFunc | function | 是 | 多线程函数名 |
| var1, var2 … | int | string |bool |table | 否 | 传递给线程的参数,可省略,最多支持10个 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| threadID | userdata | 线程id |

### 代码范例

```sourceCode lua
Function ThreadFunc(par1, par2)
    TracePrint "线程接收到参数：", par1, par2
    Do
        TracePrint "子线程正在运行..."
        Delay 200
    Loop
End Function

Thread.Start ThreadFunc, "参数1", "参数2"

Do
    TracePrint "主线程正在运行..."
    Delay 1000
Loop
```

### 备注说明

返回值线程ID目前无法输出查看

每个线程之间变量无法通用，需要通过 SetShareVar 设置共享变量

和 GetShareVar 获取共享变量 来实现变量互通

如果主线程停止了，那么所有的子线程都会停止

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }