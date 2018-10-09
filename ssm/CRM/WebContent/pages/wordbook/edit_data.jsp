<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
	String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增基础数据</title>
<base href="<%=basePath%>" />
<script src="statics/js/jquery.min.js"></script>
<!-- 日期 -->
<link rel="stylesheet" href="statics/css/date.css">
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
			<input id="my-userId" type="hidden" value="${sessionScope.user.id}" />
	    	<div class="layui-form-item">
	    		<label class="layui-form-label">数据编号:</label>
		        <div class="layui-input-inline">
		            <input type="text" value="<%=id %>" id="my-input01" name="id" class="layui-input" readonly="on">
		        </div>
	        	<label class="layui-form-label">数据分类:</label>
		        <div class="layui-input-inline">
		            <select id="my-input02" name="category" lay-filter="category" lay-verify="required">
						<option value='' >请选择分类</option>
					</select>
		        </div>
		        <label class="layui-form-label">分类编号:</label>
		        <div class="layui-input-inline">
		            <input type="text" value="" id="my-input06" class="layui-input" readonly="on">
		        </div>
		        <label class="layui-form-label">数据值:</label>
		        <div class="layui-input-inline">
		            <input type="text" id="my-input03" lay-verify="required" name="value" class="layui-input">
		        </div>
		        <label class="layui-form-label">是否可编辑:</label>
		        <div class="layui-input-inline">
		            <input type="text" id="my-input04" name="editable" class="layui-input" readonly="on">
		        </div>
		        <input id="my-input05" type="hidden" name="title" value="" />
	    	</div>
	    	
	    	
	    	<div class="page-footer">
            	<div class="btn-list">
                	<div class="btnlist">
	                    <button class="layui-btn" lay-submit="" lay-filter="submit" data-url="wordbook/editData.action"  ><i class="fa fa-floppy-o">&nbsp;</i>保存修改</button>
	                    <button class="layui-btn" onclick="$t.closeWindow();"><i class="fa fa-undo">&nbsp;</i>返回</button>
                	</div>
            	</div>
        	</div>
		</form>

	</div>

<script>

	$(document).ready(function(){

		//加载数据分类下拉框列表
		$.ajax({
			url:"wordbook/categorys.action",
			Type:"post",
			async:false,
			data:{},
			success:function(data){
				//alert(data);
				var result = eval('('+ data + ')');
				$.each(result,function(index,element){
					$("#my-input02").append("<option value='"+element.value+"'>"+element.title+"</option>");
				});
			}
		 });
				
		//根据超链接传来的id查询数据信息并加载到控件
		$.post("wordbook/getData.action",{
			"id" : <%=id%>
		},function(data,status){
			data = eval('('+data+')');
			var editable = '';
			if(data.editable == '1') editable = '可编辑';
			else editable = '不可编辑';
			$("#my-input02").val(data.category);
			$("#my-input03").val(data.value);
			$("#my-input04").val(editable);
			$("#my-input05").val(data.title);
			$("#my-input06").val(data.category);
			layui.form.render();	//重新渲染
		});	
		
		//监听下拉框选择事件
		layui.use(['layer', 'form'], function () {
			var form = layui.form;
			form.on('select(category)', function(data){
				var category = data.value; //得到被选中的值
				//alert("监听中");
				$.post("wordbook/getCate.action",{
					"category" : category
				},function(data,status){
					data = eval('('+data+')');
					var editable = '';
					if(data.editable == '1') editable = '可编辑';
					else editable = '不可编辑';
					$("#my-input04").val(editable);
					$("#my-input05").val(data.title);
					$("#my-input06").val(data.value);
					form.render();
				});
			}); 
		});
		
		
		
	});
	
		
			 
	
</script>

</body>
</html>