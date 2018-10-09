<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务管理</title>
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
	<input type="hidden" id="user" value="${sessionScope.user.id}">
	<form id="form" class="layui-form">
		<!-- 分页的页码和分页数 -->
		<input id="pageNo" name="pageNo" type="hidden" /> <input
			id="pageSize" name="pageSize" type="hidden" /> <input id="total"
			name="total" type="hidden" />
		<!-- end -->
		<!-- 排序 -->
		<input id="sort" name="sort" type="hidden"/>
		<div class="layui-form-item">
			<label class="layui-form-label">客户:</label>
			<div class="layui-input-inline">
				<input type="text" id="account" name="name" placeholder="请输入客户名字"
					class="layui-input">
			</div>
			<label class="layui-form-label">概要:</label>
			<div class="layui-input-inline">
				<input type="text" id="summary" name="summary" placeholder="请输入概要"
					class="layui-input">
			</div>
			<label class="layui-form-label">服务类型:</label>
			<div class="layui-input-inline">
				<select id="option" name="servicecategoryId" lay-filter="aihao">
					<option value="-1">全部</option>
				</select>
			</div>
			<div class="layui-input-normal">
				<button class="layui-btn layui-btn-green" lay-submit=""
					lay-filter="moreSearch">
					<i class="fa fa-chevron-down">&nbsp;</i>更多
				</button>
				<button id="search" class="layui-btn search-btn" type="button"
					onclick="findList()">
					<i class="fa fa-search">&nbsp;</i>查询
				</button>
				<button class="layui-btn layui-btn-primary">
					<i class="fa fa-refresh">&nbsp;</i>重置
				</button>
			</div>
		</div>

		<div class="layui-form-item more-search">
			<label class="layui-form-label">服务方式:</label>
			<div class="layui-input-inline">
				<select id="option1" name="serviceStyleId" lay-filter="aihao">
					<option value="-1">全部</option>
				</select>
			</div>

			<label class="layui-form-label">状态:</label>
			<div class="layui-input-inline">
				<select id="option2" name="statusId" lay-filter="aihao">
					<option value="-1">全部</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item more-search">

			<label class="layui-form-label">开始时间</label>
			<div class="layui-input-inline">
				<input type="text" name="startCreateDate" id="startCreateDate"
					maxlength="20" value="" placeholder="请选择截止时间"
					class="layui-input Wdate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
			</div>
			<label class="layui-form-label">结束时间</label>
			<div class="layui-input-inline">
				<input type="text" name="endCreateDate" id="endCreateDate"
					maxlength="20" value="" placeholder="请选择截止时间"
					class="layui-input Wdate"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
			</div>
		</div>
	</form>
	<div class="layui-btn-group">
		<button class="layui-btn"
			onclick="Page.open('新建服务','pages/service/addService.jsp')">
			<i class="fa fa-plus">&nbsp;</i>增加
		</button>

		<button class="layui-btn layui-btn-green" id="quanxuan">
			<i class="fa fa-check-square-o">&nbsp;</i>全选
		</button>
		<button class="layui-btn  layui-btn-normal" id="buxuan">
			<i class="fa fa-circle-o">&nbsp;</i>不选
		</button>
		<button class="layui-btn  layui-btn-warm" id="fanxuan">
			<i class="fa fa-minus-square">&nbsp;</i>反选
		</button>
		<button class="layui-btn  layui-btn-danger" id="delAll">
			<i class="fa fa-circle-o">&nbsp;</i>删除
		</button>
	</div>
	<div class="layui-form nowrap">
		<table class="layui-table" id="studentTable">
			<thead>
				<tr>
					<!--复选框-->
					<th width="1%">选择</th>

					<th width="10%">客户名称</th>

					<th width="10%">服务概要</th>

					<th width="5%">创建人</th>

					<th width="5%">服务类型</th>

					<th width="10%">服务方式</th>

					<th width="5%">服务状态</th>

					<th width="5%">
						创建时间
						<span class="layui-table-sort layui-inline">
						<i class="layui-edge layui-table-sort-asc"></i>
						<i class="layui-edge layui-table-sort-desc"></i>
						</span>
					</th>

					<th width="10%">分配处理人</th>

					<th width="5%">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div id="studentTable_page" align="center">
			<div id="demo7"></div>
		</div>


	</div>
	<script type="text/javascript">
		$(function() {
			//查找所有服务类型
			$.ajax({
				url : 'service/wordbook.action',
				type : 'post',
				async : false,
				data : {
					'category' : '5'
				},
				success : function(data) {

					var result = eval('(' + data + ')')
					$.each(result, function(idx, obj) {
						$('#option').append(
								"<option value='"+obj.id+"'>" + obj.value
										+ "</option>")

					});

				}
			});

			//查找所有服务方式
			$.ajax({
				url : 'service/wordbook.action',
				type : 'post',
				async : false,
				data : {
					'category' : '7'
				},
				success : function(data) {

					var result = eval('(' + data + ')')
					$.each(result, function(idx, obj) {
						$('#option1').append(
								"<option value='"+obj.id+"'>" + obj.value
										+ "</option>")

					});

				}
			});

			//查找所有服务状态
			$.ajax({
				url : 'service/wordbook.action',
				type : 'post',
				async : false,
				data : {
					'category' : '6'
				},
				success : function(data) {

					var result = eval('(' + data + ')')
					$.each(result, function(idx, obj) {

						$('#option2').append(
								"<option value='"+obj.id+"'>" + obj.value
										+ "</option>")

					});

				}
			});

			//首次初始化列表
			findList();
			
		})

		/**
		 * 页面加载外面，自定义函数
		 */
		//页面显示
		function findList() {
			//存放客户经理，用于被指派
			var user = customerDeal();

			$
					.ajax({
						url : 'service/listServiceVo.action',
						type : 'post',
						async : false,
						data : $("form").serialize(),
						success : function(data) {

							var result = eval('(' + data + ')');
							$('tbody').html('');
							//设置表格
							$
									.each(
											result.list,
											function(idx, obj) {
												var id = "deal" + (idx + 1);

												//设置按钮是否可以编辑
												var button = '<button class="layui-btn layui-btn-xs';
												var edit = '';
												if (obj.statusId != '71') {
													edit += ' layui-btn-disabled" disabled="disabled"';
												} else {
													edit = '"';
												}
												button += edit
														+ ' type="button" onclick="setdeal(';
												var str = "<tr class='my-tr'>"
														+ "<td width='5%'><input type='checkbox' lay-skin='primary' value='"
														+ obj.serviceId
														+ "'"
														+ " lay-filter='itemChoose'/></td><td>"
														+ obj.name
														+ "</td><td class='layui-elip'>"
														+ obj.summary
														+ "</td><td>"
														+ obj.account
														+ "</td><td>"
														+ obj.serviceCategory
														+ "</td><td>"
														+ obj.serviceStyle
														+ "</td><td class='status'>"
														+ obj.status
														+ "</td><td>"
														+ getDate(obj.createDate)
														+ "</td>"
														+ '<td>'
														+ '<select  lay-ignore="" id="'+ id +'" name="dealId">'
														+ user
														+ '</select>'
														+ button
														+ "'"
														+ obj.serviceId
														+ "'"
														+ ','
														+ "'"
														+ id
														+ "'"
														+ ')">指派</button>'
														+ '</td>'
														+ '<td><button class="layui-btn layui-btn-danger layui-btn-xs" type="button" onclick="destory('
														+ "'"
														+ obj.serviceId
														+ "'"
														+ ')">删除</button></td>'
														+ "</tr>";

												$('tbody').append(str);
											});

							//设置页面
							$('#total').val(result.pager.total);
							$('.status').each(function(){
								var name = $(this).text();
								
								if(name == '新创建'){
									$(this).addClass('ft-red');
								}else if(name == '已分配'){
									$(this).addClass('ft-blue');
								}else if(name == '已处理'){
									$(this).addClass('ft-warm');
								}else if(name == '已归档'){
									$(this).addClass('ft-green');
								}
							});
							layui.form.render();
						}
					});
			

		}

		//删除记录一条
		function destory(id) {
			confirm("确定删除？", function() {
				$.ajax({
					url : "service/delService.action",
					dataType : "text",
					type : "POST",
					async : false,
					data : {
						"serviceId" : id
					},
					success : function(data) {
						var r = eval('(' + data + ')');
						if (r.msg == 1) {
							$('#search').click();
							parent.layer.msg('删除成功 !', {
								icon : 1
							});
						}else{
							$('#search').click();
							parent.layer.msg('权限不足 !', {
								icon : 5
							});
						}
					}
				});
			});
		}
		
		//多条删除
		$('#delAll').click(function(){
			var list = [];
			$("tbody td div").each(function(){//获取选择框里面的div
			    if($(this).hasClass("layui-form-checked")){
			    	list.push($(this).prev().val());
			    }
			});
			if(list.length == 0){//一条数据没选择，可不易删，不然可能有空指针错误
				parent.layer.msg('请选择一条以上的数据 !',{icon:5});
			}else{
				confirm("确定删除所选项？", function() {
					$.ajax({
						url : "service/delMoreService.action",
						dataType : "text",
						type : "POST",
						async : false,
						data : {
							"delIds" : list.toString()
						},
						success : function(data){
							var r = eval('(' + data + ')');
							if (r.msg == 1) {
								$('#search').click();
								parent.layer.msg('删除成功 !',{icon:1});
							}
						}
					});
				});
			}
			
		});

		function customerDeal() {
			//存放客户经理，option
			var str = '';
			$.ajax({
				url : 'service/customerDeal.action',
				type : 'post',
				async : false,
				success : function(data) {
					var result = eval('(' + data + ')');
					$.each(result, function(idx, obj) {
						str += "<option value='"+obj.id+"'>" + obj.account
								+ "</option>";
					});
				}
			});
			return str;
		}

		//指派客户经理，处理服务
		function setdeal(serviceId, dealId) {
			var str = "#" + dealId;
			var user = $('#user').val();

			$.ajax({
				url : 'service/editService.action',
				type : 'post',
				data : {
					'serviceId' : serviceId,
					'dealId.id' : $(str).val(),
					'principalId.id' : user,
					'statusId.id' : '73'
				},
				success : function(data) {
					var r = eval('(' + data + ')');
					if (r.code == 0) {
						$('#search').click();
						parent.layer.msg('指派成功 !', {
							icon : 1
						});
					}else{
						$('#search').click();
						parent.layer.msg(r.msg, {
							icon : 5
						});
					}
				}
			});

		}
	</script>

	<script type="text/javascript">
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#endCreateDate', //指定元素
			});

			var laydate1 = layui.laydate;
			laydate1.render({
				elem : '#startCreateDate', //指定元素
			});

		});
		function p(s) {
			return s < 10 ? '0' + s : s;
		}
		/**
		 *	时期字符串转化，日期
		 */
		function getDate(date) {
			var myDate;
			if (date != '') {
				myDate = new Date(date);
			} else {
				myDate = new Date();
			}
			var year = myDate.getFullYear();
			//获取当前月
			var month = myDate.getMonth() + 1;
			//获取当前日
			var date = myDate.getDate();
			var h = myDate.getHours(); //获取当前小时数(0-23)
			var m = myDate.getMinutes(); //获取当前分钟数(0-59)
			var s = myDate.getSeconds();

			var now = year + '-' + p(month) + "-" + p(date);
			return now;
		}
	</script>

	<!-- 分页 -->
	<script>
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer;

			//完整功能
			laypage.render({
				elem : 'demo7',
				count : $('#total').val(),
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh',
						'skip' ],
				jump : function(obj, first) {
					console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					console.log(obj.limit); //得到每页显示的条数

					//首次不执行
					if (!first) {
						$('#pageNo').val(obj.curr);
						$('#pageSize').val(obj.limit);
						findList();
					}
				}
			});

		});
		
		$('#quanxuan').click(function(){
			$('tbody input[type=checkbox]').attr('checked',true);
			$('.layui-form-checkbox').addClass('layui-form-checked');
		});
		$('#buxuan').click(function(){
			$('tbody input[type=checkbox]').attr('checked',false);
			$('.layui-form-checkbox').removeClass('layui-form-checked');
		});
		$('#fanxuan').click(function(){
			$("tbody td div").each(function(){//获取选择框里面的div
				var idex = $("tbody td div").index(this);
			    if($(this).hasClass("layui-form-checked")){
			    	$("tbody td div").eq(idex).removeClass('layui-form-checked');
			    }else{
			    	$("tbody td div").eq(idex).addClass('layui-form-checked');
			    }
			})
		});
		//排序功能
		$('.layui-edge').click(function(){
			if($(this).hasClass('layui-table-sort-asc')){
				$('.layui-table-sort').attr('lay-sort',"asc");
				$('#sort').val('asc');
				
			}else if($(this).hasClass('layui-table-sort-desc')){
				$('.layui-table-sort').attr('lay-sort',"desc");
				$('#sort').val('desc');
			}
			findList();
		});
	</script>
</body>
</html>