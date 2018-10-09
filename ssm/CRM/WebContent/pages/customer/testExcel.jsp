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
<title>测试Excel</title>
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
				<label class="layui-form-label"><span class="ft-bold ft-16 ft-green">记录文件</span></label>
				<div class="layui-block" style="margin-top: 30px;">
					<button type="button" class="layui-btn" onclick="upLoad()" id="notice">
						<i class="layui-icon">&#xe67c;</i>选择文件
					</button>
					<input class="layui-upload-file" type="file" name="file1">
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<!-- <button class="layui-btn" lay-submit="" lay-filter="submit1"
							data-url="excel/batchimport.action">
							<i class="fa fa-floppy-o">&nbsp;</i>保存
						</button> -->
						<button class="layui-btn" lay-submit="" lay-filter="submit1"
							data-url="excel/batchimport1.action">
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
		
		function upLoad(){
			
			layui.use('layer', function(){ //独立版的layer无需执行这一句
				  var layer = layui.layer; //独立版的layer无需执行这一句
				  
				  //触发事件
				 //示范一个公告层
				      layer.open({
				        type: 1
				        ,title: false //不显示标题栏
				        ,closeBtn: true
				        ,area: '300px;'
				        ,shade: 0.3
				        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
				        ,btn: ['下载模板', '选择文件']
				        ,btnAlign: 'c'
				        ,moveType: 1 //拖拽模式，0或者1
				        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br><br>要进行批量添加客户，先要从Excel文件中导出数据<br><br>如果您没有符合的文件，可以先<span class="ft-green ft-18">下载模板</span>按要求填好数据哦！<br><br>您也可以直接选择文件</div>'
				        ,success: function(layero){
								  var btn = layero.find('.layui-layer-btn');
								  btn.find('.layui-layer-btn0').attr({
									  href: 'customers/download.action?fileName=pages/customer/model/客户-模板.xlsx'
								});
								  btn.find('.layui-layer-btn1').attr({
									  onclick: 'sele()'
									  });
								  }
				      });
				  
				});
			}
		
		function sele(){
			$('.layui-upload-file').click();
		}
		
		
	</script>

</body>
</html>