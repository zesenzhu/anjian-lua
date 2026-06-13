# sqlite3.GetLassError 获取上一次错误信息

> 来源: https://res.anjian.com/plugin/sqlite3/GetLassError.html

---

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="ts"><tbody><tr><th width="100">命令名称：</th><td class="name"><a name="Delay"></a>GetLassError 获取上一次错误信息</td></tr><tr><th>命令功能：</th><td>获取上一次执行失败时的错误信息</td></tr><tr><th>参数说明：</th><td class="canshu"><pre>无</pre></td></tr><tr><th>返回值：</th><td class="fanhui">字符串，错误信息的内容</td></tr><tr><th><span class="red">脚本例子：</span></th><td class="lizi"><pre id="code">  
Import "sqlite3.lua"
Dim DBpath = GetTempDir() &amp; "test.db"
Dim NewField

<span class="green">// 在sms表中创建body,metal,address三个字段"</span>
NewField = {"body", "metal", "address"}
Dim ret = sqlite3.SQLCreate(DBpath, "sms", NewField)
If ret = false Then 
	TracePrint "创建数据库失败：" &amp; sqlite3.GetLassError()
End If
</pre><script type="text/javascript" src="../../write.js"></script></td></tr></tbody></table>