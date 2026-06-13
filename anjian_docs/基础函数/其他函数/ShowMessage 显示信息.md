# ShowMessage 显示信息

> 来源: https://res.anjian.com/basic/other/ShowMessage.html

---

### 函数名称

ShowMessage 显示提示信息

### 函数功能

以当前屏幕方向在屏幕指定位置显示提示信息，此信息持续一段时间后消失

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 2.6.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ShowMessag(msg\[,time,intX,intY\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| msg | string | 是 | 要显示的提示文本内容 |
| time | int | 否 | 显示提示信息的持续时间，单位：毫秒（该参数安卓版暂不生效，默认展示3秒） |
| intX | int | 否 | 需要在屏幕上显示提示信息位置的横坐标，以当前应用画面左上角为0,0起始点 |
| intY | int | 否 | 需要在屏幕上显示提示信息位置的纵坐标，以当前应用画面左上角为0,0起始点 |

### 函数返回

无

### 代码范例

```sourceCode lua
//以当前应用画面方向，在屏幕350,350这个位置上显示"我爱按键精灵"
ShowMessage "我爱按键精灵",3000,350,350
```

### 备注说明

与TracePrint调试输出相比，该命令为输出显示到手机屏幕上，供用户了解实时情况

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }