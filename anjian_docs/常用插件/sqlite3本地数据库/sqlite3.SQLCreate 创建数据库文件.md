# sqlite3.SQLCreate 创建数据库文件

> 来源: https://res.anjian.com/plugin/sqlite3/SQLCreate.html

---

### 函数名称

sqlite3.SQLCreate 创建数据库表

### 函数功能

在指定的 SQLite 数据库文件中创建数据表

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = sqlite3.SQLCreate(dbPath, tableName, fields)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| dbPath | string | 是 | SQLite 数据库文件路径 |
| tableName | string | 是 | 要创建的数据表名称 |
| fields | table | 是 | 包含字段名的数组，用于定义新建表的列名  
列名之后自行添加列类型、列约束等，语法参照 SQLite 标准 SQL 语法 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：创建成功  
false：创建失败，可以通过 `sqlite3.GetLastError` 获取具体失败原因 |

### 代码范例

```sourceCode lua
Import "sqlite3.lua"
Dim dbPath, tableName, fields, ret

dbPath = GetTempDir() & "data.db"
Dir.Delete dbPath
tableName = "student_score"
fields = {"id INTEGER PRIMARY KEY", "student_name TEXT", "math_score INTEGER", "english_score INTEGER"}

ret = sqlite3.SQLCreate(dbPath, tableName, fields)
If ret Then 
    TracePrint "数据表创建成功"
Else 
    Dim errMsg = sqlite3.GetLastError()
    If InStr(1, errMsg, "already exists") > 0 Then
        TracePrint "数据表已存在"
    Else 
        TracePrint "数据表创建失败：" & errMsg
    End If
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }