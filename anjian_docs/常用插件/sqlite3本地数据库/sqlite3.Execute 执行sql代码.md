# sqlite3.Execute 执行sql代码

> 来源: https://res.anjian.com/plugin/sqlite3/Execute.html

---

### 函数名称

sqlite3.Execute 执行sql代码

### 函数功能

用于在指定的 SQLite 数据库中执行 SQL 语句，支持查询语句和非查询语句（插入、更新、删除等）

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = sqlite3.Execute(dbPath, sql)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| dbPath | string | 是 | SQLite 数据库文件路径 |
| sql | string | 是 | 要执行的 SQL 语句 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | bool | 当 `sql` 为查询语句（如 `SELECT`）时，返回查询结果的键值表；  
当 `sql` 为非查询语句（如 `INSERT`、`UPDATE`、`DELETE`、`CREATE` 等）时，执行成功返回 `true`，失败返回 `false` |

### 代码范例

```sourceCode lua
Import "sqlite3.lua"
Dim dbPath, sql, ret

dbPath = GetTempDir() & "data.db"

// ------- 创建sql表 -------
sql = "CREATE TABLE IF NOT EXISTS tasks (" & _
      "id INTEGER PRIMARY KEY AUTOINCREMENT, " & _
      "task_name TEXT, " & _
      "is_done INTEGER)"

ret = sqlite3.Execute(dbPath, sql)
If ret Then
    TracePrint "数据库表结构检测/创建成功"
Else
    TracePrint "数据库创建失败：" & sqlite3.GetLastError()
End If


// ------- 插入数据 -------
sql = "INSERT INTO tasks (task_name, is_done) VALUES ('签到任务', 0)"
ret = sqlite3.Execute(dbPath, sql)
If ret Then 
    TracePrint "数据添加成功"
Else 
    TracePrint "数据添加失败：" & sqlite3.GetLastError()
End If


// ------- 修改数据 -------
sql = "UPDATE tasks SET is_done = 1 WHERE task_name = '签到任务'"
ret = sqlite3.Execute(dbPath, sql)
If ret Then 
    TracePrint "数据修改成功"
Else 
    TracePrint "数据修改失败：" & sqlite3.GetLastError()
End If


// ------- 查询数据 -------
sql = "SELECT * FROM tasks WHERE is_done = 1"
ret = sqlite3.Execute(dbPath, sql)
If ret Then 
    For Each i, row In ret
        TracePrint row["id"], row["task_name"], row["is_done"]
    Next
Else 
    TracePrint "查询失败：" & sqlite3.GetLastError()
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }