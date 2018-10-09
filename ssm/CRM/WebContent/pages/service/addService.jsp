<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务创建</title>
<base href="<%=basePath%>" />
<script src="statics/js/jquery.min.js"></script>
<!-- 日期 -->
<link rel="stylesheet" href="statics/css/date.css">
    <style>
        .demonstration {
            display: block;
            color: #8492a6;
            font-size: 14px;
            margin-top: 20px;
        }
    </style>
<!-- 日期end -->
<link rel="stylesheet" href="statics/css/font-awesome.min.css">
<!--layui ztree样式-->
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css"
	media="all">
<script src="statics/plugins/layui/layui.js"></script>
<script src="statics/plugins/ztree/jquery.ztree.all.min.js"></script>
<link rel="stylesheet"
	href="statics/plugins/ztree/css/metroStyle/metroStyle.css">
<!--js组件-->
<script src="common/js/pageGrid.js"></script>
<script src="common/js/selectTool.js"></script>
<script src="common/js/radioTool.js"></script>
<script src="common/js/checkboxTool.js"></script>
<script src="common/js/treeTool.js"></script>
<script src="common/js/labelTool.js"></script>
<script src="common/js/linkSelectTool.js"></script>
<script src="common/js/uploadTool.js"></script>
<script src="common/js/HuploadTool.js"></script>
<script src="common/js/tplTool.js"></script>
<script src="common/js/editGrid.js"></script>
<!--全局-->
<script src="common/js/whole/cyLayer.js"></script>
<script src="common/js/whole/common.js"></script>
<script src="common/js/whole/setting.js"></script>
<script src="common/js/whole/utils.js"></script>
<script src="common/js/whole/monitor.js"></script>
<!--样式-->
<link rel="stylesheet" href="common/css/cyStyle.css">
<link rel="stylesheet" href="common/css/cyType.css">
</head>
<body>
	<div class="layui-field-box">
		<form id="form" class="layui-form"  method="post">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  				<legend>信息显示</legend>
			</fieldset>
			<div class="layui-form-item">
				<label class="layui-form-label">服务状态</label>
				<div class="layui-input-inline">
					<input type="hidden"  value="71"  name="statusId.id"
						class="layui-input" >
					 <input type="text"  value="新创建" 
						class="layui-input" readonly unselectable="on"> 
				</div>
				
	     		 <label class="layui-form-label">创建日期</label>
	      			<div class="layui-input-inline">
	       		 		<input type="text" id="createDate" name="createDate" class="layui-input" readonly unselectable="on">
	     		 </div>
	     		 
	     		 <label class="layui-form-label" >创建人</label>
				 <div class="layui-input-inline">
					<input type="hidden" value="${user.id}" name="createId.id"/>
					<input type="text"  value="${user.account}" class="layui-input"
						 readonly unselectable="on">
				 </div>   			 
				
			</div>

			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  				<legend>信息录入</legend>
			</fieldset>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">概要</label>
				<div class="layui-input-block">
					<textarea lay-verify="required" name="summary" placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">客户</label>
				<div class="layui-input-block">
					<select id="option1" name="customer.customerId" lay-filter="aihao">
						<c:forEach items="${listCustomer}" var="customer">
							<option value="${customer.customerId}">${customer.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">服务请求</label>
				<div class="layui-input-block">
					<textarea lay-verify="required" name="request" placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">服务类型</label>
				<div class="layui-input-inline">
					<select id="option" name="servicecategoryId.id" lay-filter="aihao">
						
					</select>
				</div>
				
				<label class="layui-form-label">服务方式</label>
				<div class="layui-input-inline">
					<select id="option2" name="serviceStyle.id" lay-filter="aihao">
						
					</select>
				</div>
			</div>
				
			
			
			<div class="page-footer">
            <div class="btn-list">
                <div class="btnlist">
                    <!-- <button class="layui-btn" type="button" onclick="add()"><i class="fa fa-floppy-o">&nbsp;</i>保存</button> -->
                    <button class="layui-btn" lay-submit="" lay-filter="submit" data-url="service/doinsert.action"  ><i class="fa fa-floppy-o">&nbsp;</i>保存</button>
                    <button class="layui-btn" onclick="$t.closeWindow();"><i class="fa fa-undo">&nbsp;</i>返回</button>
                </div>
            </div>
        </div>
		</form>

	</div>
	<script>
		
$(function() {
	//查找所有服务类型
	 $.ajax({
		 url:'service/wordbook.action',
		 type:'post',
		 async:false,
		 data:{
			 'category':'5'
		 },
		 success:function(data){	 
			
			 var result = eval('('+ data + ')')
			 $.each(result,function(idx,obj){
					$('#option').append("<option value='"+obj.id+"'>"+ obj.value +"</option>")
			
			 });
			 
		 }
	 });
	//查找所有客户
	 $.ajax({
		 url:'service/customer.action',
		 type:'post',
		 async:false,
		 success:function(data){	 
			
			 var result = eval('('+ data + ')')
			 $.each(result,function(idx,obj){
					$('#option1').append("<option value='"+obj.customerId+"'>"+ obj.name +"</option>")
			
			 });
			 
		 }
	 });

	//查找所有服务方式
	  $.ajax({
			 url:'service/wordbook.action',
			 type:'post',
			 async:false,
			 data:{
				 'category':'7'
			 },
			 success:function(data){	 
				
				 var result = eval('('+ data + ')')
				 $.each(result,function(idx,obj){
						$('#option2').append("<option value='"+obj.id+"'>"+ obj.value +"</option>")
				
				 });
				 
			 }
		});
	
	  $('#createDate').val(getDate(''));
});//end
function add(){

	$.ajax({
		url:'service/doinsert.action',
		type:'post',
		async:false,
		data:$('#form').serialize(),
		success:function(result){
			//console.log(result);
			if(result.status == -1){
				alert(result.msg);
			}
			$t.closeWindow();
			Msg.success("添加成功");
			return false;
		}
		
	});
}

function p(s) {
    return s < 10 ? '0' + s: s;
}

function getDate(date){
	var myDate;
	if(date != ''){
		myDate = new Date(date);
	}else{
		myDate = new Date();
	}
	 	var year=myDate.getFullYear();
	    //获取当前月
	    var month=myDate.getMonth()+1;
	    //获取当前日
	    var date=myDate.getDate(); 
	    var h=myDate.getHours();       //获取当前小时数(0-23)
	    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
	    var s=myDate.getSeconds();  

	    var now=year+'-'+p(month)+"-"+p(date)+" "+p(h)+':'+p(m)+":"+p(s);
		return now;
}			 
	
</script>

</body>
</html>