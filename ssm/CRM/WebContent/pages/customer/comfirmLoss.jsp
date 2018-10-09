<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认流失</title>
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
					<input type="text" name="lossId" lay-verify="lossId" value="${list.lossId}"
						readonly="readonly" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16">客户</span></label>
				<div class="layui-input-block">
					<input type="text" value="${list.customer.name}" readonly="readonly"
						class="layui-input">
					<input type="hidden" name="customer.customerId" value="${list.customer.customerId}"
							readonly="readonly" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold ft-16">客户经理</span></label>
					<div class="layui-input-block">
						<input type="text" value="${list.user.account}" readonly="readonly" class="layui-input">
						<input type="hidden" name="user.id" value="${list.user.id}"
							readonly="readonly" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 30px;">
					<span class="ft-bold ft-16">上次下单时间</span>
				</fieldset>
				<div class="layui-input-block">
					<input type="text" name="orderdate"
						value="<fmt:formatDate value='${list.orderdate}' type='date' pattern='yyyy-MM-dd'/>"
						readonly="readonly" class="layui-input"> <input
						type="hidden" name="confirmdate" id="confirm" readonly="readonly"
						class="layui-input"> <input type="hidden" name="state"
						value="1" readonly="readonly" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16">暂缓措施</span></label>
				<div class="layui-input-block">
					<c:if test="${list.measure == ''}"><input type="text" name="measure" readonly="readonly" value="暂无" class="layui-input"></c:if>
					<c:if test="${list.measure != ''}"><input type="text" name="measure" readonly="readonly" value="${list.measure}" class="layui-input"></c:if>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16">流失原因</span></label>
				<div class="layui-input-block">
					<textarea name="reason" class="layui-textarea" lay-verify="reason" placeholder="请输入流失原因"></textarea>
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit"
							data-url="customers/doeditLoComfirm.action">
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
				reason : function(value) {
					if (value.length == 0) {
						return '请填写流失原因！';
					}
				}
			});
		});
		
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

			    var now=year+'-'+p(month)+"-"+p(date);
				return now;
		}
		
		//设置确认流失时间为当前时间
		$('#confirm').val(getDate(new Date()));
	</script>

</body>
</html>