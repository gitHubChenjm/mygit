<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<input id="pageNo" name="pageNo" type="hidden" /> 
		<input id="pageSize" name="pageSize" type="hidden" /> 
		
		<input id="total" name="total" type="hidden" />
		<!-- end -->
		<div class="layui-form-item">
			<label class="layui-form-label">操作人:</label>
			<div class="layui-input-inline">
				<input type="text" id="account" name="account" placeholder="请输入客户名字"
					class="layui-input">
			</div>
			<label class="layui-form-label">动作:</label>
			<div class="layui-input-inline">
				<input type="text" id="action" name="action" placeholder="请输入动作"
					class="layui-input">
			</div>
			<label class="layui-form-label">操作说明:</label>
			<div class="layui-input-inline">
				<input type="text" id="explain" name="explains" placeholder="请输入操作说明"
					class="layui-input">
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
	<div class="layui-form nowrap">
		<table class="layui-table" id="studentTable">
			<thead>
				<tr>
				
					
					<th width="10%">操作人名称</th>

					<th width="10%">操作时间</th>

					<th width="5%">动作行为</th>

					<th width="5%">操作说明</th>

					<th width="10%">操作人电话</th>
		
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
						url : 'log/listLog.action',
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
												
												var str = "<tr>"
														+ "<td>"
														+ obj.account
														+ "</td><td>"
														+ getDate(obj.date)
														+ "</td><td>"
														+ obj.action
														+ "</td><td>"
														+ obj.explains
														+ "</td><td>"
														+ obj.tel
														+ "</td></tr>";

												$('tbody').append(str);
											});

							//设置页面
							$('#total').val(result.pager.total);
						}
					});
			
		}

	

	</script>
	
	<script type="text/javascript">
		
		 function p(s) {
		        return s < 10 ? '0' + s: s;
		    }
		/**
		*	时期字符串转化，日期
		*/
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

			    var now=year+'-'+p(month)+"-"+p(date) + " "+h +":"+ m +":" +s;
				return now;
		}
			
	</script>
	<!-- 分页 -->
	<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  
  //完整功能
  laypage.render({
    elem: 'demo7'
    ,count: $('#total').val()
    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
    ,jump: function(obj,first){
    	 	console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    	    console.log(obj.limit); //得到每页显示的条数
    	    
    	    //首次不执行
    	    if(!first){
    	    	$('#pageNo').val(obj.curr);
    	    	$('#pageSize').val(obj.limit);
    	    	findList();
    	    }
    }
  });

  
});
</script>
</body>
</html>