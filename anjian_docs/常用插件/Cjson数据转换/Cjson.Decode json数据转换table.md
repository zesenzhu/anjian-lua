# Cjson.Decode json数据转换table

> 来源: https://res.anjian.com/plugin/cjson/Decode.html

---

### 函数名称

Cjson.Decode json数据转换table

### 函数功能

json字符串转成table数据

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

ret = Cjson.Decode(json)

### 函数参数

| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| json | string | 是 | json字符串 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| ret | table | 返回json字符串所对应的键值表 |

### 代码范例

```sourceCode lua
Import "Cjson.lua"
Dim jsonStr, infoTable

jsonStr = "{""code"":200, ""msg"":""获取成功"", ""data"":{""nickname"":""按键精灵"", ""level"":99, ""vip"":true}}"

infoTable = Cjson.Decode(jsonStr)

If infoTable["code"] = 200 Then
    TracePrint "状态信息: " & infoTable["msg"]
    
    TracePrint "用户昵称: " & infoTable["data"]["nickname"]
    TracePrint "用户等级: " & infoTable["data"]["level"]
    
    If infoTable["data"]["vip"] Then 
        TracePrint "VIP身份: 是"
    Else 
        TracePrint "VIP身份: 否"
    End If
Else
    TracePrint "数据获取失败"
End If
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }