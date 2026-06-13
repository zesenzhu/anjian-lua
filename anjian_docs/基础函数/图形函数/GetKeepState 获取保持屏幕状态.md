# GetKeepState 获取保持屏幕状态

> 来源: https://res.anjian.com/basic/pic/GetKeepState.html

---

### 函数名称

GetKeepState 获取保持屏幕状态

### 函数功能

配合KeepCapture和ReleaseCapture，获取当前的keep状态

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 3.2.1 | 3.2.0 | 5.0.0 | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = GetKeepState()

### 函数参数

无

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：上一次调用keepCature后还未释放  
false：已经释放内存中的缓存图片 |

### 代码范例

```sourceCode lua
KeepCapture 
TracePrint "这里开始的图色函数均从内存中查找"
TracePrint "也就意味着，查找的并非即时屏幕画面，而是保存在内存中的那张截图。"
TracePrint GetKeepState()//返回true:表示上一次调用了keepCature还未释放
ReleaseCapture 
TracePrint "这里开始恢复即时屏幕画面的查找了"
TracePrint GetKeepState()//返回false:表示已经释放内存中的缓存图片
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }