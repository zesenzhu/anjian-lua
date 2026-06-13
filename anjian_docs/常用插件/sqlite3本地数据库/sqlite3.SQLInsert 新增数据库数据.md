# sqlite3.SQLInsert 新增数据库数据

> 来源: https://res.anjian.com/plugin/sqlite3/SQLInsert.html

---

### 函数名称

sqlite3.SQLInsert 新增数据库数据

### 函数功能

向指定的 SQLite 数据表中插入新的数据记录，可一次插入一条完整记录

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = sqlite3.SQLInsert(dbPath, tableName, data)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| dbPath | string | 是 | SQLite 数据库文件路径 |
| tableName | string | 是 | 要操作的数据表名称 |
| data | table | 是 | 包含要新增数据的表结构，键为字段名，值为对应的插入数据；字段需与数据表结构一致 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | bool | true：插入成功  
false：插入失败，可通过 `sqlite3.GetLastError` 获取失败原因 |

### 代码范例

```sourceCode lua
Import "sqlite3.lua"
Dim dbPath, tableName, fields, sql, where, ret

dbPath = GetTempDir() & "data.db"
Dir.Delete dbPath
tableName = "student_score"
fields = {"id INTEGER PRIMARY KEY", "student_name TEXT", "math_score INTEGER", "english_score INTEGER"}
// 先创建表
sqlite3.SQLCreate(dbPath, tableName, fields)
// 插入数据（因为id字段设定为主键，sql会自动添加，所以不需要人为插入数据）
sqlite3.SQLInsert(dbPath, tableName, {"student_name": "Todd", "math_score": 57, "english_score": 80})
sqlite3.SQLInsert(dbPath, tableName, {"student_name": "Don", "math_score": 67, "english_score": 71})
sqlite3.SQLInsert(dbPath, tableName, {"student_name": "Perry", "math_score": 89, "english_score": 40})
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }