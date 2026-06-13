# lfs.Attributes 获取文件属性

> 来源: https://res.anjian.com/plugin/lfs/Attributes.html

---

### 函数名称

lfs.Attributes 获取文件属性

### 函数功能

获取文件属性

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

attrs = lfs.Attributes(filePath\[,attrKey\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| filePath | string | 是 | 文件路径，支持相对路径和绝对路径  
相对路径：在使用 `lfs.Chdir` 设置了工作路径后，可以传入相对路径（路径开头不能有 `/`），例如：`anjian.txt`  
绝对路径：直接传入文件的绝对路径，例如：`/sdcard/com.cyjh.mobileanjian/anjian.txt` |
| attrKey | string | 否 | 属性名，具体参考下方**属性表**；不填则命令会返回包含所有属性的键值表 |

**属性表**

 
| 属性名 | 属性说明 |
| --- | --- |
| **dev** | 文件所在的设备编号（device ID），用于区分文件所属的文件系统 |
| **ino** | 文件的 inode 编号，在同一设备内唯一标识一个文件 |
| **mode** | 文件类型与权限信息（如 `file`、`directory`、`link` 等） |
| **nlink** | 指向该文件的硬链接数量 |
| **uid** | 文件所有者的用户 ID |
| **gid** | 文件所有者所属的用户组 ID |
| **rdev** | 设备文件的设备编号（仅对字符/块设备有效） |
| **size** | 文件大小，单位：字节 |
| **access** | 文件最后一次访问时间（Unix 时间戳） |
| **modification** | 文件最后一次修改时间（Unix 时间戳） |
| **change** | 文件元数据最后一次变更时间（Unix 时间戳） |
| **permissions** | 文件权限字符串（如 `rwxr-xr-x`） |
| **blocks** | 文件占用的磁盘块数量（部分平台可能不支持） |
| **blksize** | 文件系统的 I/O 块大小（部分平台可能不支持） |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| attrs | table | string | 传入 `attrKey` 参数：返回单个属性值  
未传入 `attrKey` 参数：返回包含所有属性的键值表 |

### 代码范例

```sourceCode lua
Import "lfs.lua"

Dim filePath, attrs
filePath = GetTempDir() & "anjian.txt"
If Dir.Exist(filePath) = 0 Then 
    File.Write filePath, "Hello World"
End If

// 获取文件全部属性
attrs = lfs.Attributes(filePath)
TracePrint "当前文件inode所在的设备 : " & attrs["dev"]
TracePrint "当前文件inode编号 : " & attrs["ino"]
TracePrint "当前文件文件类型: " & attrs["mode"]
TracePrint "当前文件硬链接数 : " & attrs["nlink"]
TracePrint "当前文件所有者的用户ID : " & attrs["uid"]
TracePrint "当前文件所有者的组ID : " & attrs["gid"]
TracePrint "当前文件inode的设备类型 : " & attrs["rdev"]
TracePrint "当前文件上次访问的时间 : " & attrs["access"]
TracePrint "当前文件上次数据修改的时间 : " & attrs["modification"]
TracePrint "当前文件上次状态更改的时间 : " & attrs["change"]
TracePrint "当前文件大小 : " & attrs["size"]
TracePrint "当前文件权限字符串 : " & attrs["permissions"]
TracePrint "当前文件块分配 : " & attrs["blocks"]
TracePrint "当前文件最优文件系统I / O块大小 : " & attrs["blksize"]

// 获取文件指定属性
TracePrint "当前文件大小 : " & lfs.Attributes(filePath, "size")
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }