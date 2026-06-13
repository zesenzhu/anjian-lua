# DateTimeEx.WeekOfYear 获取当年第几周

> 来源: https://res.anjian.com/plugin/dateTimeEx/WeekOfYear.html

---

### 函数名称

DateTimeEx.WeekOfYear 获取当年第几周

### 函数功能

获取指定时间在当前年份中的周序号

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = DateTimeEx.WeekOfYear(\[t, useISO\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| t | int | 否 | 秒级时间戳，可以通过 `Time()` 命令获取，不填默认为当前时间戳 |
| useISO | bool | 否 | 是否使用 `ISO 8601` 标准来计算周数，默认为 `false`  
ISO 8601 计算规则：**包含第一个周四的那一周才算作第1周**  
非 ISO 8601 计算规则：**每月1号那一周算作第一周** |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | int | 返回时间是当月的第几周 |

### 代码范例

```sourceCode lua
Dim ts = DateTimeEx.ParseTime("2023-01-5")

// 日常算法
TracePrint "2023年1月5号是当年的第 " & DateTimeEx.WeekOfYear(ts) & " 周"
// ISO 8601 标准算法
// 因为1月份的1号那周不包含周四，所以下一周才算是第一周
TracePrint "2023年1月5号是当年的第 " & DateTimeEx.WeekOfYear(ts, true) & " 周"
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }