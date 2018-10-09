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
<title>销售机会及计划详情</title>
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
	 
	 	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 25px;">
  			<legend class="ft-green">销售机会详情</legend>
		</fieldset>
			
			<div class="layui-form-item">
				<label class="layui-form-label">机会编号:</label>
				<div class="layui-input-inline">
					<input id="my-saleId" type="text" name="saleId" class="layui-input layui-bg-gray" readonly="on">
				</div>
				<label class="layui-form-label">机会来源:</label>
				<div class="layui-input-inline">
					<select id="my-source" name="source" lay-filter="aihao">
						<option value='网络沟通' >网络沟通</option>
						<option value='电话沟通' >电话沟通</option>
						<option value='客户介绍' >客户介绍</option>
						<option value='当面商谈' >当面商谈</option>
					</select>
				</div>
				
				<label class="layui-form-label">成功机率:</label>
				<div class="layui-input-inline">
					<select id="my-probability" name="probability">
						<option value="0.1" >10 %</option>
						<option value="0.2" >20 %</option>
						<option value="0.3" >30 %</option>
						<option value="0.4" >40 %</option>
						<option value="0.5" >50 %</option>
						<option value="0.6" >60 %</option>
						<option value="0.7" >70 %</option>
						<option value="0.8" >80 %</option>
						<option value="0.9" >90 %</option>
						<option value="1.0" >100 %</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">客户名:</label>
				<div class="layui-input-inline">
					<input id="my-customerName" type="text" class="layui-input layui-bg-gray" name="customerName"
					 lay-verify="required" placeholder="请输入客户名称" readonly="on"/>
				</div>
				
				<label class="layui-form-label">客户联系人:</label>
				<div class="layui-input-inline">
					<input id="my-contacts" type="text" class="layui-input layui-bg-gray" name="contacts" lay-verify="required" 
						placeholder="请输入客户联系人" readonly="on"/>
				</div>
				
				<label class="layui-form-label">客户电话:</label>
				<div class="layui-input-inline">
					<input id="my-tel" type="text" class="layui-input layui-bg-gray" name="tel" lay-verify="required" 
						placeholder="客户联系电话" readonly="on"/>
				</div>				
				
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">机会概要:</label>
				<div class="layui-input-block">
						<input id="my-summary" type="text" class="layui-input layui-bg-gray" lay-verify="required" name="summary" 
							placeholder="请输入机会概要信息" readonly="on"/>
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">机会详情:</label>
				<div class="layui-input-block">
					<textarea id="my-description" lay-verify="required" name="description" placeholder="请输入机会详细信息" 
						class="layui-textarea layui-bg-gray" readonly="on"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" >创建人</label>
				<div class="layui-input-inline">
					<input type="hidden" value=""/>
					<input id="my-createMan" type="text"  value="" class="layui-input layui-bg-gray"
						 readonly="on">
				</div>
				<div id="button">
					<label class="layui-form-label">创建日期</label>
					<div class="layui-input-inline">
						<input id="my-date" type="text"  value="未指派" class="layui-input layui-bg-gray"
						 readonly="on">
					</div>
				</div>
				<label class="layui-form-label">机会状态:</label>
				<div class="layui-input-inline">
					<input id="my-state" type="text"  value="开发中" class="layui-input layui-bg-gray" readonly="on">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label" >指派状态</label>
				<div class="layui-input-inline">
					<input id="my-status" type="text"  value="" class="layui-input layui-bg-gray"
						 readonly="on">
				</div>
				
				<label class="layui-form-label" >负责人</label>
				<div class="layui-input-inline">
					<input id="my-dealMan" type="text"  value="未指派负责人" class="layui-input layui-bg-gray" readonly="on">
				</div>
				
				<div id="button">
					<label class="layui-form-label">指派日期</label>
					<div class="layui-input-inline">
						<input id="my-assignDate" type="text"  value="未指派" class="layui-input layui-bg-gray"
						 readonly="on">
					</div>
				</div>					
			</div>
	</form>	
	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 25px;">
  		<legend class="ft-green">客户开发计划</legend>
	</fieldset>
	
	<table class="layui-table" id="my-table" cyType="pageGrid"
           checkbox:'true' pageColor:'#299100'>
        <thead>
	        <tr>
	            <th width="5%">计划日期</th>
	
	            <th width="10%">计划内容</th>
	
	            <th width="12%">执行效果</th>       
	        </tr>
        </thead>
        
    </table>
	
			
		<div class="page-footer">
            <div class="btn-list ">
		            <div class="layui-form-item">
						<button style="right:20px;position: absolute;" onclick="$t.closeWindow()" class='layui-btn' value=''>返回</button>				
					</div>
            </div>
        </div>
	

</div>
	
	
	
<script>

	$(function() {
		//获取超链接的id
		var saleId = getUrlParam("id");
		//alert(saleId);
		$("#my-saleId").val(saleId);
		$.post("sale/getSale.action",{
			"saleId":saleId
		},function(data,status){
			//alert(data);
			data = eval('('+data+')');			
			$("#my-customerName").attr("value",data.customerName);
			$("#my-summary").attr("value",data.summary);
			$("#my-contacts").attr("value",data.contacts);
			$("#my-tel").attr("value",data.tel);
			$("#my-description").val(data.description);
			$("#my-createMan").val(data.createMan);
			$("#my-date").attr("value",dateformatter(data.createDate));
			$("#my-status").val(data.status=='1'?"已指派":"未指派");
			$("#my-dealMan").val(data.dealMan);
			$("#my-assignDate").val(dateformatter(data.assignDate));
			var state = '';
			if(data.state == 1) state = '开发成功';
			else if(data.state == 0) state = '开发中';
			else state = '开发失败';
			$("#my-state").val(state);
			
			//设置下拉框选中
			$("#my-source").val(data.source);		
			$("#my-probability").val(data.probability);
			
			//加载表格数据
			loadDevelop();
			//重新渲染
			layui.use(['layer', 'form'], function () {
			    var form=layui.form;
			    form.render();//layui没有写这个，操作后没有效果
			});
			

		});
		

		
	});//end
	
	function loadDevelop(){
		//清空表格
		$(".my-tr").remove();
		//加载开发计划数据
		$.post("sale/getDevelop.action",{
			"sale.saleId" : $("#my-saleId").val()
		},function(data,status){
			//alert(data);
			data = eval('('+data+')');			
			$.each(data,function(index,element){
				var result = '';
				if(element.result != null) result = element.result;
				$("table").append(
						"<tr class='my-tr'>"
							+"<td>"+dateformatter(element.startDate)+"</td>"
							+"<td>"+element.content+"</td>"
							+"<td>"+result+"</td>"
						+"</tr>"		
				);
			});
		});
	}
	

	
	//获取超链接参数
	function getUrlParam(name) {
	    var url = window.location.href;
	    if(url!=null && url.indexOf("?")!=-1){
	        var url_param = url.split("?")[1];
	        var url_param_arr = url_param.split("&");
	        for(var i=0;i<url_param_arr.length;i++){
	            var tempParam = url_param_arr[i];
	            var paramName =  tempParam.split("=")[0];
	            if(paramName==name){
	                return tempParam.split("=")[1]
	            }
	        }
	    }
	    return null;
	}
	
	//时间格式化器
	function dateformatter(datestring){
		if(!datestring) return "无";
		var date = new Date(datestring);
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var mm = date.getMinutes();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+(h<10?('0'+h):h)+':'+(mm<10?('0'+mm):mm);
	}
		
			 
	
</script>
	<!-- 先引入 Vue -->
<script src="statics/js/vue.js"></script>
<!-- 引入组件库 -->
<script src="statics/js/dateindex.js"></script>
<script>

	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#my-newdate',//指定元素
	    type: 'datetime'
	  });
	});

    new Vue({
        el: '#button',
        data: {
            value1: '',
            value2: ''
        }
    });

</script>
</body>
</html>