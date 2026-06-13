# sqlite3.SQLSelect 查询SQL数据库

> 来源: https://res.anjian.com/plugin/sqlite3/SQLSelect.html

---

### 函数名称

sqlite3.SQLSelect 查询SQL数据库

### 函数功能

从指定的 SQLite 数据表中查询符合条件的数据记录，并以键值表形式返回查询结果

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = sqlite3.SQLSelect(dbPath, tableName\[, fields, where\]\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| dbPath | string | 是 | SQLite 数据库文件路径 |
| tableName | string | 是 | 要查询的数据表名称 |
| fields | string | 否 | 要查询的字段名，多个字段用逗号分隔；传 `*` 表示查询所有字段，默认为 `*` |
| where | string | 否 | 查询条件（`WHERE` 子句内容），语法参照 SQLite 标准 SQL 语法。默认为 `""`（即无条件查询） |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 返回包含所有符合条件的记录数组，数组每个元素是键值表形式，无结果时返回 `null` |

### 代码范例

```sourceCode lua
Import "sqlite3.lua"
Dim dbPath, tableName, fields, sql, where, ret

dbPath = GetTempDir() & "data.db"
Dir.Delete dbPath
tableName = "student_score"
fields = {"id INTEGER PRIMARY KEY", "student_name TEXT", "math_score INTEGER", "english_score INTEGER"}
// 先创建并插入一些数据
sqlite3.SQLCreate(dbPath, tableName, fields)
sqlite3.SQLInsert(dbPath, tableName, {"student_name": "Todd", "math_score": 57, "english_score": 80})
sqlite3.SQLInsert(dbPath, tableName, {"student_name": "Don", "math_score": 67, "english_score": 71})
sqlite3.SQLInsert(dbPath, tableName, {"student_name": "Perry", "math_score": 89, "english_score": 40})


// 查询指定条件的数据
where = "math_score < 60 or english_score < 60"
ret = sqlite3.SQLSelect(dbPath, tableName, "student_name,math_score,english_score", where)
If ret Then 
    TracePrint "符合条件的记录：" & Len(ret)
    For Each i , row In ret
        TracePrint row["student_name"], row["math_score"], row["english_score"]
    Next
Else 
    Dim errMsg = sqlite3.GetLastError()
    If errMsg <> "" Then 
        TracePrint "查询失败：" & errMsg
    Else 
        TracePrint "没有符合条件的记录"
    End If
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }