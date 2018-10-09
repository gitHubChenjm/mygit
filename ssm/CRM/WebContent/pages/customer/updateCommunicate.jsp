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
<meta http-equiv="Content-Type" content="multipart/form-data; charset=UTF-8">
<title>交往记录更改</title>
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
		<form id="commuform" class="layui-form" enctype="multipart/form-data" action="" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">交往时间</span></label>
				<div class="layui-input-block">
					<input type="hidden" name="communicateId" value="${communicate.communicateId}"> 
					<input type="text" name="dates" lay-verify="dates" value="<fmt:formatDate value='${communicate.dates}' type='date' pattern='yyyy-MM-dd'/>"
						autocomplete="off" class="layui-input Wdate" id="startCreateDate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">地点</span></label>
				<div class="layui-input-block">
					<input type="text" name="address" lay-verify="address" value="${communicate.address}"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
					<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">概要</span></label>
					<div class="layui-input-block">
						<textarea name="general" class="layui-textarea">${communicate.general}</textarea>
					</div>
			</div>
			<div class="layui-form-item layui-form-text">
					<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">详细信息</span></label>
					<div class="layui-input-block">
						<textarea name="detail" class="layui-textarea">${communicate.detail}</textarea>
					</div>
			</div>
			<div class="layui-form-item layui-form-text">
					<label class="layui-form-label"><span class="ft-green ft-16 ft-bold">备注</span></label>
					<div class="layui-input-block">
						<textarea name="remark" class="layui-textarea">${communicate.remark}</textarea>
					</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">记录文件</span></label>
				<div class="layui-block" style="margin-top: 30px;">
					<button type="button" class="layui-btn" onclick="upLoad()">
						<i class="layui-icon">&#xe67c;</i>选择文件
					</button>
					<input class="layui-upload-file" type="file" name="file1">
					<input type="hidden" name="file" value="${communicate.file}"/>
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit1"
							data-url="customers/doeditCommunicate.action">
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
			dates : function(value) {
				if (value.length == 0) {
					return '日期不能为空！';
				}
			},
			address : function(value) {
				if (value.length == 0) {
					return '地址不能为空！';
				}
			}
		});
	});
	
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  laydate.render({
			    elem: '#startCreateDate', //指定元素
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
	
	function upLoad(){
		$('.layui-upload-file').click();
	}
	</script>

</body>
</html>