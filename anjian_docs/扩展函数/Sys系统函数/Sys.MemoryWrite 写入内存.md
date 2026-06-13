# Sys.MemoryWrite 写入内存

> 来源: https://res.anjian.com/expand/sys/MemoryWrite.html

---

### 函数名称

Sys.MemoryWrite 写入内存

### 函数功能

写入值到应用的指定内存地址

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | ✖ | ✖ | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | ✖ | ✖ | 8.0 |

### 函数语法

ret = Sys.MemoryWrite(应用包名,内存地址,写入值,数据类型)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| 应用包名 | string | 是 | 待写入的应用程序包名(可用Sys.Getfont命令获取) |
| 内存起始 | string | 是 | 待写入的地址，以0x开头的字符串地址，如：“0x40947bf8” |
| 写入值 | string | 是 | 待写入的数值，如：“1234” |
| 数据类型 | string | 是 | 写入的数据类型，参数必须为以下之一：  
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
| ret | bool | 写入成功返回true，失败返回false (当为false 时表示此内存区域是不能写入的) |

### 代码范例

```sourceCode lua
Dim 当前应用包名
//以下是以"比武招亲(武林萌主)游戏为例
当前应用包名 = "com.hummingbird.zhaoqin.youai"
TracePrint 当前应用包名
Dim addr = "0x0"
//第一个数据（第二个步骤中定位的地址）
Dim tb1 = {"lv":5389}
//第二个数据,以及他相对于第一个数据的偏移（第二个步骤中定位的地址）
Dim tb2 = {"lv":5390,"offset":24}
//没错，如此漫长的定位，实际上就是为上面的两个table（T_T）
Dim tb = {tb1, tb2}
Dim t = TickCount()
//参数为包名,是否从上次结果中继续搜索(无上次搜索则开始新的搜索),
//地址起点,数据,数据类型,搜索模式(0为完整搜索),搜索数据条数
//返回值为一个数组
Dim A = Sys.MemorySearch(当前应用包名, True,addr, tb, "i32",1,5)       
TracePrint UBound(A)
For Each i in A
    TracePrint i
Next
TracePrint "搜索地址为:"&A(0)&",耗时"&(TickCount()-t)     //A(0)为搜索到的第一个地址
Dim 等级地址 = 地址相加(A(0), 116)                 //进行地址偏移(偏移116为等级地址)
TracePrint "偏移后得到等级地址"&等级地址
Dim t1 = TickCount()
TracePrint "当前等级为:"&Sys.MemoryRead(当前应用包名,等级地址, "i32")     //读取地址的值
TracePrint "读地址耗时"&(TickCount()-t1)
TracePrint Sys.MemoryWrite(当前应用包名,等级地址,"100", "i32")
TracePrint "当前等级为:"&Sys.MemoryRead(当前应用包名,等级地址, "i32")    
Function 地址相加(地址, 偏移)          //简单封装一下偏移的函数
    TracePrint Clng(地址)
    Dim C = Clng(地址)+偏移
    Dim D = Hex(C)
    Dim E = "0x"&D
    地址相加 = E
End Function
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }