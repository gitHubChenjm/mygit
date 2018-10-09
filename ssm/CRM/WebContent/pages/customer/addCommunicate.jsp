<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=UTF-8">
<title>交往记录添加</title>
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
				<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">交往时间</span></label>
				<div class="layui-input-block">
					<input type="hidden" name="customer.customerId" value="${customerId}">
					<input type="text" name="dates" lay-verify="dates" 
						 placeholder="请输入交往时间" class="layui-input Wdate" id="dates"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">地点</span></label>
				<div class="layui-input-block">
					<input type="text" name="address" lay-verify="address" 
						autocomplete="off" placeholder="请输入交往地点" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-block">
					<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">概要</span></label>
					<div class="layui-input-block">
						<textarea name="general" class="layui-textarea" placeholder="请输入概要"></textarea>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-block">
					<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">详细信息</span></label>
					<div class="layui-input-block">
						<textarea name="detail" class="layui-textarea" placeholder="请输入详细信息"></textarea>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-block">
					<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">备注</span></label>
					<div class="layui-input-block">
						<textarea name="remark" class="layui-textarea" placeholder="请输入备注"></textarea>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">记录文件</span></label>
				<div class="layui-block" style="margin-top: 30px;">
					<!-- <button type="button" class="layui-btn" id="upload">
						<i class="layui-icon">&#xe67c;</i>选择文件
					</button> -->
					<button type="button" class="layui-btn" onclick="upLoad()">
						<i class="layui-icon">&#xe67c;</i>选择文件
					</button>
					<input class="layui-upload-file" type="file" name="file1">
				</div>
				<!-- <div class="layui-row" align="left" style="margin-top: 30px;">
					<textarea id="result" name="file1" cols="50" rows="10"></textarea>
				</div> -->
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit1"
							data-url="customers/doaddCommunicate.action">
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
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  laydate.render({
				    elem: '#dates', //指定元素
				  });
			});
		layui.use('form', function() {
			var form = layui.form;

			form.verify({
				dates : function(value) {
					if (value.length == 0) {
						return '交往日期不能为空！';
					}
				},
				address : function(value) {
					if (value.length == 0) {
						return '地址不能为空！';
					}
				}
			});
		});
		
		function upLoad(){
			$('.layui-upload-file').click();
		}
		
		/* layui.use('upload', function(){
	        var upload = layui.upload;

	        //执行上传
	        var uploadInst = upload.render({
	            elem: '#upload' //绑定元素
	            ,url: 'customers/doaddCommunicate' //上传接口
	            ,auto: false
	            ,method: 'POST'
	            ,accept: 'file'
	            ,size: 1024
	            ,before: function(obj){
	                layer.load();
	                console.log('before');
	            }
	            ,done: function(res){//上传完毕回调
	                layer.closeAll('loading');
	            }
	            ,error: function(){//请求异常回调
	                layer.closeAll('loading');
	                layer.msg('网络异常，请稍后重试！');
	            }
	        });
	    }); */
	    
	</script>

</body>
</html>