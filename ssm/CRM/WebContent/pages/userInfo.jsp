<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="statics/img/favicon.ico" media="screen" />
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css">
<link rel="stylesheet"
	href="statics/plugins/layer/skin/default/layer.css">
<link rel="stylesheet" href="statics/css/font-awesome.min.css">
<link rel="stylesheet" href="statics/css/index.css">
<script src="statics/js/jquery.min.js"></script>
<script src="statics/plugins/layui/layui.js"></script>
<script src="js/sale.js"></script>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">设置我的资料</div>
          <div class="layui-card-body" pad15="">
            <form id="form" action="editUser.action" method="post" enctype="multipart/form-data">
            <!--用户id  -->
            <input id="id" type="hidden" name="id" value=" ${sessionScope.user.id}" /><!-- -->
            <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">我的角色</label>
                <div class="layui-input-inline">
                  <input type="text" id="roleName" value="xianxin" readonly="" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" id="account"  value="xianxin" readonly="" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                  <input type="text" name="nikName" id="nikName" value="贤心"  autocomplete="off" placeholder="请输入昵称" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">头像</label>
                <div class="layui-input-inline">
                  <img  src="" id="head" style="width: 100px;height: 100px;">
                  <button type="button" class="layui-btn layui-btn-primary" onclick="upLoad()">
                    <i class="layui-icon"></i>上传图片
                  </button><input class="layui-upload-file" type="file" onchange="xmTanUploadImg(this)" name="pictureFile">
                </div>
               
             </div>
              <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                  <input type="text" id="tel" name="tel"  value="" lay-verify="tel" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" >确认修改</button>
                  <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="statics/libs/jquery-1.10.2.min.js"></script>

	
	<script type="text/javascript">
		function upLoad(){
			$('.layui-upload-file').click();
		}
		$(function(){
			$.ajax({
				url:'findUserRole.action',
				data:{
					id:$('#id').val()
				},
				success:function(data){
					var data = eval('('+ data +')');
					$('#roleName').val(data.role.roleName);
					$('#account').val(data.user.account);
					$('#head').attr('src',data.user.head);
					$('#tel').val(data.user.tel);
				}
			});
		});
		function xmTanUploadImg(obj){
			 var file = obj.files[0];
             
             console.log(obj);console.log(file);
             console.log("file.size = " + file.size);  //file.size 单位为byte

             var reader = new FileReader();

             //读取文件过程方法
             reader.onloadstart = function (e) {
                 console.log("开始读取....");
             }
             reader.onprogress = function (e) {
                 console.log("正在读取中....");
             }
             reader.onabort = function (e) {
                 console.log("中断读取....");
             }
             reader.onerror = function (e) {
                 console.log("读取异常....");
             }
             reader.onload = function (e) {
                 console.log("成功读取....");

                 var img = document.getElementById("head");
                 img.src = e.target.result;
                 //或者 img.src = this.result;  //e.target == this
             }

             reader.readAsDataURL(file)
		}
		
		
	</script>
</body>
</html>