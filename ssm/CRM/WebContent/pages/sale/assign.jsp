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
			<input id="my-userId" type="hidden" value="${sessionScope.user.id}" />
	    	<div class="layui-form-item">
	        	<label class="layui-form-label">客户经理:</label>
		        <div class="layui-input-inline">
		            <select id="my-input02" name="category" lay-filter="aihao" lay-verify="required">
						<option value='' >请选择</option>
					</select>
		        </div>
	    	</div>
	    	
	    	
	    	<div class="page-footer">
            	<div class="btn-list">
                	<div class="btnlist">
	                    <button type="button" onclick="assign()" class="layui-btn"><i class="fa fa-floppy-o">&nbsp;</i>确认指派</button>
	                    <button class="layui-btn" onclick="$t.closeWindow();"><i class="fa fa-undo">&nbsp;</i>返回</button>
                	</div>
            	</div>
        	</div>
		</form>

	</div>

<script>

	$(document).ready(function(){
		
		$.ajax({
			url:"sale/cmanagers.action",
			Type:"post",
			async:false,
			data:{},
			success:function(data){
				//alert(data);
				var result = eval('('+ data + ')');
				$.each(result,function(index,element){
					$("#my-input02").append("<option value='"+element.id+"'>"+element.account+"</option>");
				});
			}
		 });
		
		layui.use(['layer', 'form'], function () {
		    //重新渲染下拉框
		    var form=layui.form;
		    form.render();//layui没有写这个，操作后没有效果
		});
		
		
		
	});
	
	function assign(){
		var saleId = <%=id %>;
		var dealId = $("#my-input02").val();
		if(dealId == '') {
			Msg.info("请选择负责人");
			return false;
		}
		$.post("sale/doDeal.action",{
			 "saleId" : saleId,
		 	 "dealId.id" : dealId
		 },function(result,status){
			 result = eval('('+result+')');
			 if (result.code == 0) {
                parent.layer.msg('指派成功 !', {icon: 1});   
                
                $t.closeWindow();     

            } else {
                parent.layer.msg('指派失败 !', {icon: 5});
            }
		 });
	}

			 
	
</script>
</body>
</html>