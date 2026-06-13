# DateTime.TimeDiff 计算时间差

> 来源: https://res.anjian.com/plugin/dateTime/TimeDiff.html

---

### 函数名称

DateTime.TimeDiff 计算时间差

### 函数功能

计算两个时间的差值，即：时间1减去时间2的差值

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

diff = DateTime.TimeDiff(time1, time2\[, unit\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| time1 | string | int | 是 | 时间参数1，支持时间格式的字符串（支持格式参考 `ParseTime` 命令）或者时间戳 |
| time2 | string | int | 是 | 时间参数2，支持时间格式的字符串（支持格式参考 `ParseTime` 命令）或者时间戳 |
| unit | string | 否 | 返回结果的差值单位，可填写：`Y` `m` `d` `H` `M` `S` 分别代表年、月、日、时、分、秒，默认为秒 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| diff | int | 返回 `time1` - `time2` 的时间差，单位由 `unit` 参数决定 |

### 代码范例

```sourceCode lua
// 计算秒差
TracePrint DateTime.TimeDiff("2026-02-28 14:46:29", "2026-02-26 14:46:29", "m")
// 计算小时差
TracePrint DateTime.TimeDiff("2026-02-28 2:46:29", "2026-02-26 14:46:29", "H")
// 计算天差
TracePrint DateTime.TimeDiff("2026-02-28", "2026-02-16", "d")

// 支持传入时间戳进行对比
TracePrint DateTime.TimeDiff(1772356045, 1772701685, "d")
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }