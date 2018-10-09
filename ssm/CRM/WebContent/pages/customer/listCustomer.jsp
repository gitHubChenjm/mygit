<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理</title>
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
		<!-- <input id="total" name="total" type="hidden" /> -->
		<input id="prePage" name="prePage" type="hidden" />
		<input id="nextPage" name="nextPage" type="hidden" />
		<div class="layui-form-item">
			<label class="layui-form-label">客户:</label>
			<div class="layui-input-inline">
				<input type="text" name="name" placeholder="请输入客户名字"
					class="layui-input">
			</div>
			<label class="layui-form-label">客户经理:</label>
			<div class="layui-input-inline">
				<select id="option1" name="user.id" lay-filter="aihao">
					<option value="-1">全部</option>
					<%-- <c:forEach items="${users}" var="user">
						<option value="${user.id}">${user.account}</option>
					</c:forEach> --%>
				</select>
			</div>
			<label class="layui-form-label">客户等级:</label>
			<div class="layui-input-inline">
				<select id="option2" name="custcategoryId.id" lay-filter="aihao">
					<option value="-1">全部</option>
					<%-- <c:forEach items="${custcategorys}" var="custcategory">
						<option value="${custcategory.id}">${custcategory.value}</option>
					</c:forEach> --%>
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
				<button type="reset" class="layui-btn layui-btn-primary">
					<i class="fa fa-refresh">&nbsp;</i>重置
				</button>
			</div>
		</div>

		<div class="layui-form-item more-search">
			<label class="layui-form-label">信用度:</label>
			<div class="layui-input-inline">
				<!-- <div id="creditId"></div>
				信用度默认是1
				<input type="hidden" name="creditId.id" id="credit" value="-1"/> -->
				<select id="option3" name="creditId.id" lay-filter="aihao">
					<option value="-1">全部</option>
					<%-- <c:forEach items="${credits}" var="credit">
						<option value="${credit.id }"><c:if
								test="${credit.value == 5 }">☆☆☆☆☆</c:if><c:if
								test="${credit.value == 4 }">☆☆☆☆</c:if><c:if
								test="${credit.value == 3 }">☆☆☆</c:if><c:if
								test="${credit.value == 2 }">☆☆</c:if><c:if
								test="${credit.value == 1 }">☆</c:if></option>
					</c:forEach> --%>
				</select>
			</div>

			<label class="layui-form-label">满意度:</label>
			<div class="layui-input-inline">
				<!-- <div id="satisfiedId"></div>
				满意度默认是1
				<input type="hidden" name="satisfiedId.id" id="satisfied" value="-1"/> -->
				<select id="option4" name="satisfiedId.id" lay-filter="aihao">
					<option value="-1">全部</option>
					<%-- <c:forEach items="${satisfieds}" var="satisfied">
						<option value="${satisfied.id }"><c:if
								test="${satisfied.value == 5 }">☆☆☆☆☆</c:if><c:if
								test="${satisfied.value == 4 }">☆☆☆☆</c:if><c:if
								test="${satisfied.value == 3 }">☆☆☆</c:if><c:if
								test="${satisfied.value == 2 }">☆☆</c:if><c:if
								test="${satisfied.value == 1 }">☆</c:if></option>
					</c:forEach> --%>
				</select>
			</div>
			<label class="layui-form-label">客户来源:</label>
			<div class="layui-input-inline">
				<select id="option5" name="custfromId.id" lay-filter="aihao">
					<option value="-1">全部</option>
					<%-- <c:forEach items="${custfroms}" var="custfrom">
						<option value="${custfrom.id}">${custfrom.value}</option>
					</c:forEach> --%>
				</select>
			</div>
		</div>
	</form>
	<div class="layui-row">
		<div class="layui-col-md6">
			<div class="layui-btn-group">
				<button class="layui-btn layui-btn-danger"
					onclick="Page.open('新建客户','customers/add.action')">
					<i class="fa fa-plus">&nbsp;</i>增加
				</button>
				<button class="layui-btn layui-btn-normal" onclick="upLoad()" >
					<i class="fa fa-plus">&nbsp;</i>批量增加
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
		</div>
		
		<div class="layui-col-md2">
			<form id="commuform" enctype="multipart/form-data" action="" method="post">
				<input class="layui-upload-file" type="file" value="" name="file1" id="file1" onchange="onc()">
				<button style="display: none;" lay-submit="" lay-filter="submit1"
					id="upd" data-url="customers/batchimport.action">
					<i class="fa fa-floppy-o">&nbsp;</i>保存
				</button>
			</form>
		</div>
		
		<div class="layui-col-md4">
			<div class="layui-btn-group">
				<button class="layui-btn layui-btn-normal" onclick="tocontact()">
					<i class="fa fa-check-square-o">&nbsp;</i>联系人
				</button>
				<button class="layui-btn layui-btn-green" onclick="tocommunicate()">
					<i class="fa fa-check-square-o">&nbsp;</i>交往记录
				</button>
				<button class="layui-btn layui-btn-warm" onclick="toOrder()">
					<i class="fa fa-check-square-o">&nbsp;</i>历史订单
				</button>
			</div>
		</div>
		
	</div>
	
	
	<div class="layui-form nowrap">
		<table class="layui-table" id="my-table">
			<thead>
				<tr class="layui-bg-gray">
					<!--复选框-->
					<!-- <th width="5%" param="{type:'checkbox'}"><input
						type="checkbox" lay-skin="primary" lay-filter="allChoose"/>
					</th> -->
					<th width="5%">选择</th>
					<!--isPrimary：是否是主键-->
					<!-- <th width="5%" param="{name:'customerId',isPrimary:'true',hide:'true'}">id</th> -->

					<th width="15%"><span class="ft-bold">客户名称</span></th>

					<th width="5%"><span class="ft-bold">首要联系人</span></th>

					<th width="10%"><span class="ft-bold">联系电话</span></th>

					<th width="15%"><span class="ft-bold">客户地址</span></th>

					<th width="5%"><span class="ft-bold">客户经理</span></th>

					<th width="5%" class="ft-red"><span class="ft-bold">客户等级</span></th>

					<th width="10%"><span class="ft-bold">客户来源</span></th>

					<th width="10%"><span class="ft-bold">操作</span></th>
				</tr>
				<!-- 下面注释的是没有分页查询时的页面代码 -->
				<%-- <c:forEach items="${list}" var="customer">
					<tr>
						<td width="1%" param="{type:'checkbox'}"><input
							type="checkbox" lay-skin="primary" lay-filter="allChoose">
						</td>
						<td width="15%" param="{name:'name'}">${customer.name}</td>
						<td width="5%" param="{name:'contacts'}">${customer.contacts}</td>
						<td width="10%" param="{name:'tel'}">${customer.tel}</td>
						<td width="15%" param="{name:'address'}">${customer.address}</td>
						<td width="5%" param="{name:'user.account'}">${customer.user.account}</td>
						<td width="5%" param="{name:'custcategoryId.value'}">${customer.custcategoryId.value}</td>
						<td width="10%" param="{name:'custfromId.value'}">${customer.custfromId.value}</td>
						<td width="10%"
							param="{operate:'true',buttons:'Render.state,Render.edit,Render.delete'}">
							<button class="layui-btn"
								onclick="Page.open('修改客户','customers/edit.action?customer.customerId=${customer.customerId}')">
								<i class="layui-icon"></i>
							</button>
							<button class="layui-btn" type="button"
								onclick="destory(${customer.customerId})">
								<i class="layui-icon"></i>
							</button>
					</tr>
				</c:forEach> --%>
			</thead>
			<!-- 下面加的tbody是分页的代码，还会在js里面往tbody里面追加内容的 -->
			<tbody>
			</tbody>
		</table>
		<!-- layerui内嵌分页模块 -->
		<!-- <div id="demo7"></div> -->
		<div id="studentTable_page" align="center">
			<!-- <div id="demo7"></div> -->
			<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">
				<span class="layui-laypage-count">共<span id="total"></span>条</span>
				<span class="layui-laypage-count">当前第<span id="currentPage"></span>页</span>
				<a href="javascript:;" id="pre" class="layui-laypage-prev" onclick="topreList()">上一页</a>
				<a href="javascript:;" id="next" class="layui-laypage-next" onclick="tonextList()">下一页</a>
				<span class="layui-laypage-limits">
	    			<select lay-ignore="" id="option">
	    				<option value="10" selected="">10 条/页</option>
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
		function update(id){
			layui.use('layer', function() {
				var layer = layui.layer;
				var index = layer.open({
				    type: 2,
				    title: '修改客户',
				    content: 'customers/edit.action?customerId=' +id,
				    area: ['1050px', '600px'],
				    maxmin: true
				});
				//layer.iframeAuto(index);
			});
			
		}
		
		function getSelectedRow(table_id) {
		    var checked=$("#"+table_id+" tbody .layui-form-checked");
		    if(checked.length==0){
		        parent.layer.msg("请选择一条记录", {icon: 5});
		        //alert("请选择一条记录");
		        return ;
		    }
		    var selectedIDs = [];
		    for(var i=0;i<checked.length;i++){
		        var _this=$(checked[i]).prev();
		        selectedIDs.push($(_this).attr("value"));
	
		    }
		    if(selectedIDs.length > 1){
		        parent.layer.msg("只能选择一条记录", {icon: 5});
		        //alert("只能选择一条记录");
		        return ;
		    }
		    return selectedIDs[0];
		}
		
		function toOrder() {
			if(getSelectedRow("my-table") != null){
				var id2 = getSelectedRow("my-table");
				//parent.layer.msg(id1, {icon : 1});
				window.location.href = "customers/tolistOrders.action?customer.customerId=" + id2;
			}else{
				window.location.href = "pages/customer/listCustomer.jsp";
			}
		}
		
		function tocommunicate() {
			if(getSelectedRow("my-table") != null){
				var id1 = getSelectedRow("my-table");
				//parent.layer.msg(id1, {icon : 1});
				window.location.href = "customers/tolistCommunicate.action?customer.customerId=" + id1;
			}else{
				window.location.href = "pages/customer/listCustomer.jsp";
			}
		}
		
		function tocontact() {
			if(getSelectedRow("my-table") != null){
				var id = getSelectedRow("my-table");
				//console.log(id);
				//parent.layer.msg(id, {icon : 1});
				window.location.href = "customers/toListContacts.action?customer.customerId=" + id;
			}else{
				window.location.href = "pages/customer/listCustomer.jsp";
			}
		}
		
	</script>

	<script type="text/javascript">
			function destory(id) {
				confirm("确定删除？", function() {
					$.ajax({
						url : "customers/del.action",
						dataType : "text",
						type : "POST",
						async : false,
						data : {
							"customerId" : id
						},
						success : function(data) {
							var r = eval('(' + data + ')');
							if (r.msg == 1) {
								/* $("#search").click(); */
								parent.layer.msg('删除成功 !', {icon : 1});
								window.location.href="customers/list.action";
							} else {
			                    parent.layer.msg("删除失败！", {icon: 5});
			                }
						}
					});
				});
			}
			
			//选择多条记录
			function getSelectedRowss(id) {
			    var checked=$("#"+id+" tbody .layui-form-checked");
			    if(checked.length==0){
			        parent.layer.msg("至少选择一条记录", {icon: 5});
			        return ;
			    }
			    var selectedIDs = [];
			    for(var i=0;i<checked.length;i++){
			        var _this=$(checked[i]).prev();
			        selectedIDs.push($(_this).attr("value"));

			    }
			    return selectedIDs;
			}
			
			//多条删除
			$('#delAll').click(function(){
				var list = [];
				list = getSelectedRowss("my-table");
				//console.log(list);
				if(list.length == 0){//一条数据没选择，可不易删，不然可能有空指针错误
					parent.layer.msg('请选择一条以上的数据 !',{icon:5});
					window.location.href = "pages/customer/listCustomer.jsp";
				}else{
					var l = list.length;
					confirm("确定删除所选的"+l+"个客户？", function() {
						$.ajax({
							url : "customers/delMoreCustomer.action",
							dataType : "text",
							type : "POST",
							async : false,
							data : {"delIds" : list.toString()},
							success : function(data){
								console.log(data);
								var r = eval('(' + data + ')');
								if (r.msg == 1) {
									//$('#search').click();
									parent.layer.msg('删除成功 !', {icon : 1});
									window.location.href="customers/list.action";
								} else {
				                    parent.layer.msg("删除失败！", {icon: 5});
				                }
							}
						});
					});
				}
				
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
	</script>

	<script type="text/javascript">
		$(function() {
			//查找所有客户经理，满意度，信用度，客户来源，客户等级并传回页面填充在条件查询的下拉框里面
			$.ajax({
				url : 'customers/listSelection.action',
				type : 'post',
				async : false,
				data : {},
				success : function(data) {

					var result = eval('(' + data + ')');
					$.each(result.users, function(idx, obj) {

						$('#option1').append(
								"<option value='"+obj.id+"'>" + obj.account
										+ "</option>")
					});
					
					$.each(result.custcategoryIds, function(idx, obj) {

						$('#option2').append(
								"<option value='"+obj.id+"'>" + obj.value
										+ "</option>")
					});
					
					$.each(result.creditIds, function(idx, obj) {
						if(obj.value == 1){
							obj.value = '☆';
						}else if(obj.value == 2){
							obj.value = '☆☆';
						}else if(obj.value == 3){
							obj.value = '☆☆☆';
						}else if(obj.value == 4){
							obj.value = '☆☆☆☆';
						}else if(obj.value == 5){
							obj.value = '☆☆☆☆☆';
						}
						$('#option3').append(
								"<option value='"+obj.id+"'>" + obj.value
										+ "</option>")
					});
					
					$.each(result.satisfiedIds, function(idx, obj) {
						if(obj.value == 1){
							obj.value = '☆';
						}else if(obj.value == 2){
							obj.value = '☆☆';
						}else if(obj.value == 3){
							obj.value = '☆☆☆';
						}else if(obj.value == 4){
							obj.value = '☆☆☆☆';
						}else if(obj.value == 5){
							obj.value = '☆☆☆☆☆';
						}
						$('#option4').append(
								"<option value='"+obj.id+"'>" + obj.value
										+ "</option>")
					});
					
					$.each(result.custfromIds, function(idx, obj) {

						$('#option5').append(
								"<option value='"+obj.id+"'>" + obj.value
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
				url : 'customers/listCustomer.action',
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
					
					//设置三个用来存储多层json数据里面的某个对象的数据集合数组
					var ac = new Array();
					var cates = new Array();
					var cufrs = new Array();
					
					//将list集合下面的user对象里面的account内容拿出来
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
					
					//将list集合下面的custcategoryId对象里面的value内容拿出来
					$.each(
							result.list,
							function(idx, obj) {
								//console.log(obj.custcategoryId);
								$.each(obj.custcategoryId,function(idy,objc){
									//console.log(idy);
									if(idy == "value"){
										var cate = objc;
										//console.log(cate);
										cates[idx] = cate;
									}
								});
							});
					//将list集合下面的custfromId对象里面的value内容拿出来
					$.each(
							result.list,
							function(idx, obj) {
								//console.log(obj.custfromId);
								$.each(obj.custfromId,function(idy,objc){
									//console.log(idy);
									if(idy == "value"){
										var cufr = objc;
										//console.log(cufr);
										cufrs[idx] = cufr;
									}
								});
							});
					
					$.each(
							result.list,
							function(idx, obj) {
								//console.log(idx);
								//alert("xx");
								var address = obj.address;
								if(obj.address == null || obj.address == 'null'){
									address = "暂无";
								}
								var isb = '';
								if(cates[idx] == '大客户'){
									isb = "</td><td class='ft-blue'>";
								}else if(cates[idx] == '重点开发客户'){
									isb = "</td><td class='ft-warm'>";
								}else if(cates[idx] == '普通客户'){
									isb = "</td><td class='ft-gray'>";
								}else if(cates[idx] == '合作伙伴'){
									isb = "</td><td class='ft-green'>";
								}else{
									isb = "</td><td class='ft-red'>";
								}
								
								var str = "<tr class='my-tr'>"
								+ "<td width='5%'><input type='checkbox' lay-skin='primary' value='"
								+ obj.customerId
								+ "'"
								+ " lay-filter='itemChoose'/></td>"
								+ "<td><a href='javascript:;' onclick='toCustOder("+ obj.customerId +")'>"
								+ obj.name
								+ "</a></td><td>"
								+ obj.contacts
								+ "</td><td>"
								+ obj.tel
								+ "</td><td>"
								+ address
								+ "</td><td>"
								+ ac[idx]
								+ isb
								+ cates[idx]
								+ "</td><td>"
								+ cufrs[idx]
								+ "</td>"
								/* + '<td><button class="layui-btn layui-btn-green" onclick="Page.open(' + "'修改客户'" + "," + "'customers/edit.action?customerId=" */
								+ '<td><button class="layui-btn layui-btn-green" onclick="update('
								+ obj.customerId
								/* + "')" + '">' */
								+ ")" + '">'
								+ "<i class='layui-icon'></i>"
								+ "</button>"
								+ "<button class='layui-btn layui-btn-danger' type='button' onclick='destory("
								+ obj.customerId
								+ ")'>"
								+ "<i class='layui-icon'></i>"
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
					//console.log(result.pager.total);
					//console.log(result.pager.currentPage);
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
					//console.log(pages);
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
		
		//去到页面
		function toCustOder(id){
			Page.open('客户订单记录','pages/echarts/custOder.jsp?customerId=' + id);
		}
		
		function upLoad(){
			//$('.layui-upload-file').click();
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
			
			//$t.Refresh();
		}
		
		function sele(){
			$('.layui-upload-file').click();
		}
		
		function onc(){
			$('#upd').click();
		}
		/* layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer;

			//完整功能
			laypage.render({
				elem : 'demo7',
				count : $('#total').val(),
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh',
						'skip' ],
				jump : function(obj, first) {
					//console.log("ee"+obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					//console.log(obj.limit); //得到每页显示的条数

					//首次不执行
					if (!first) {
						$('#pageNo').val(obj.curr);
						$('#pageSize').val(obj.limit);
						findList();
					}
				}
			});

		}); */
		
		/* //信用度评级
		layui.use([ 'rate' ], function() {
			var rate = layui.rate;
			rate.render({
				elem : '#creditId',
				value : -1 //初始值
				,
				text : false //开启文本
				,
				choose : function(value) {
					$('#credit').val(value+5);
				}
			});
			
			//满意度评级
			rate.render({
				elem : '#satisfiedId',
				value : -1 //初始值
				,
				text : false //开启文本
				,
				choose : function(value) {
					$('#satisfied').val(value);
				}
			});
		}); */
		
	</script>
</body>
</html>