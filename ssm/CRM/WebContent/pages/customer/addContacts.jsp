<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系人添加</title>
<base href="<%=basePath%>" />
<script src="./statics/libs/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="./statics/css/font-awesome.min.css">
<!--layui ztree样式-->
<link rel="stylesheet" href="./statics/plugins/layui/css/layui.css"
	media="all">
<script src="./statics/plugins/layui/layui.js"></script>
<script src="./statics/plugins/ztree/jquery.ztree.all.min.js"></script>
<link rel="stylesheet"
	href="./statics/plugins/ztree/css/metroStyle/metroStyle.css">
<!--js组件-->
<script src="./common/js/pageGrid.js"></script>
<script src="./common/js/selectTool.js"></script>
<script src="./common/js/radioTool.js"></script>
<script src="./common/js/checkboxTool.js"></script>
<script src="./common/js/treeTool.js"></script>
<script src="./common/js/labelTool.js"></script>
<script src="./common/js/linkSelectTool.js"></script>
<script src="./common/js/uploadTool.js"></script>
<script src="./common/js/HuploadTool.js"></script>
<script src="./common/js/tplTool.js"></script>
<script src="./common/js/editGrid.js"></script>
<!--全局-->
<script src="./common/js/whole/cyLayer.js"></script>
<script src="./common/js/whole/common.js"></script>
<script src="./common/js/whole/setting.js"></script>
<script src="./common/js/whole/utils.js"></script>
<script src="./common/js/whole/monitor.js"></script>
<!--样式-->
<link rel="stylesheet" href="./common/css/cyStyle.css">
<link rel="stylesheet" href="./common/css/cyType.css">
</head>
<body>
	<div class="layui-field-box">
		<form id="form" class="layui-form" action="" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">联系人姓名</label>
				<div class="layui-input-block">
					<input type="hidden" name="customer.customerId" value="${customerId}">
					<input type="text" name="name" lay-verify="name" 
						autocomplete="off" placeholder="请输入联系人姓名" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<select name="gender" lay-verify="gender">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">职位</label>
					<div class="layui-input-inline">
						<input type="text" name="job" autocomplete="off" 
							lay-verify="job" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">办公电话</label>
					<div class="layui-input-inline">
						<input type="text" name="jobTel" autocomplete="off" 
							lay-verify="jobTel" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off" 
							lay-verify="phone" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">备注</label>
					<div class="layui-input-inline">
						<textarea name="remark" class="layui-textarea" placeholder="请输入备注"></textarea>
					</div>
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit"
							data-url="customers/doaddContacts.action">
							<i class="fa fa-floppy-o">&nbsp;</i>保存
						</button>
						<button class="layui-btn" onclick="$t.closeWindow();">
							<i class="fa fa-undo">&nbsp;</i>返回
						</button>
					</div>
				</div>
			</div>
		</form>

	</div>

	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;

			form.verify({
				name : function(value) {
					if (value.length == 0) {
						return '联系人姓名不能为空！';
					}
				},
				gender : function(value) {
					if (value.length == 0) {
						return '性别不能为空！';
					}
				},
				job :function(value) {
					if (value.length == 0) {
						return '职位不能为空！';
					}
				},
				jobTel : function(value) {
					if (value.length == 0) {
						return '办公电话不能为空！';
					}
				},
				phone :function(value) {
					if (value.length == 0) {
						return '手机号码不能为空！';
					}
				}
			});
		});
	</script>

</body>
</html>