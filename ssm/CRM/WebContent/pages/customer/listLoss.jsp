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
<title>客户流失列表</title>
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
			<label class="layui-form-label">客户:</label>
			<div class="layui-input-inline">
				<select id="option3" name="customer.customerId">
					<option value="-1">全部</option>
				</select>
			</div>
			<label class="layui-form-label">客户经理:</label>
			<div class="layui-input-inline">
				<select id="option1" name="user.id">
					<option value="-1">全部</option>
				</select>
			</div>
			<label class="layui-form-label">状态:</label>
			<div class="layui-input-inline">
				<select id="option2" name="state">
					<option value="-1">全部</option>
					<option value="0">暂缓流失</option>
					<option value="1">确认流失</option>
				</select>
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
			<label class="layui-form-label">最早订单时间:</label>
			<div class="layui-input-inline">
				<input type="text" name="startCreateDate" placeholder="请输入最早流失时间"
					class="layui-input Wdate" id="startCreateDate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
			</div>
			<label class="layui-form-label">最迟订单时间:</label>
			<div class="layui-input-inline">
				<input type="text" name="endCreateDate" placeholder="请输入最迟流失时间"
					class="layui-input Wdate" id="endCreateDate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
			</div>
			<label class="layui-form-label">暂缓措施:</label>
			<div class="layui-input-inline">
				<input type="text" name="measure" placeholder="请输入暂缓措施" class="layui-input">
			</div>
		</div>
		
	</form>
	<div class="layui-btn-group">
		<!-- <button class="layui-btn layui-btn-green"
			onclick="Msg.success('操作成功')">
			<i class="fa fa-check-square-o">&nbsp;</i>启用
		</button>
		<button class="layui-btn  layui-btn-danger"
			onclick="Msg.success('操作成功')">
			<i class="fa fa-expeditedssl">&nbsp;</i>禁用
		</button> -->
	</div>
	<div class="layui-form nowrap">
		<table class="layui-table" id="my-table">
			<thead>
				<tr class="layui-bg-gray">
					<!-- <th width="5%" param="{type:'checkbox'}"><input
						type="checkbox" lay-skin="primary" lay-filter="allChoose">
					</th> -->
					
					<th width="5%"><span class="ft-bold">编号</span></th>

					<th width="15%"><span class="ft-bold">客户</span></th>

					<th width="10%"><span class="ft-bold">客户经理</span></th>

					<th width="15%"><span class="ft-bold">上次下单时间</span></th>

					<th width="15%"><span class="ft-bold">确认流失时间</span></th>

					<th width="10%" class="ft-red"><span class="ft-bold">状态</span></th>

					<th width="10%"><span class="ft-bold">操作</span></th>
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
			
			$.ajax({
				url : 'customers/tolistLossUser.action',
				type : 'post',
				async : false,
				data : {},
				success : function(data) {

					var result = eval('(' + data + ')')
					$.each(result.users, function(idx, obj) {
						$('#option1').append(
								"<option value='"+obj.id+"'>" + obj.account
										+ "</option>")
					});
					
					$.each(result.customers, function(idx, obj) {
						$('#option3').append(
								"<option value='"+obj.customerId+"'>" + obj.name
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
				url : 'customers/listLoss.action',
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
					
					var ac = new Array();
					var cu = new Array();
					
					//将list集合下面的customer对象里面的name、user对象里面的account内容拿出来
					$.each(
							result.list,
							function(idx, obj) {
								//console.log(obj.customer);
								$.each(obj.customer,function(idy,objc){
									//console.log(idy);
									if(idy == "name"){
										var b = objc;
										//console.log(b);
										cu[idx] = b;
									}
								});
							});
					$.each(
							result.list,
							function(idx, obj) {
								//console.log(obj.user);
								$.each(obj.user,function(idy,objc){
									//console.log(idy);
									if(idy == "account"){
										var a = objc;
										//console.log(a);
										ac[idx] = a;
									}
								});
							});
					
					//设置表格
					$.each(
							result.list,
							function(idx, obj) {
								var button1 ='<button class="layui-btn layui-btn-warm';
								var button2 ='<button class="layui-btn layui-btn-green';
								var edit1='';
								var edit2='';
								if(obj.state != '1'){
									edit1='"';
									edit2+=' layui-btn-disabled" disabled="disabled"';
								}else{
									edit1+=' layui-btn-disabled" disabled="disabled"';
									edit2='"';
								}
								button1 += edit1 + ' type="button" title="确认流失" onclick="tocomfirm(';
								button2 += edit2 + ' type="button" title="暂缓流失" onclick="totemp(';
								var state = '';
								var sta = '';
								if(obj.state == 1){
									sta = '</td><td class="ft-red">';
									state = '确认流失';
								}else{
									sta = '</td><td class="ft-warm">';
									state = '暂缓流失';
								}
								var cf;
								if(obj.confirmdate == null){
									cf = '暂无';
								}else{
									cf = getDate(obj.confirmdate);
								}
								var str = "<tr class='my-tr'>"
								/* + "<td width='5%'><input type='checkbox' lay-skin='primary' lay-filter='itemChoose'></td>" */
								+ "<td>"
								+ obj.lossId
								+ "</td><td>"
								+ cu[idx]
								+ "</td><td>"
								+ ac[idx]
								+ "</td><td>"
								+ getDate(obj.orderdate)
								+ "</td><td>"
								+ cf
								+ sta
								+ state
								+ "</td>"
								+ '<td>' + button1
								+ obj.lossId
								+ ')">'
								+ "<i class='layui-icon layui-icon-vercode'></i>"
								+ "</button>"
								+ button2
								+ obj.lossId
								+ ')">'
								+ "<i class='layui-icon layui-icon-log'></i>"
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
					if (result.pager.pages == result.pager.currentPage) {
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
			var pre = $('#pre').val();
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
		
		function tocomfirm(id){
			if(id != null){
				Page.open("确认流失","customers/editLossComfirm.action?lossId=" + id);
			}
		}
		
		function totemp(id){
			if(id != null){
				Page.open("暂缓流失","customers/editLossTemp.action?lossId=" + id);
			}
		}
		
		$(function () {
		    $("[type='reset1']").click(function () {
		        $(this).parents(".layui-form").find("input").val("");
		        $(this).prev().click();
		    });

		});

	</script>
</body>
</html>