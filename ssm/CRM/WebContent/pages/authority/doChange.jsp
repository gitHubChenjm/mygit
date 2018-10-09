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
<!-- //根据网页传来的id集合 -->
<input id="list" type="hidden" value="<%=request.getParameter("list")%>"/>
	<div class="layui-field-box">
		<form id="form" class="layui-form"  method="post">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  				<legend>下拉框用户统一分配角色</legend>
		</fieldset>
			<div class="layui-form-item">
				<label class="layui-form-label">用户</label>
				<div class="layui-input-block">
					<select id="option1" name="customer.customerId" lay-filter="aihao" readonly="readonly">
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-block">
					<select id="option2" name="roleId" lay-filter="aihao">
						
					</select>
				</div>
			</div>
			
			<div class="page-footer">
            <div class="btn-list">
                <div class="btnlist">
                    <!-- <button class="layui-btn" type="button" onclick="add()"><i class="fa fa-floppy-o">&nbsp;</i>保存</button> -->
                    <button class="layui-btn"  onclick="doChange()"  ><i class="fa fa-floppy-o">&nbsp;</i>修改</button>
                    <button class="layui-btn" onclick="$t.closeWindow();"><i class="fa fa-undo">&nbsp;</i>返回</button>
                </div>
            </div>
        </div>
		</form>

	</div>
<script type="text/javascript">
	$(function(){
		//加载用户
		$.ajax({
			url:"authority/findListUser.action",
			type:'post',
			data:{"more":$('#list').val()},
			async : false,
			success:function(data){
				var result = eval('('+ data +')');
				console.log(result);
				$.each(result,function(idx,obj){
					
					$('#option1').append(
							"<option value='"+obj.id+"'>" + obj.account
									+ "</option>")
				});
			}
		});
		//加载角色
		$.ajax({
			url:"authority/findAllRole.action",
			type:'post',
			async : false,
			success:function(data){
				var result = eval('('+ data +')');
				console.log(result);
				$.each(result,function(idx,obj){
					
					$('#option2').append(
							"<option value='"+obj.roleId+"'>" + obj.roleName
									+ "</option>")
				});
			}
		});
		layui.form.render();
	});
	
	function doChange(){
		
			$.ajax({
				url : "authority/doChangeRole.action",
				dataType : "text",
				type : "POST",
				async : false,
				data : {
					"list" : $('#list').val(),
					"roleId" : $('#option2').val()
				},
				success : function(data){
					var r = eval('(' + data + ')');
					if (r.msg == 1) {
						$t.Refresh();
						parent.layer.msg('修改成功 !',{icon:1});
					}
				}
			});
		
	}
</script>
</body>
</html>