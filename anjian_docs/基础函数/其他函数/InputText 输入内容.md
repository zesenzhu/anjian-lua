# InputText 输入内容

> 来源: https://res.anjian.com/basic/other/InputText.html

---

### 函数名称

InputText 输入文本内容

### 函数功能

在当前输入框中输入文本内容

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

InputText str\_in\[,model\]

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| str\_in | string | 是 | 要输入的文本内容字符串 |
| model | bool | 否 | 是否切换输入法，默认：空  
空：第一次调用InputText函数时切换至按键输入法，直到结束脚本后切换回默认输入法  
true：每次输入文本前切换至按键输入法，输入结束后保持按键输入法  
false：每次输入文本前切换至按键输入法，输入结束后切换回默认输入法  
由于非空时每次调用命令都会切换输入法，因此执行耗时会变长 |

### 函数返回

无

### 代码范例

```sourceCode lua
//在当前窗口输入"你好，我是按键精灵"
//注意：当使用此函数后直至脚本结束,其他输入法无法调用
InputText "你好，我是按键精灵"
```

### 备注说明

调用InputText输入前，需要先点击激活输入框

如遇无法输入的情况，可以使用KeyPress模拟按键输入或长按粘贴方式变通

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }