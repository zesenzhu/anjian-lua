# SendSimpleEmail 发送邮件

> 来源: https://res.anjian.com/basic/net/SendSimpleEmail.html

---

### 函数名称

SendSimpleEmail 发送邮件

### 函数功能

发送一封邮件到指定邮箱

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 3.2.6 | 5.0.0 | 2.0.0 | 1.3.3 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

result = SendSimpleEmail(host,from,authCode,subject,content,to\[,attachment\])

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| host | string | 是 | 邮件服务器地址，如：smtp.qq.com |
| from | string | 是 | 发件人邮箱，需自行开启POP3/SMTP服务 |
| authCode | string | 是 | 发件人邮箱授权码，不是邮箱密码，邮箱账号开启POP3/SMTP服务后可获得服务授权码 |
| subject | string | 是 | 邮件主题 |
| content | string | 是 | 邮件内容 |
| to | string | 是 | 收件人邮箱，多个则用半角分号”;“分隔 |
| attachment | table | 否 | 邮件附件，支持多个附件，每个元素为附件本地路径  
该参数支持版本：安卓版v4.1.1、iOS新版引擎v2.5.0或以上版本 |

### 函数返回

| 返回名 | 返回类型 | 返回说明 |
| --- | --- | --- |
| result | bool | true：成功，false：失败 |

### 代码范例

```sourceCode lua
Dim host ="邮件服务器地址"
Dim from = "发件人邮箱"
Dim authCode = "发件人邮箱授权码"
Dim subject = "邮件主题"
Dim content = "邮件内容"
Dim _to = "收件人邮箱"
//以下参数支持版本：安卓版v4.1.1、iOS新版引擎v2.5.0或以上版本
Dim attachment = {GetTempDir() & "1.png",GetTempDir() & "2.png"}
SnapShot attachment[1], 0, 0, 100, 100
SnapShot attachment[2], 100, 100, 200, 200
TracePrint SendSimpleEmail(host,from,authCode,subject,content,_to,attachment)
```

### 备注说明

无

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }