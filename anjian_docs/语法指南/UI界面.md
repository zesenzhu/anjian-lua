# UI界面

> 来源: https://res.anjian.com/syntax/UI界面.html

---

## 静态界面

静态界面通常就是在运行脚本之前显示的UI界面，用来给用户提供自定义配置

和静态界面类似的还有一种动态界面，是通过编写代码在运行脚本过程中动态创建，具体命令请参考相应的命令文档

> ⚠️注意：使用助手调试的时候想要读取静态界面的值，需要先预览界面并保存才行

### 基本结构

静态界面采用**类JSON**格式编写，具有以下层级结构：

```q
界面 (根容器)
├── 标签页1
│   ├── 控件1
│   ├── 控件2
│   └── ...
├── 标签页2
│   └── ...
└── ...
```

**结构说明：**

1.  **根容器**: 最外层必须以 `界面` 开头命名
2.  **标签页**: 界面内可包含多个标签页，用于分组组织控件
3.  **控件**: 每个标签页内可包含多个不同类型的控件

* * *

### 添加控件

在按键助手中使用静态界面：

1.  打开左侧【界面】页面
2.  点击所需控件，代码自动插入到光标位置
3.  ⚠️除了 `文字框` 控件以外，其余控件的 `名称` 属性的值不允许重复
4.  预览界面并保存后，方可在调试时读取界面值

* * *

### 控件布局

#### 垂直布局（默认）

*   控件默认垂直排列
*   每个控件占据一整行
*   显示顺序与代码顺序一致，自上而下排列

```sourceCode json
界面1:
{
    标签页1:
    {
        多选框:
        {
            名称:"多选框1",
            提示内容:"功能一",
            点击响应:"函数名1",
            选中:false,
            文字大小:0,
            高度:0,
            宽度:0,
        },  
        多选框:
        {
            名称:"多选框2",
            提示内容:"功能二",
            点击响应:"函数名1",
            选中:false,
            文字大小:0,
            高度:0,
            宽度:0,
        },  
    },  
}
```

#### 水平布局

*   使用 `水平布局` 控件可以让多个控件显示在一行

```sourceCode json
界面1:
{
    标签页1:
    {
        水平布局:
        {
            文字框:
            {
                名称:"文字框1",
                显示内容:"账号：",
                文字大小:0,
                高度:0,
                宽度:0,
            },  
            输入框:
            {
                名称:"输入框1",
                提示内容:"在这里输入账号",
                初始文本:"",
                仅输入数字:false,
                密码:false,
                文字大小:0,
                最大输入长度:0,
                高度:0,
                宽度:0,
            },  
        },  
        水平布局:
        {
            文字框:
            {
                名称:"文字框1",
                显示内容:"密码：",
                文字大小:0,
                高度:0,
                宽度:0,
            },  
            输入框:
            {
                名称:"输入框2",
                提示内容:"在这里输入密码",
                初始文本:"",
                仅输入数字:false,
                密码:true,
                文字大小:0,
                最大输入长度:0,
                高度:0,
                宽度:0,
            },  
        },  
    },
}
```

* * *

### 公共属性

每个控件除了有各自特殊的属性外，还有一些通用的属性

*   **名称：**控件的唯一标识，用于 `ReadUIConfig` 命令读取控件的值，除了 `文字框` 控件以外，其余控件的值不允许重复
*   **文字大小：**设置控件中显示的文字的大小
*   **高度：**设置控件占用的高度
*   **宽度：**设置控件占用的高度
*   **注释：**用于在代码中对控件进行注释说明，不会显示在界面上

⚠️**注意：**`下拉框` 控件没有`文字大小`、 `高度`、 `宽度` 这三个属性

* * *

### 控件说明

#### 文字框控件

仅用于展示说明文字，无法交互或读取。

```sourceCode json
文字框:
{
    名称:"文字框1",
    显示内容:"显示内容",
    文字大小:0,
    高度:0,
    宽度:0,
},
```

⚠️注意：文字控件只是用于文字说明，无法进行修改和读取内容

#### 输入框控件

用于接收用户输入内容。使用 `ReadUIConfig` 命令读取到的是 `初始文本` 属性的值

```sourceCode json
输入框:
{
    名称:"输入框1",
    提示内容:"提示用户应该输入什么内容",
    初始文本:"用户首次输入之前，输入框中的文本",
    仅输入数字:false,
    密码:false,
    文字大小:0,
    最大输入长度:0,
    高度:0,
    宽度:0,
},  
```

**属性说明：**

*   **提示内容：**输入框为空时显示的引导文字
*   **初始文本：**输入框默认内容
*   **仅输入数字：**`true` 限制仅输入数字
*   **密码：**`true` 时输入内容显示为 `*`

#### 按钮控件

用于绑定点击事件，触发相应函数。

```sourceCode json
按钮:
{
    名称:"按钮1",
    显示内容:"显示内容",
    点击响应:"函数名1",
    文字大小:0,
    高度:0,
    宽度:0,
},  
```

**属性说明：**

*   **显示内容：**按钮上显示的文字
*   **点击响应：**字符串，填写事件函数的名称，**点击按钮**会触发此函数。

#### 多选框控件

通常适用于布尔判断场景（启用/禁用某功能），使用 `ReadUIConfig` 命令读取到的是 `选中` 属性的值

```sourceCode json
多选框:
{
    名称:"多选框1",
    提示内容:"提示用户的文字内容",
    点击响应:"函数名1",
    选中:false,
    文字大小:0,
    高度:0,
    宽度:0,
},  
```

**属性说明：**

*   **提示内容：**显示多选框的文字说明
*   **点击响应：**字符串，填写事件函数的名称，**改变选中状态**会触发此函数。
*   **选中：**布尔型，为 `true` 时多选框为选中状态，`false` 为取消选中

#### 下拉框控件

用于选择多个预设项中的一个，使用 `ReadUIConfig` 命令读取到的是 `初始选项` 属性的值

```sourceCode json
下拉框:
{
    名称:"下拉框1",
    选择响应:"函数名1",
    选项:["选项1","选项2","选项3"],
    初始选项:0,
},  
```

**属性说明：**

*   **选择响应：**字符串，填写事件函数的名称，在**界面加载**和**改变选项**会触发此函数。
*   **选项：**数组，用于设置下拉框中的选项内容。使用中括号 `[]` 组成数组元素，每个元素都是一个选项
*   **初始选项：**整数，设定默认情况下显示第几个选项，索引从0开始

## 静态界面响应函数

在UI界面右侧编写响应函数，用来和UI进行交互

**规则：**

*   事件函数以外的代码不会被执行
*   允许在函数外定义全局变量（但**不可在定义时直接赋值**）
*   可以通过 `UIP.GetAttribute` 和 `UIP.SetAttribute` 方法获取或设置静态界面控件的属性值
*   以下类型的命令不支持执行：
    *   图色命令、触摸命令、元素命令
    *   任何需要 root 权限的命令（具体命令需自行测试验证）

// 给每个 <pre> 标签加复制按钮（兼容IE版） var preElements = document.querySelectorAll('pre'); for (var i = 0; i < preElements.length; i++) { (function(preElement) { // 创建按钮 var copyButton = document.createElement('button'); copyButton.innerText = '复制'; copyButton.style.position = 'absolute'; copyButton.style.top = '8px'; copyButton.style.right = '8px'; copyButton.style.padding = '4px 8px'; copyButton.style.fontSize = '12px'; copyButton.style.cursor = 'pointer'; copyButton.style.zIndex = '10'; // 包装一层div var wrapper = document.createElement('div'); wrapper.style.position = 'relative'; wrapper.appendChild(copyButton); wrapper.appendChild(preElement.cloneNode(true)); preElement.parentNode.replaceChild(wrapper, preElement); // 点击按钮 copyButton.addEventListener('click', function() { var codeText = ''; var codeText = wrapper.querySelector('pre').innerText || wrapper.querySelector('pre').textContent; // 确保使用正确的换行符 codeText = codeText.replace(/\\r\\n|\\r|\\n/g, '\\r\\n'); // 统一使用CRLF换行符 if (navigator.clipboard && navigator.clipboard.writeText) { navigator.clipboard.writeText(codeText).then(function() { copyButton.innerText = '已复制!'; setTimeout(function() { copyButton.innerText = '复制'; }, 2000); }).catch(function(err) { console.error('复制失败', err); }); } else { var textArea = document.createElement('textarea'); textArea.value = codeText; document.body.appendChild(textArea); textArea.focus(); textArea.select(); try { var successful = document.execCommand('copy'); if (successful) { copyButton.innerText = '已复制!'; } else { copyButton.innerText = '复制失败'; } setTimeout(function() { copyButton.innerText = '复制'; }, 2000); } catch (err) { console.error('Fallback: 复制失败', err); } document.body.removeChild(textArea); } }); })(preElements\[i\]); }