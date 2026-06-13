# WriteConfig 写入配置

> 来源: https://res.anjian.com/basic/config/WriteConfig.html

---

### 函数名称

WriteConfig 写入配置

### 函数功能

写入配置到本地配置文件，各脚本间配置独立，配置永久保存直至删除本地配置文件

安卓版v4.2.3及以上版本支持在静态ui事件中调用该函数

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

WriteConfig(key,val\[,state\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| key | string | 是 | 配置项名称 |
| val | string  
number  
bool | 是 | 配置项数据，暂不支持写入table类型，可先转成json字符串后写入 |
| state | bool | 否 | 是否立即写入本地配置文件，为提高执行效率，默认为false  
false：写入缓存，该缓存启动脚本时生成，不立即写入本地配置文件  
true：立即写入缓存和本地配置文件  
**注意：**如在静态ui事件中调用该函数需要传true |

### 函数返回

无

### 代码范例

```sourceCode lua
//向移动配置项写入一个数据8
WriteConfig ("移动", 8,true)
//结束脚本后运行
traceprint ReadConfig("移动", 6) 
//输出为8，而不是默认的6
```

### 备注说明

这个命令是配合 WriteConfig 写入配置使用的，读取的值是由WriteConfig写入，并非从UI界面中读取

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }