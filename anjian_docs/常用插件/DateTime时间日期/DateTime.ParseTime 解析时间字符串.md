# DateTime.ParseTime 解析时间字符串

> 来源: https://res.anjian.com/plugin/dateTime/ParseTime.html

---

### 函数名称

DateTime.ParseTime 解析时间字符串

### 函数功能

把时间格式的字符串转换成时间戳

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

timestamp = DateTime.ParseTime(timeStr\[, format\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| timeStr | string | 是 | 需要解析的时间字符串，默认支持的格式参考**代码范例** |
| format | string | 否 | 自定义的解析格式。`%Y` `%m` `%d` `%H` `%M` `%S` 分别代表年、月、日、时、分、秒 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| timestamp | int | 返回转换后的时间戳。转换失败返回 `nil` |

### 代码范例

```sourceCode lua
// 默认支持的格式
TracePrint DateTime.ParseTime("2026-03-05 13:25:51")
TracePrint DateTime.ParseTime("2026/03/05 13:25:51")
TracePrint DateTime.ParseTime("2026-03-05")
TracePrint DateTime.ParseTime("2026/03/05")
TracePrint DateTime.ParseTime("20260305132551")
TracePrint DateTime.ParseTime("2026-03-05T13:25:51")
TracePrint DateTime.ParseTime("2026年3月5日")
TracePrint DateTime.ParseTime("2026年03月05日 13时25分51秒")
TracePrint DateTime.ParseTime("2026年03月05日 13:25:51")

// 解析自定义格式
TracePrint DateTime.ParseTime("03/05/2026 13:25:51", "%m/%d/%Y %H:%M:%S")
TracePrint DateTime.ParseTime("05/03/2026 13:25:51", "%d/%m/%Y %H:%M:%S")
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }