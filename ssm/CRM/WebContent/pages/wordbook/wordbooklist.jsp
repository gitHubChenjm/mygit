<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String basePath = request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售机会管理</title>
<base href="<%=basePath%>"/>

	<script src="statics/libs/jquery-1.7.2.js"></script>
    <link rel="stylesheet" href="statics/css/font-awesome.min.css">
    <!--layui ztree样式-->
    <link rel="stylesheet" href="statics/plugins/layui/css/layui.css" media="all">
    <script src="statics/plugins/layer/layer.js"></script>
    <script src="statics/plugins/layui/layui.js"></script>
    <script src="statics/plugins/ztree/jquery.ztree.all.min.js"></script>
    <link rel="stylesheet" href="statics/plugins/ztree/css/metroStyle/metroStyle.css">
    <!--js组件-->
    <!-- <script src="common/js/pageGrid.js"></script> -->
    <!-- <script src="common/js/selectTool.js"></script> -->
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

  <form class="layui-form" action="">
  	<input id="my-userId" type="hidden" value="${sessionScope.user.id}" />
    <div class="layui-form-item">
        <label class="layui-form-label">数据分类:</label>
        <div class="layui-input-inline">
            <select id="my-input02" lay-filter="aihao">
				<option value='' >请选择分类</option>
			</select>
        </div>
        <label class="layui-form-label">数据值:</label>
        <div class="layui-input-inline">
            <input type="text" id="my-input03" placeholder="请输入数据值" class="layui-input">
        </div>
        
        <label class="layui-form-label">编辑:</label>
        <div class="layui-input-inline">
        	<select id="my-input04" lay-filter="aihao">
				<option value='' >是否可编辑</option>
				<option value='1' >可编辑</option>
				<option value='0' >不可编辑</option>
			</select>
        </div>

        <div class="layui-input-normal">
            <button id="my-search"  type="button" class="layui-btn" onclick="search()" >
            <i class="fa fa-search">&nbsp;</i>查询</button>
            <button id="my-research"  type="button" class="layui-btn" onclick="research()" >
            <i class="fa fa-search">&nbsp;</i>刷新</button>
        </div>
    </div>
  </form>
  
  
  
  <div class="layui-btn-group">
    <button class="layui-btn" onclick="my_addPage('pages/wordbook/add_data.jsp','400px','450px',false,'新增基础数据')">
        <i class="fa fa-plus">&nbsp;</i>新建数据
    </button>
  </div>
  <div class="layui-form nowrap">
    <table class="layui-table" id="my-table" cyType="pageGrid" checkbox:"true" pageColor:"#2991d9">
        <thead>
        	<tr>
	            <th width="5%">数据编号</th>
	
	            <th width="10%">分类编号</th>
	
	            <th width="12%">分类名称</th>
	
	            <th width="10%">数据值</th>	
	            
	            <th width="5%">是否可编辑</th>
	            
	           	<th width="10%">操作</th>        
	        </tr>
        </thead>
        
    </table>
    
    <div id="studentTable_page" align="center">
    	<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">
    		<span id="pages" class="layui-laypage-count">共 0 页</span>
    		<span id="total" class="layui-laypage-count">0 条</span>
    		<span class="layui-laypage-count">当前第<label id="page"></label> 页</span>
    		<a id="prepage" href="javascript:;" class="layui-laypage-prev ye-ma" data-page="0">上一页</a>
    		<a id="nextpage" href="javascript:;" class="layui-laypage-next ye-ma" data-page="2">下一页</a>
    		<span class="layui-laypage-limits">
    			<select  lay-ignore="" id="option">
    				<option value="8" selected="">8 条/页</option>
    				<option value="10">10 条/页</option>
    				<option value="20">20 条/页</option>
    				<option value="30">30 条/页</option>
    				<option value="40">40 条/页</option>
    				<option value="50">50 条/页</option>
    			</select>
    		</span>
    		<span class="layui-laypage-skip">到第<input id="my-input01" type="text" min="1" value="1" class="layui-input">页
    				<button id="but01" type="button" class="layui-laypage-btn">确定</button>
    		</span>
    	</div>
    </div>
    
  </div>
  

</body>

<script type="text/javascript">

$(document).ready(function(){
		
 		$.ajax({
			 url:'wordbook/list.action',
			 type:'post',
		//	 async:false,
			 data:{
				 "pageSize":"8"
			 },
			 success:function(data){
				 var result = eval('('+ data + ')');
				 //加载表格数据
				 loadTable_my(result);
				 //设置页码
				 my_yema(result);	
				 						
			}
				 
		 });//ajax结束 
		 
		//填充表单内容下拉框内容	
 		$.ajax({
			url:"wordbook/categorys.action",
			Type:"post",
			data:{},
			success:function(data){
				//alert(data);
				var result = eval('('+ data + ')');
				$.each(result,function(index,element){
					$("#my-input02").append("<option value='"+element.value+"'>"+element.title+"</option>");
				});
			}
		 }); 
		
		//点击页码
		$(".ye-ma").click(function(){
			//alert($(this).attr("value"));
			var page = $(this).attr("value");
			var pagesize = $("#option").val();
			var category = $("#my-input02").val();
			var value = $("#my-input03").val();
			var editable = $("#my-input04").val();
			if(page < 1) page = 1;
			if(page > $("#pages").attr("value")) page = $("#pages").attr("value");
			my_post(page,pagesize,category,value,editable);
		});
		
		//点击页码的确定按钮
		$("#but01").click(function(){
			//alert($("#option").val()+"----------"+$("#my-input01").val());
			var page = $("#my-input01").val();
			var pagesize = $("#option").val();
			var category = $("#my-input02").val();
			var value = $("#my-input03").val();
			var editable = $("#my-input04").val();
			if(page < 1) page = 1;
			if(page > $("#pages").attr("value")) page = $("#pages").attr("value");
			my_post(page,pagesize,category,value,editable);
		});
			
		
});
	//点击查询按钮
	function search(page){
		//alert($("#my-input02").val()+"-"+$("#my-input03").val());
		if(page == '') page = 1;
		var pagesize = $("#option").val();
		var category = $("#my-input02").val();
		var value = $("#my-input03").val();
		var editable = $("#my-input04").val();
		my_post(page,pagesize,category,value,editable);
	}
	
	//post函数
	function my_post(page,pagesize,category,value,editable){
		$.post("wordbook/list.action",{
			"currentPage" : page,
			"pageSize" : pagesize,
			"category":category,
			"value":value,
			"editable":editable
		},
		function(data,status){
			var result = eval('('+ data + ')');
			loadTable_my(result);
			my_yema(result);	
		});
	}
	 
	//加载表格数据
	 function loadTable_my(result) {
		//清空当前表格内容
		 $(".my-tr").remove();
		if(result.list == ''){
			Msg.info("没有符合条件的数据");
		}
		$.each(result.list,function(index,element){
			//console.log(index);
			//console.log(element);
			var editable = null;
			var value = null;
			var button = '';
			if(element.editable == 1){
				editable = "可编辑";
				button = "<button onclick='my_edit("+element.id+")' class='layui-btn layui-btn-xs'>编辑</button>"
	            	+"<button onclick='my_delete("+element.id+")' class='layui-btn layui-btn-danger "
	            	+"layui-btn-xs'>删除</button>"
			}else{editable = "不可编辑";}				
			if(element.value == '1') 		value = "★";
			else if(element.value == '2')	value = "★★";
			else if(element.value == '3')	value = "★★★";
			else if(element.value == '4')	value = "★★★★";
			else if(element.value == '5')	value = "★★★★★";
			else value = element.value;
				
			$("table").append(
					"<tr class='my-tr'>"
						+"<td>"+element.id+"</td>"
						+"<td>"+element.category+"</td>"
						+"<td>"+element.title+"</td>"
						+"<td>"+value+"</td>"
						+"<td>"+editable+"</td><td>"
						+button
			            +"</td>"
					+"</tr>"		
			);
		});//each

		layui.use(['layer', 'form'], function () {
		    //重新渲染下拉框
		    var form=layui.form;
		    form.render();//layui没有写这个，操作后没有效果
		});
		
	 }//加载表格数据函数结束
	 
	 
	//设置页数等值
	 function my_yema(result){
		 $("#pages").attr("value",result.pages);
		 $("#pages").text("共"+result.pages+"页");
		 $("#total").attr("value",result.total);
		 $("#total").text(result.total+"条");
		 $("#page").html("<label id='page'>"+result.page+"</label>");
		 $("#prepage").attr("value",result.page-1);
		 $("#nextpage").attr("value",result.page+1);
	 }
	
	 //删除
	 function my_delete(id){
		 var msg = "确认删除编号为  <span class='ft-red ft-bold'>"+id+"</span> 的记录吗?";
		 url = "wordbook/deleteData.action";
		 confirm(msg,function(){
		        $.ajax({
		            type: "post",
		            url: url,
		            data:{"id" : id},
		            async: false,
		            success: function (result) {
		            	result = eval('('+result+')');
		                if (result.code == 0) {
		                    search();
		                    Msg.success('删除成功 !', {icon: 1});
		                } else {
		                    Msg.error(result.msg, {icon: 5});
		                }
		            },
		            error: function () {
		                Msg.error("系统繁忙", {icon: 5});
		            }
		        });
		    });
	 }
	 
	 //编辑
	 function my_edit(id){
		 my_editPage('pages/wordbook/edit_data.jsp',id,'400px','500px','编辑基础数据');
	 }
	
	//点击刷新按钮
	function research(){
		$("#my-input02").val('');
		$("#my-input03").val('');
		$("#my-input04").val('');
		search();
	}
	 
	 


</script>

</html>