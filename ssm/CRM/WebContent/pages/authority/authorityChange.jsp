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
			<label class="layui-form-label">用户名字:</label>
			<div class="layui-input-inline">
				<input type="text" id="account" name="account" placeholder="请输入客户名字"
					class="layui-input">
			</div>
			<label class="layui-form-label">用户角色:</label>
			<div class="layui-input-inline">
				<select id="option" name="roleId" lay-filter="aihao">
					<option value="-1">全部</option>
				</select>
			</div>
			
			<div class="layui-input-normal">
				<button id="search" class="layui-btn search-btn" type="button"
					onclick="findList()">
					<i class="fa fa-search">&nbsp;</i>查询
				</button>
				<button type="reset" class="layui-btn layui-btn-primary">
					<i class="fa fa-refresh">&nbsp;</i>重置
				</button>
			</div>
		</div>
	</form>
	<div class="layui-btn-group">
		<button class="layui-btn layui-btn-green" id="quanxuan">
			<i class="fa fa-check-square-o">&nbsp;</i>全选
		</button>
		<button class="layui-btn  layui-btn-normal" id="buxuan">
			<i class="fa fa-circle-o">&nbsp;</i>不选
		</button>
		<button class="layui-btn  layui-btn-warm" id="fanxuan">
			<i class="fa fa-minus-square">&nbsp;</i>反选
		</button>
		<button class="layui-btn  layui-btn-danger" id="changeMore">
			<i class="fa fa-circle-o">&nbsp;</i>修改角色
		</button>
	</div>
	<div class="layui-form nowrap">
		<table class="layui-table" id="studentTable">
			<thead>
				<tr>
					<!--复选框-->
					<th width="1%">选择</th>

					<th width="10%">用户名字</th>

					<th width="10%">用户角色</th>

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
	//加载角色
		$(function() {
			$.ajax({
				url:"authority/findAllRole.action",
				type:'post',
				async : false,
				success:function(data){
					var result = eval('('+ data +')');
					console.log(result);
					$.each(result,function(idx,obj){
						
						$('#option').append(
								"<option value='"+obj.roleId+"'>" + obj.roleName
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
			$
					.ajax({
						url : 'authority/listAuthority.action',
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
												//设置按钮是否可以编辑
												var button = '<button class="layui-btn layui-btn-danger layui-btn-xs';
												var edit = '';
												var choose ="",roleName="暂无角色，待分配";
												if (obj.roleName =='系统管理员') {
													edit += ' layui-btn-disabled" disabled="disabled"';
													choose ="<input disabled='disabled' type='radio' lay-skin='primary' value='"
												} else {
													edit = '"';
													choose = "<input type='checkbox' lay-skin='primary' value='";
													
												}
												if(obj.roleName != '' && obj.roleName != null){
													roleName = obj.roleName;
												}
												button += edit
														+ ' type="button" onclick="del(';
														
												var str = "<tr class='my-tr'>"
														+ "<td width='5%'>" + choose
														+ obj.id
														+ "'"
														+ " lay-filter='itemChoose'/></td><td>"
														+ obj.account
														+ "</td><td class='status'>"
														+ roleName
														+ "</td><td>"
														+ button
														+ "'"
														+ obj.id
														+ "'"
														+ ')">删除</button>'
														+ '</td>'
														+ "</tr>";

												$('tbody').append(str);
											});

							//设置页面
							$('#total').val(result.pager.total);
							$('.status').each(function(){
								var name = $(this).text();
								if(name == '系统管理员'){
									$(this).addClass('ft-red');
								}else if(name == '客户经理'){
									$(this).addClass('ft-blue');
								}else if(name == '销售经理'){
									$(this).addClass('ft-warm');
								}else if(name == '高管'){
									$(this).addClass('ft-green');
								}
							});
							layui.form.render();
						}
					});
			

		}
		//根据id删除
		function del(id) {
			confirm("确定删除？", function() {
				$.ajax({
					url : "authority/delUser.action",
					dataType : "text",
					type : "POST",
					async : false,
					data : {
						"id" : id
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
		
		//多个权限分配
		$('#changeMore').click(function(){
			var list = [];
			$('tbody td div').each(function(){
				if($(this).hasClass("layui-form-checked")){
			    	list.push($(this).prev().val());
			    }
			});
			if(list.length == 0){//一条数据没选择，可不易删，不然可能有空指针错误
				parent.layer.msg('请选择一条以上的数据 !',{icon:5});
			}else{
				console.log(list);
				parent.layer.open({
					type: 2,
					title: '角色修改',
					shadeClose: false,
					shade: [0.5, '#000'],
					maxmin: true, //开启最大化最小化按钮
					area: ['400px', '470px'],
					content: 'pages/authority/doChange.jsp?list='+list.toString()
					
				});
			}
		});
		
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
	</script>
</body>
</html>