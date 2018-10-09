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
<title>历史订单列表</title>
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
<form id="form" class="layui-form">
		<input id="pageNo" name="pageNo" type="hidden" />
		<input id="pageSize" name="pageSize" type="hidden" />
		<input id="prePage" name="prePage" type="hidden" />
		<input id="nextPage" name="nextPage" type="hidden" />
		<div class="layui-form-item">
			<label class="layui-form-label">客户编号:</label>
			<div class="layui-input-inline">
				<input type="text" name="customer.customerId" value="${orders.customer.customerId}" readonly="readonly"
					class="layui-input">
			</div>
			<label class="layui-form-label">客户名称:</label>
			<div class="layui-input-inline">
				<input type="text" value="${orders.customer.name}" readonly="readonly" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">订单编号:</label>
			<div class="layui-input-inline">
				<input type="text" name="orderId" placeholder="请输入订单编号" id="orderid"
					class="layui-input">
			</div>
			<label class="layui-form-label">开始日期:</label>
			<div class="layui-input-inline">
				<input type="text" name="startCreateDate" placeholder="请输入订单开始日期"
					class="layui-input Wdate" id="startCreateDate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
			</div>
			<label class="layui-form-label">截止日期:</label>
			<div class="layui-input-inline">
				<input type="text" name="endCreateDate" placeholder="请输入订单截止日期"
					class="layui-input Wdate" id="endCreateDate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
			</div>
			<div class="layui-input-normal">
				<button class="layui-btn layui-btn-green" lay-submit=""
					lay-filter="moreSearch">
					<i class="fa fa-chevron-down">&nbsp;</i>更多
				</button>
				<button id="search" class="layui-btn search-btn" type="button" onclick="findList()">
					<i class="fa fa-search">&nbsp;</i>查询
				</button>
				<button type="reset1" class="layui-btn layui-btn-primary">
					<i class="fa fa-refresh">&nbsp;</i>重置
				</button>
			</div>
		</div>

		<div class="layui-form-item more-search">
			<label class="layui-form-label">地址:</label>
			<div class="layui-input-inline">
				<select id="option2" name="address" lay-filter="aihao">
					<option value="-1">全部</option>
				</select>
			</div>
			<label class="layui-form-label">状态:</label>
			<div class="layui-input-inline">
				<select id="option3" name="state" lay-filter="aihao">
					<option value="-1">全部</option>
					<option value="回款">回款</option>
					<option value="未回款">未回款</option>
				</select>
			</div>
		</div>
		
	</form>
	<div class="layui-form-item">
			<span class="ft-green ft-28">${orders.customer.name} <span class="ft-warm ft-28">的</span><span class="ft-red ft-28"> 历史订单</span></span>
	</div>
	<div class="layui-btn-group">
		<!-- 这个系统里面不需要添加订单功能 -->
		<%-- <button class="layui-btn"
			onclick="Page.open('新建订单','customers/addOrders.action?customerId=${orders.customer.customerId}')">
			<i class="fa fa-plus">&nbsp;</i>增加
		</button> --%>
		<button class="layui-btn layui-btn-danger"
			onclick="window.location.href='pages/customer/listCustomer.jsp'">
			<i class="fa fa-check-square-o">&nbsp;</i>返回上一层
		</button>
	</div>
	<div class="layui-form nowrap">
		<table class="layui-table" id="my-table">
			<thead>
				<tr class="layui-bg-gray">
					<!-- <th width="5%" param="{type:'checkbox'}"><input
						type="checkbox" lay-skin="primary" lay-filter="allChoose">
					</th> -->
					<!-- <th width="5%">选择</th> -->

					<th width="5%"><span class="ft-bold">订单编号</span></th>

					<th width="10%"><span class="ft-bold">订单日期</span></th>

					<th width="15%"><span class="ft-bold">地址</span></th>

					<th width="10%" class="ft-red"><span class="ft-bold">状态</span></th>

					<th width="5%"><span class="ft-bold">操作</span></th>
				</tr>
			</thead>
			<!-- 下面加的tbody是分页的代码，还会在js里面往tbody里面追加内容的 -->
			<tbody>
			</tbody>
		</table>
		
		<div id="studentTable_page" align="center">

			<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">
				<span class="layui-laypage-count">
					共<span id="total"></span>条
				</span>
				<span class="layui-laypage-count">
					当前第<span id="currentPage"></span>页
				</span>
				<a href="javascript:;" id="pre" class="layui-laypage-prev" onclick="topreList()">上一页</a>
				<a href="javascript:;" id="next" class="layui-laypage-next" onclick="tonextList()">下一页</a>
				<span class="layui-laypage-limits">
	    			<select lay-ignore="" id="option">
	    				<option value="5" selected="">5 条/页</option>
	    				<option value="10">10 条/页</option>
	    				<option value="20">20 条/页</option>
	    				<option value="30">30 条/页</option>
	    				<option value="40">40 条/页</option>
	    				<option value="50">50 条/页</option>
	    			</select>
	    		</span>
	    		<span class="layui-laypage-skip">
	    			到第<input type="text" min="1" value="1" class="layui-input">页
					<button type="button" class="layui-laypage-btn">确定</button>
				</span>
			</div>
		</div>
	</div>

	<!-- 此子模块不需要订单删除功能 -->
	<!-- <script type="text/javascript">
			function destory(id) {
				confirm("确定删除此订单？", function() {
					$.ajax({
						url : "customers/delOrders.action",
						dataType : "text",
						type : "POST",
						async : false,
						data : {"orderId" : id},
						success : function(data) {
							var r = eval('(' + data + ')');
							if (r.msg == 1) {
								parent.layer.msg('删除成功 !', {icon : 1});
								findList();
							} else {
			                    parent.layer.msg("删除失败！", {icon: 5});
			                }
						}
					});
				});
			}
	</script> -->

	<script type="text/javascript">
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  laydate.render({
				    elem: '#startCreateDate', //指定元素
				  });
			  
			  var laydate1 = layui.laydate;
			  laydate1.render({
			    elem: '#endCreateDate', //指定元素
			  });
			});
		$(function() {
			//查找所有
			$.ajax({
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
			});

			//首次初始化列表
			findList();
		})
		
		//页面显示
		function findList() {
			
			$.ajax({
				url : 'customers/listOrders.action',
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
					//设置表格
					$.each(
							result.list,
							function(idx, obj) {
								var sta = '';
								if(obj.state == '未回款'){
									sta = '</td><td class="ft-red">';
								}else{
									sta = '</td><td class="ft-green">';
								}
								var str = "<tr class='my-tr'>"
								/* + "<td width='5%'><input type='checkbox' lay-skin='primary' lay-filter='itemChoose'></td>" */
								+ "<td>"
								+ obj.orderId
								+ "</td><td>"
								+ getDate(obj.date)
								+ "</td><td>"
								+ obj.address
								+ sta
								+ obj.state
								+ "</td>"
								+ "<td>"
								+ "<button class='layui-btn' type='button' title='订单详细' onclick='toOrderitem("
								+ obj.orderId
								+ ")'>"
								+ "<i class='layui-icon layui-icon-form' style='color: #00FA9A;'></i>"
								+ "</button>"
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

		function toOrderitem(id) {
			if(id != null){
				//parent.layer.msg(id, {icon : 1});
				window.location.href = "customers/tolistOrderitem.action?order.orderId=" + id;
			}
		}
		
		$(function () {
		    $("[type='reset1']").click(function () {
		        $(this).parents(".layui-form").find("input .layui-input Wdate").val("");
		        $(this).parents(".layui-form").find("input #orderid").val("");
		        $(this).parents(".layui-form").find("input #option2").val("-1");
		        $(this).parents(".layui-form").find("input #option3").val("-1");
		        $(this).prev().click();
		    });

		});

	</script>
</body>
</html>