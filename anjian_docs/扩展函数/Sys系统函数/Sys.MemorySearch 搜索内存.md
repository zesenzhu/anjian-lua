# Sys.MemorySearch 搜索内存

> 来源: https://res.anjian.com/expand/sys/MemorySearch.html

---

### 函数名称

Sys.MemorySearch 搜索内存

### 函数功能

搜索指定应用的内存，支持联合搜索，支持在上一次的搜索结果上再次搜索过滤

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | ✖ | ✖ | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | ✖ | ✖ | 8.0 |

### 函数语法

ret = Sys.MemorySearch(应用包名, 是否新搜索,搜索内存起始地址,待搜索数据, 数据类型,搜索精度,搜索次数)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| 应用包名 | string | 是 | 待搜索的应用程序包名(可用Sys.Getfont命令获取) |
| 是否新搜索 | bool | 是 | true：新搜索  
false：基于上一次搜索结果按照待搜索数据的条件进行筛选 |
| 搜索内存起始地址 | string | 是 | 以0x开头的字符串地址，如：“0x40947bf8” |
| 待搜索数据 | table | 是 | 具体搜索规则可看备注 |
| 数据类型 | string | 是 | 待搜索的数据类型，参数必须为以下之一：  
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
| 搜索精度 | int | 是 | 取值范围：0-2，0表示搜索范围最广，但速度相对也最慢，依此类推 |
| 搜索次数 | int | 否 | 查询搜索结果的上限次数，默认值: 1024 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 搜索成功返回数组，失败返回空 |

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

```q
搜索规则如下 先搜索tb数组第一个元素里定义的搜索条件，tb数组里第二个元素的再根据第一次搜索的结果集按条件进行筛选，以此类推。   
定义例子如下：
tb = {
    -- 以下 数组 填入几个搜索几次,大于1次即为联合搜索
    -- 第一次查询搜索数据 大于lv,小于hv,首次搜索offset无作用
    {
        ["lv"] = 1,         -- 模糊搜索,搜索内容>=lv值,不填hv为精确搜索,必填
        ["hv"] = 10,        -- 模糊搜索,搜索内容<=hv值,不填hv为精确搜索,可不填
        ["type"] = "u8"     -- 数据类型,指定这条数据用" 无符号的8位整数"的类型进行搜索,可不填,默认与dataType参数一致
["offset"] = 100     -- 基于读写内存起始地址的偏移 可不填默认为0
    },
    -- 第二次查询搜索数据 大于lv 2,小于hv 10, 偏移100(相对于第一次查询到结果地址 + 100
    {
        ["lv"] = 2,         -- 模糊搜索,搜索内容>=lv值,不填hv为精确搜索,必填
        ["hv"] = 10,        -- 模糊搜索,搜索内容<=hv值,不填hv为精确搜索,可不填
["offset"] = 100,   --  -- 基于读写内存起始地址的偏移 可不填默认为0
        ["type"] = "i8"     -- 数据类型,指定这条数据用" 有符号的8位整数"的类型进行搜索,可不填,默认与dataType参数一致
    },
    ...
    -- 第三、第四....
}
```
// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }