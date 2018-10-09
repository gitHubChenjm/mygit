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
<title>订单详细列表</title>
<base href="<%=basePath%>" />
<script src="statics/libs/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="statics/css/font-awesome.min.css">
<!--layui ztree样式-->
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css"
	media="all">
<script src="statics/plugins/layer/layer.js"></script>
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
<script type="text/javascript" src="frontframe/demo/js/list.js"></script>

</head>
<body>
	<form id="orderform" class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">订单编号:</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" value="${orders.orderId}" readonly="readonly">
			</div>
			<label class="layui-form-label">订单日期:</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" value="<fmt:formatDate value='${orders.date}' type='date' pattern='yyyy-MM-dd'/>" readonly="readonly">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">送货地址:</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" value="${orders.address}" readonly="readonly">
			</div>
			<label class="layui-form-label">总金额（元）:</label>
			<div class="layui-input-inline">
				<input type="text" id="sum" class="layui-input" readonly="readonly">
			</div>
		</div>
	</form>
	<form id="form" class="layui-form">
		<input id="pageNo" name="pageNo" type="hidden" />
		<input id="pageSize" name="pageSize" type="hidden" />
		<input id="prePage" name="prePage" type="hidden" />
		<input id="nextPage" name="nextPage" type="hidden" />
		<input name="order.orderId" type="hidden" value="${orders.orderId}" />
	</form>
	<div class="layui-form-item">
			<span class="ft-green ft-28">${customer.name} <span class="ft-warm ft-28">的</span><span class="ft-blue ft-28"> 订单编号为</span><span class="ft-warm ft-30 ft-bold">${orders.orderId}</span><span class="ft-red ft-28"> 详细信息</span></span>
	</div>
	<div class="layui-btn-group">
		<button class="layui-btn layui-btn-green"
			onclick="window.location.href='customers/tolistOrders.action?customer.customerId='+${orders.orderId}">
			<i class="fa fa-check-square-o">&nbsp;</i>返回上一层
		</button>
	</div>
	<div class="layui-form nowrap">
		<table class="layui-table" id="my-table">
			<thead>
				<tr class="layui-bg-gray">
					<th width="10%"><span class="ft-bold">商品</span></th>

					<th width="5%"><span class="ft-bold">数量</span></th>

					<th width="5%"><span class="ft-bold">单位</span></th>

					<th width="10%"><span class="ft-bold">单价（元）</span></th>

					<th width="10%"><span class="ft-bold">金额（元）</span></th>
				</tr>
			</thead>
			<!-- 下面加的tbody是分页的代码，还会在js里面往tbody里面追加内容的 -->
			<tbody>
			</tbody>
		</table>

		<div id="studentTable_page" align="center">

			<div class="layui-box layui-laypage layui-laypage-default"
				id="layui-laypage-1">
				<span class="layui-laypage-count"> 共<span id="total"></span>条
				</span> <span class="layui-laypage-count"> 当前第<span id="currentPage"></span>页
				</span> <a href="javascript:;" id="pre" class="layui-laypage-prev"
					onclick="topreList()">上一页</a> <a href="javascript:;" id="next"
					class="layui-laypage-next" onclick="tonextList()">下一页</a> <span
					class="layui-laypage-limits"> <select lay-ignore=""
					id="option">
						<option value="5" selected="">5 条/页</option>
						<option value="10">10 条/页</option>
						<option value="20">20 条/页</option>
						<option value="30">30 条/页</option>
						<option value="40">40 条/页</option>
						<option value="50">50 条/页</option>
				</select>
				</span> <span class="layui-laypage-skip"> 到第<input type="text"
					min="1" value="1" class="layui-input">页
					<button type="button" class="layui-laypage-btn">确定</button>
				</span>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
		$(function() {
			//查找所有
			/* $.ajax({
				url : 'customers/listOrdersAddress.action',
				type : 'post',
				async : false,
				data : {},
				success : function(data) {

					var result = eval('(' + data + ')')
					$.each(result.orderss, function(idx, obj) {

						$('#option2').append(
								"<option value='"+obj.address+"'>" + obj.address
										+ "</option>")
					});
				}
			}); */

			//首次初始化列表
			findList();
		})
		
		//页面显示
		function findList() {
			
			$.ajax({
				url : 'customers/listOrderItem.action',
				type : 'post',
				async : false,
				data : $("form").serialize(),  //序列化表单里面的输入内容
				success : function(data) {
					var result = eval('(' + data + ')');
					$('tbody').html('');
					//表格里面的select先查找出来，使用嵌套
					
					$(".my-tr").remove();
					if(result.list == ''){
						alert("没有符合条件的数据");
					}
					
					
					var total = 0.0;
					$.each(
							result.list,
							function(idx, obj) {
								total += obj.total;
							});
					//设置总金额
					$('#sum').val(total);
					//alert(total);
					
					var tn = new Array();
					var tu = new Array();
					var tp = new Array();
					
					//将list集合下面的product对象里面的name,unit,price内容拿出来
					$.each(
							result.list,
							function(idx, obj) {
								//console.log(obj.product);
								$.each(obj.product,function(idy,objc){
									//console.log(idy);
									if(idy == "name"){
										var a = objc;
										//console.log(a);
										tn[idx] = a;
									}
									if(idy == "unit"){
										var b = objc;
										//console.log(a);
										tu[idx] = b;
									}
									if(idy == "price"){
										var c = objc;
										//console.log(a);
										tp[idx] = c;
									}
								});
							});
					
					//设置表格
					$.each(
							result.list,
							function(idx, obj) {
								var str = "<tr class='my-tr'>"
								+ "<td>"
								+ tn[idx]
								+ "</td><td>"
								+ obj.count
								+ "</td><td>"
								+ tu[idx]
								+ "</td><td>"
								+ tp[idx]
								+ "</td><td>"
								+ obj.total
								+ "</td>"
								+ "</tr>";
								$('tbody').append(str);
								});
					//设置页面
					$('#total').html(result.pager.total);
					$('#prePage').val(result.pager.currentPage-1);
					$('#nextPage').val(result.pager.currentPage+1);
					$('#currentPage').html(result.pager.currentPage);
					
					if (result.pager.currentPage == 1) {
						$('#pre').addClass('layui-disabled');
					} else {
						$('#pre').removeClass('layui-disabled');
					}
					var t = result.pager.total;
					var c = result.pager.currentPage;
					var pz = result.pager.pageSize;
					var pages;
					if(t%pz==0){
						pages = parseInt(t/pz);
					}else{
						pages = parseInt(t/pz)+1;
					}
					if (pages == result.pager.currentPage) {
						$('#next').addClass('layui-disabled');
					} else {
						$('#next').removeClass('layui-disabled');
					}
				}
			});
			layui.form.render();
		}

		//上一页
		function topreList() {
			var pre = $('#prePage').val();
			var pagesize = $('#option').val();
			$('#pageNo').val(pre);
			$('#pageSize').val(pagesize);
			findList();

		}
		//下一页
		function tonextList() {
			var next = $('#nextPage').val();
			var pagesize = $('#option').val();
			$('#pageNo').val(next);
			$('#pageSize').val(pagesize);
			findList();
		}
		
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
	</script>
</body>
</html>