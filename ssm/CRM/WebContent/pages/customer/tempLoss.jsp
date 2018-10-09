<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>暂缓流失</title>
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
				<label class="layui-form-label"><span class="ft-bold ft-16">编号</span></label>
				<div class="layui-input-block">
					<input type="text" name="lossId" lay-verify="lossId"
						value="${list.lossId}" readonly="readonly" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16">客户</span></label>
				<div class="layui-input-block">
					<input type="text" value="${list.customer.name}" readonly="readonly"
						class="layui-input">
					<input type="hidden" name="customer.customerId" value="${list.customer.customerId}" 
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
					<label class="layui-form-label"><span class="ft-bold ft-16">客户经理</span></label>
					<div class="layui-input-block">
						<input type="text" value="${list.user.account}" readonly="readonly" class="layui-input">
						<input type="hidden" name="user.id" value="${list.user.id}"
							readonly="readonly" class="layui-input">
					</div>
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<span class="ft-bold ft-16">上次下单时间</span>
					</fieldset>
					<div class="layui-input-block">
						<input type="text" name="orderdate"
							value="<fmt:formatDate value='${list.orderdate}' type='date' pattern='yyyy-MM-dd'/>"
							readonly="readonly" class="layui-input">
					</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16">暂缓措施</span></label>
				<div class="layui-input-block">
					<c:if test="${list.measure == ''}"><input type="text" readonly="readonly" value="暂无" class="layui-input"></c:if>
					<c:if test="${list.measure != ''}"><input type="text" readonly="readonly" value="${list.measure}" class="layui-input"></c:if>
				</div>
			</div>

			<div class="layui-form-item">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<span class="ft-bold ft-16">追加暂缓措施</span>
				</fieldset>
				<div class="layui-input-block">
					<textarea name="measure" lay-verify="measure"
						class="layui-textarea" placeholder="请输入暂缓措施"></textarea>
					<input type="hidden" name="reason" id="reason"
							readonly="readonly" class="layui-input">
					<input type="hidden" name="state" value="0"
							readonly="readonly" class="layui-input">
					<input type="hidden" name="confirmdate" 
							readonly="readonly">
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit"
							data-url="customers/doeditLoTemp.action">
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
				measure : function(value) {
					if (value.length == 0) {
						return '请填写暂缓措施！';
					}
				}
			});
		});
		
		//清空流失原因
		var str = '';
		$('#reason').val(str);
	</script>

</body>
</html>