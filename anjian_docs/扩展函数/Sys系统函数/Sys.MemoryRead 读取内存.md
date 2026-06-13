# Sys.MemoryRead 读取内存

> 来源: https://res.anjian.com/expand/sys/MemoryRead.html

---

### 函数名称

Sys.MemoryRead 读取内存

### 函数功能

读取应用指定内存地址的值

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | ✖ | ✖ | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | ✖ | ✖ | 8.0 |

### 函数语法

ret = Sys.MemoryRead(应用包名, 内存地址, 数据类型)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| 应用包名 | string | 是 | 待读取的应用程序包名(可用Sys.Getfont命令获取) |
| 内存地址 | string | 是 | 待读取的地址，以0x开头的的字符串地址 如：“0x40947bf8” |
| 数据类型 | string | 是 | 待读取的数据类型，参数必须为以下之一：  
i8 ：有符号8位  
i16：有符号16位  
i32：有符号32位  
i64：有符号64位  
u8 ：无符号8位  
u16：无符号16位  
u32：无符号32位  
u64：无符号64位  
f32：32位浮点数  
f64：64位浮点数 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | string | 读取到的数值，读取不到则返回false |

### 代码范例

```sourceCode lua
Dim 当前应用包名
当前应用包名 = sys.GetFront()
TracePrint 当前应用包名
//以下是以"比武招亲(武林萌主)游戏为例子，通过搜索内存返回的结果进行偏移读取人物信息面板里的等级、经验等数据"
Dim addr = "0x0"
//下面定义的表数据可通过烧饼修改器等内存搜索工具来查找对比获得
Dim tb1 = {"lv":5389}
Dim tb2 = {"lv":5390,"offset":24}
Dim tb = {tb1, tb2}
Dim t = TickCount()
Dim A = Sys.MemorySearch(当前应用包名, True,addr, tb, "i32",0,1)
TracePrint "搜索地址为:"&A(0)&",耗时"&(TickCount()-t)
Dim 等级地址 = 地址相加(A(0), 116)
TracePrint "当前等级为:"&Sys.MemoryRead(当前应用包名,等级地址, "i32")
Dim 当前经验值地址 = 地址相加(A(0), 128)
TracePrint "当前经验值为:"&Sys.MemoryRead(当前应用包名,当前经验值地址, "i32")
Dim 战斗力地址 = 地址相加(A(0), 236)
TracePrint "当前战斗力为:"&Sys.MemoryRead(当前应用包名,战斗力地址, "i32")

Function 地址相加(地址, 偏移)
    Dim A = Right(地址,Len(地址)-2)
    Dim B = Clng("0x"&A)
    Dim C = B+偏移
    Dim D = Hex(C)
    Dim E = "0x"&D
    地址相加 = E
End Function
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }