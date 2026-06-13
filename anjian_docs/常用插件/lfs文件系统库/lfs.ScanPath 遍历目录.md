# lfs.ScanPath 遍历目录

> 来源: https://res.anjian.com/plugin/lfs/ScanPath.html

---

### 函数名称

lfs.ScanPath 遍历目录

### 函数功能

遍历指定目录，按条件返回目录中的文件和/或子目录完整路径，可选择是否递归遍历。

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = lfs.ScanPath(dir\[,mode,deep, maxDepth\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| dir | string | 是 | 遍历目录的路径，支持相对路径和绝对路径  
相对路径：在使用 `lfs.Chdir` 设置了工作路径后，可以传入相对路径（路径开头不能有 `/`），例如：`a/b/c`  
绝对路径：直接传入想要遍历的目录的绝对路径，例如：`/sdcard/com.cyjh.mobileanjian/a/b` |
| mode | int | 否 | 遍历的类型：  
1：只遍历文件  
2：只遍历目录  
3：遍历文件以及目录（默认值） |
| deep | bool | 否 | 是否递归遍历子目录，默认 `false`，仅遍历当前目录 |
| maxDepth | int | 否 | 最大递归遍历层级，默认20，只有在 `deep` 参数为 `true` 时生效 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | table | 根据 `mode` 参数返回包含文件或者子目录的完整路径数组 |

### 代码范例

```sourceCode lua
Import "lfs.lua"

Dim tbl, rootDir
rootDir = GetTempDir()
// 递归遍历文件
TracePrint "--------- 只遍历文件 ---------"
tbl = lfs.ScanPath(rootDir, 1, false)
For Each k , v In tbl
    TracePrint k, v
Next

// 递归遍历目录
TracePrint "--------- 只遍历目录 ---------"
tbl = lfs.ScanPath(rootDir, 2, true)
For Each k , v In tbl
    TracePrint k, v
Next

// 递归遍历文件和目录
TracePrint "--------- 遍历文件/目录 ---------"
tbl = lfs.ScanPath(rootDir, 3, true)
For Each k , v In tbl
    TracePrint k, v
Next

// 限定递归的深度
TracePrint "--------- 限定深度 ---------"
tbl = lfs.ScanPath(rootDir, 3, true, 2)
For Each k , v In tbl
    TracePrint k, v
Next
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }