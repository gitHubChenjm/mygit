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
<title>联系人列表</title>
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
		<input type="hidden" id="customerId" value="${contactss.customer.customerId}">
		<div class="layui-form-item">
			<label class="layui-form-label">客户编号:</label>
			<div class="layui-input-inline">
				<input type="text" name="customer.customerId" value="${contactss.customer.customerId}" readonly="readonly"
					class="layui-input">
			</div>
			<label class="layui-form-label">客户名称:</label>
			<div class="layui-input-inline">
				<input type="text" value="${contactss.customer.name}" readonly="readonly" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系人姓名:</label>
			<div class="layui-input-inline">
				<input type="text" name="name" placeholder="请输入客户名字"
					class="layui-input">
			</div>
			<label class="layui-form-label">性别:</label>
			<div class="layui-input-inline">
				<select id="option1" name="gender" lay-filter="aihao">
					<option value="-1">全部</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<label class="layui-form-label">职位:</label>
			<div class="layui-input-inline">
				<select id="option2" name="job" lay-filter="aihao">
					<option value="-1">全部</option>
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
			<label class="layui-form-label">备注:</label>
			<div class="layui-input-inline">
				<input type="text" name="remark" placeholder="请输入备注" class="layui-input">
			</div>
		</div>
		
	</form>
	<div class="layui-form-item">
			<span class="ft-green ft-28">${contactss.customer.name} <span class="ft-warm ft-28">的</span><span class="ft-red ft-28"> 联系人</span></span>
	</div>
	<div class="layui-btn-group">
		<button class="layui-btn"
			onclick="Page.open('新建联系人','customers/addContacts.action?customerId=${contactss.customer.customerId}')">
			<i class="fa fa-plus">&nbsp;</i>增加
		</button>
		<button class="layui-btn layui-btn-green" id="quanxuan">
			<i class="fa fa-check-square-o">&nbsp;</i>全选
		</button>
		<button class="layui-btn  layui-btn-normal" id="buxuan">
			<i class="fa fa-circle-o">&nbsp;</i>不选
		</button>
		<button class="layui-btn  layui-btn-blue" id="fanxuan">
			<i class="fa fa-minus-square">&nbsp;</i>反选
		</button>
		<button class="layui-btn  layui-btn-warm" id="delAll">
			<i class="fa fa-circle-o">&nbsp;</i>删除
		</button>
		<button class="layui-btn layui-btn-danger"
			onclick="window.location.href='pages/customer/listCustomer.jsp'">
			<i class="fa fa-check-square-o">&nbsp;</i>返回上一层
		</button>
	</div>
	<div class="layui-form nowrap">
		<table class="layui-table" id="my-table">
			<thead>
				<tr class="layui-bg-gray">
					<!-- <th width="1%" param="{type:'checkbox'}"><input
						type="checkbox" lay-skin="primary" lay-filter="allChoose">
					</th> -->
					<th width="5%">选择</th>

					<th width="10%"><span class="ft-bold">联系人姓名</span></th>

					<th width="5%"><span class="ft-bold">性别</span></th>

					<th width="10%"><span class="ft-bold">职位</span></th>

					<th width="15%"><span class="ft-bold">办公电话</span></th>

					<th width="10%"><span class="ft-bold">手机号码</span></th>

					<th width="15%"><span class="ft-bold">备注</span></th>

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
			function destory(id) {
				confirm("确定删除联系人？", function() {
					$.ajax({
						url : "customers/delContacts.action",
						dataType : "text",
						type : "POST",
						async : false,
						data : {"contactsId" : id},
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
				console.log(list);
				if(list.length == 0){//一条数据没选择，可不易删，不然可能有空指针错误
					parent.layer.msg('请选择一条以上的数据 !',{icon:5});
					var idb = $('#customerId').val();
					window.location.href="customers/toListContacts.action?customer.customerId=" + idb;
				}else{
					var l = list.length;
					confirm("确定删除所选的"+l+"个联系人？", function() {
						$.ajax({
							url : "customers/delMoreContacts.action",
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
									var idd = $('#customerId').val();
									window.location.href="customers/toListContacts.action?customer.customerId=" + idd;
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
			//查找所有
			$.ajax({
				url : 'customers/listContactsJob.action',
				type : 'post',
				async : false,
				data : {},
				success : function(data) {

					var result = eval('(' + data + ')')
					$.each(result.contacts, function(idx, obj) {

						$('#option2').append(
								"<option value='"+obj.contactsId+"'>" + obj.job
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
				url : 'customers/listContacts.action',
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
								var remark = '';
								if(obj.remark == null || obj.remark == 'null' || obj.remark == ''){
									remark = '暂无';
								}else{
									remark = obj.remark;
								}
								var str = "<tr class='my-tr'>"
								+ "<td><input type='checkbox' lay-skin='primary' value='"
								+ obj.contactsId
								+ "'"
								+ " lay-filter='allChoose'></td>"
								+ "<td>"
								+ obj.name
								+ "</td><td>"
								+ obj.gender
								+ "</td><td>"
								+ obj.job
								+ "</td><td>"
								+ obj.jobTel
								+ "</td><td>"
								+ obj.phone
								+ "</td><td>"
								+ remark
								+ "</td>"
								/* + '<td><button class="layui-btn" onclick="Page.open(' + "'修改联系人'" + "," + "'customers/editContacts.action?contactsId=" */
								+ '<td><button class="layui-btn" onclick="update('
								+ obj.contactsId
								/* + "')" + '">' */
								+ ")" + '">'
								+ "<i class='layui-icon'></i>"
								+ "</button>"
								+ "<button class='layui-btn layui-btn-danger' type='button' onclick='destory("
								+ obj.contactsId
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
		
		function update(id){
			layui.use('layer', function() {
				var layer = layui.layer;
				var index = layer.open({
				    type: 2,
				    title: '更改联系人',
				    content: 'customers/editContacts.action?contactsId=' +id,
				    area: ['500px', '535px'],
				    maxmin: true
				});
				//layer.iframeAuto(index);
			});
			
		}

	</script>
</body>
</html>