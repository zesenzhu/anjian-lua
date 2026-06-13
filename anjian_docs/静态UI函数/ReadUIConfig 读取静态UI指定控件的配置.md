# ReadUIConfig 读取静态UI指定控件的配置

> 来源: https://res.anjian.com/uiStatic/ReadUIConfig.html

---

### 函数名称

ReadUIConfig 读取静态UI指定控件的配置

### 函数功能

读取静态UI指定控件的配置

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.3.2 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = ReadUIConfig(name\[,defaultValue\] \[,reload\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| name | string | 是 | 需读取配置的静态UI控件名称，区分大小写 |
| defaultValue | string | 否 | 未读取到配置时的默认值 |
| reload | bool | 否 | 是否重新从本地uiConfig文件中读取配置  
true：从本地uiConfig文件中重新读取配置，并刷新缓存  
false：使用缓存中的配置，该缓存在启动引擎后执行脚本代码前会自动生成一次  
默认：false  
备注：该参数在助手v4.3.0、安卓v4.0.0、iOS新版引擎v2.5.0及以上版本生效 |

### 函数返回

  
| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | 输入框：string  
多选框：bool  
下拉框：int | 读取到的指定控件的配置，未读取到则返回默认值  
输入框返回值类型为字符串，如需用做数值逻辑，请注意类型转换  
下拉框返回的索引值从0开始 |

### 代码范例

```sourceCode lua
import "shanhai.lua"
dim ret,eleList={"输入框1","下拉框1","多选框1"}
Do
    For i = 1 To Len(eleList)
        //从本地uiConfig文件中重新读取配置，并刷新缓存
        ret = ReadUIConfig(eleList[i], "defaultValue", true)
        TracePrint ret,shanhai.type(ret)
        Delay 500
        //使用缓存中的配置
        ret = ReadUIConfig(eleList[i], "defaultValue", false)
        TracePrint ret,shanhai.type(ret)
        Delay 500
        //使用缓存中的配置
        ret = ReadUIConfig(eleList[i], "defaultValue")
        TracePrint ret,shanhai.type(ret)
        Delay 500
    Next
Loop
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }