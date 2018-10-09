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
<title>联系人更改</title>
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
				<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">联系人姓名</span></label>
				<div class="layui-input-block">
				<input type="hidden" name="contactsId" value="${contacts.contactsId}">
					<input type="text" name="name" lay-verify="name" value="${contacts.name}"
						autocomplete="off" placeholder="请输入联系人姓名" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">性别    </span></label>
				<div class="layui-input-block">
					<select name="gender" lay-verify="gender">
							<option value="${contacts.gender}">${contacts.gender}</option>
							<c:if test="${contacts.gender == '男'}"><option value="女">女</option></c:if>
							<c:if test="${contacts.gender == '女'}"><option value="男">男</option></c:if>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">职位</span></label>
					<div class="layui-input-inline">
						<input type="text" name="job" lay-verify="job" value="${contacts.job}"
						autocomplete="off" placeholder="请输入职位" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">办公电话</span></label>
					<div class="layui-input-inline">
						<input type="text" name="jobTel" autocomplete="off" value="${contacts.jobTel}"
							lay-verify="jobTel" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">手机号码</span></label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off" value="${contacts.phone}"
							lay-verify="phone" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  					<legend><span class="ft-green ft-16 ft-bold">备注</span></legend>
				</fieldset>
				<div class="layui-input-block">
					<textarea name="remark" class="layui-textarea" placeholder="请输入备注">${contacts.remark}</textarea>
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit"
							data-url="customers/doeditContacts.action">
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