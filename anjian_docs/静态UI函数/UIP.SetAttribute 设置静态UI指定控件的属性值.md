# UIP.SetAttribute 设置静态UI指定控件的属性值

> 来源: https://res.anjian.com/uiStatic/SetAttribute.html

---

### 函数名称

UIP.SetAttribute 设置静态UI控件的属性值

### 函数功能

设置静态UI控件的属性值，只支持在静态ui事件中调用，不支持在主程序中调用

### 支持环境

     
| 系统及平台 | ide（助手） | 安卓（root） | 安卓（无障碍 ） | iOS新版（引擎版本） | iOS旧版 |
| --- | --- | --- | --- | --- | --- |
| 最低客户端版本 | 1.0.0 | 1.0.0 | 5.0.0 | 2.0.0 | 1.0.0 |
| 最低系统版本 | windows 7 | 4.4 | 7.0 | 13.0 | 8.0 |

### 函数语法

UIP.SetAttribute (eleName,\_table)

### 函数参数

   
| 参数名 | 参数类型 | 是否必选 | 参数说明 |
| --- | --- | --- | --- |
| eleName | string | 是 | 欲设值其属性的静态UI控件名称 |
| \_table | table | 是 | 包含修改新值的键值表，将修改对应属性值 |

### 函数返回

无

### 代码范例

```sourceCode lua
 //以下是界面ui代码，复制到【界面】左侧代码
界面:
{
    下拉框改变选择事件:
    {
        文字框:{名称:"文字框1",显示内容:"  下拉框二级联动测试 ",文字大小:0,高度:0,宽度:0},
        水平布局:
        {
            注释:"用于将多个控件放在同一行",
            下拉框:{名称:"pro",选项:["湖南","江西","广东","福建",],选择响应:"onProc",初始选项:0},
            下拉框:{名称:"city",选项:["长沙","衡阳","娄底","岳阳"],初始选项:0},
        },
    },
}


//以下是界面ui事件代码，复制到【界面】右侧代码
//预览此例子界面,通过下拉框改变选择可以实现下拉框内容二级联动
Function onProc(item)//下拉框响应事件支持传参选择项
    Dim cityItem = UIP.GetAttribute("city")
    Dim hnCitys = {"长沙", "衡阳", "郴州", "娄底"}
    Dim jxCitys = {"南昌", "鹰潭", "九江", "景德镇"}
    Dim gdCitys = {"广州", "佛山", "惠州", "深圳"}
    Dim fjCitys = {"福州", "厦门", "泉州", "宁德"}
    Dim hnTb = {"选项": hnCitys,"初始选项":cityItem["初始选项"]}
    Dim jxTb = {"选项": jxCitys,"初始选项":cityItem["初始选项"]}
    Dim gdTb = {"选项": gdCitys,"初始选项":cityItem["初始选项"]}
    Dim fjTb = {"选项": fjCitys,"初始选项":cityItem["初始选项"]}
    Select Case item
    Case 0
        UIP.SetAttribute "city", hnTb
    Case 1
        Uip.setAttribute "city", jxTb
    Case 2
        UIP.SetAttribute "city", gdTb
    Case 3
        Uip.setAttribute "city", fjTb
    End Select
End Function 
```

### 备注说明

控件属性中的“点击响应”事件函数名必须与ui事件代码中的函数名一致

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }