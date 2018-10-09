<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";  
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>"/>
<link rel="stylesheet" href="statics/css/zzsc.css" media="all" />
</head>
<body>
<form id="msform">
	<!-- progressbar -->
	<ul id="progressbar">
		<li class="active">验证身份</li>
		<li>获取验证码</li>
		<li>修改密码</li>
	</ul>
	<!-- fieldsets -->
	<fieldset>
		<h2 class="fs-title">验证身份</h2>
		<h3 class="fs-subtitle">请输入你需要找回登录密码的账户名</h3>
		<input type="text" id="account" name="account" placeholder="用户名" />
			
		<input type="button" name="next" class="next1 action-button" value="下一步" /><br/>
		<a href="login.jsp">返回登录</a>
	</fieldset>
	<fieldset>
		<h2 class="fs-title">获取验证码</h2>
		<h3 class="fs-subtitle">输入动态验证码证码身份</h3>	
		<input type="text" id="tel" name="tel" placeholder="电话" />
		<input type="text" id="code" name="code" placeholder="验证码,4位数字" />
		<input onclick="sendCode()" name="发送" value="验证码发送" type="button" class="action-button"/>
		<div>
		<input type="button" name="previous" class="previous action-button" value="上一步" />
		<input type="button" name="next" class="next2 action-button" value="下一步" />
		<br/>
		<a href="login.jsp">返回登录</a>
		</div>
	</fieldset>
	<fieldset>
		<h2 class="fs-title">修改密码</h2>
		<h3 class="fs-subtitle">输入新密码，请记住密码</h3>
		<input type="password" id="password" name="password"  />
		<input type="password" id="repassword" name="repassword"  />
		<input type="submit" name="submit" class="submit action-button" value="提交" />
		<br/>
		<a id="login" href="login.jsp">返回登录</a>
	</fieldset>
</form>

<script src="statics/libs/jquery-1.7.2.js"></script>
<script src="statics/js/zzsc.js"></script>
<script src="statics/js/jquery.easing.js" type="text/javascript"></script>
<div style="text-align:center;clear:both">
<script type="text/javascript">
//点击发送，然后生成验证码，通过短信
function sendCode(){
	var tel = $("#tel").val();
		$.ajax({
			url:'createCode.action',
			type:'post',
			async : false,
			data:{
				'phone':tel,
				'sms':'SMS_139228929'
			},
			success:function(data){
				var result = eval('('+ data +')');
				if(result.code == 1){
					alert("发送成功，注意接收！")
				}
			}
		});
}


</script>
</body>
</html>