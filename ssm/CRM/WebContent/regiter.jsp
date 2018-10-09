
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";  
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<base href="<%=basePath%>"/>
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="statics/css/login.css" media="all" />
<script src="js/sale.js"></script>
</head>
<body>
<!-- <video class="video-player" preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920">
    <source src="statics/login/login.mp4" type="video/mp4">
</video> -->
<img src="statics/login/login.jpg" width="100%" height="100%">
<div class="video_mask"></div>
<div class="login">
    <h1>注册</h1>
       <!-- 表单选项 -->
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <!-- 用户名 -->
      
                <input type="text" id="user" name="account" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
         
            <!-- 对号 -->
       
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
      
            <!-- 错号 -->

                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
  
        </div>
            <!-- 密码 -->
        <div class="layui-form-item">
            
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
         
            <!-- 对号 -->
           
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
       
            <!-- 错号 -->
            
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
       
        </div>
            <!-- 确认密码 -->
        <div class="layui-form-item">
           
                <input type="password" id="rpwd" name="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
        
            <!-- 对号 -->
           
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
        
            <!-- 错号 -->
            
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
          
        </div>
        <div class="layui-form-item">
                <input type="text" id="tel"  name="tel" required  lay-verify="tel" placeholder="请输入手机" autocomplete="off" class="layui-input">
        </div>
		 <div class="layui-form-item">
		 	<div class="layui-input-inline">
            <input id="code" style="width: 70%" class="layui-input" name="code" placeholder="验证码" value=""  lay-verify="required"   lay-verType="tips" autocomplete="off" >
        	<button onclick="sendCode()" type="button" class="layui-btn layui-btn-xs">发送</button>
        	</div>
        </div>
            <button class="layui-btn login_btn"  type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
       
        <hr/>
        <p><a href="login.jsp" class="fl">已有账号？立即登录</a><a href="findPW.jsp" class="fr">忘记密码？</a></p>
    </form>
</div>
<script type="text/javascript" src="statics/plugins/layui/layui.js"></script>
<script src="statics/libs/jquery-1.7.2.js"></script>
<script type="text/javascript">
layui.use(['form','jquery','layer'], function () {
    var form   = layui.form;
    var $      = layui.jquery;
    var layer  = layui.layer;
    //添加表单失焦事件
    //验证表单
    $('#user').blur(function() {
        var account = $(this).val();

        //alert(user);
        $.ajax({
            url:'repeat.action',
            type:'post',
            data:{'account':account},
            //验证用户名是否可用
            success:function(result){
            	var data = eval('('+ result +')')
                if (data.code == 1) {
                    $('#ri').removeAttr('hidden');
                    $('#wr').attr('hidden','hidden');


                } else {
                    $('#wr').removeAttr('hidden');
                    $('#ri').attr('hidden','hidden');
                    layer.msg('当前用户名已被占用! ')

                }

            }
        })

    });

    //验证两次密码是否一致
    $('#rpwd').blur(function() {
            if($('#pwd').val() != $('#rpwd').val()){
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden','hidden');
                layer.msg('两次输入密码不一致!');
            }else {
                $('#rpri').removeAttr('hidden');
                $('#rpwr').attr('hidden','hidden');
            };
    });

    //
    //添加表单监听事件,提交注册信息
    form.on('submit(sub)', function() {
        $.ajax({
            url:'insertUser.action',
            type:'post',
            dataType:'text',
            data:{
                account:$('#user').val(),
                password:$('#pwd').val(),
                tel:$('#tel').val(),
                code:$('#code').val()
            },
            success:function(result){
            	var data = eval('('+ result +')')
                if (data.code == 1) {
                    layer.msg('注册成功');
                    location.href = "login.jsp";
                }else {
                    layer.msg('注册失败');
                }
            }
        })
        //防止页面跳转
        return false;
    });

});
//点击发送，然后生成验证码，通过短信
function sendCode(){
	var tel = $('#tel').val();
	var reg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
	console.log(reg.test(tel));
	if(tel == '' || tel == null || !reg.test(tel)){
		layer.msg('填写正确的电话');
	}else{
		$.ajax({
			url:'createCode.action',
			type:'post',
			asyncs:false,
			data:{
				'phone':tel,
				'sms':"SMS_139238851"
			},
			success:function(data){
				var result = eval('('+ data +')');
				if(result.code == 1){
					layer.msg('发送成功，请查收');
				}
			}
		});
	}
}
</script>
</body>
</html>