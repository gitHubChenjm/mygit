
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";  
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<base href="<%=basePath%>"/>
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="statics/css/login.css" media="all" />

</head>
<body>
<!-- <video class="video-player" preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920">
    <source src="statics/login/login.mp4" type="video/mp4">
</video> -->
<img src="statics/login/login.jpg" width="100%" height="100%">
<div class="video_mask"></div>
<div class="login">
    <h1>登录</h1>
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <input class="layui-input" name="account" placeholder="用户名" value="" lay-verify="required"  lay-verType="tips" type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="password" placeholder="密码" value=""  lay-verify="required"   lay-verType="tips"  type="password" autocomplete="off">
        </div>
        <!-- <div class="layui-form-item form_code">
            <input class="layui-input"  style="width: 140px;" name="captcha" placeholder="验证码" lay-verify="required"   lay-verType="tips"  type="text" autocomplete="off">
            <br/>
            <div class="code">
            	<img id="captcha" src="Number.jsp" width="116" height="36" onclick="refreshCode(this)" >
            	
            </div>
        </div> -->
        <div class="layui-form-item form_code">
	    	<div class="code">
	           	<img id="image" src="Number2.jsp" style="cursor: pointer;">
	            	<div class='lablebox'>1</div>
					<div class='lablebox'>2</div>
					<div class='lablebox'>3</div>
					<div class='lablebox'>4</div>           	
	       	</div>
    	</div>
    	<br/><br/><br/><br/><br/>
        <div class="layui-form-item">
          	<div>
          		<a style="float: left;" href="regiter.jsp">注册账号</a>
          		<a style="float: right;" href="findPW.jsp">忘记密码</a>
          	</div>
        </div>
        <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
       
    </form>
</div>
<script type="text/javascript" src="statics/plugins/layui/layui.js"></script>
<script type="text/javascript" src="statics/js/login.js"></script>
<script type="text/javascript">

</script>
</body>
</html>