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
 
 	<br/>
 	<br/>
 	<br/>
  <div class="layui-btn-group">
    <button class="layui-btn" onclick="my_addPage('pages/wordbook/addcategory.jsp','400px','200px',false,'新增基础数据分类')">
        <i class="fa fa-plus">&nbsp;</i>新增数据分类
    </button>
    <button class="layui-btn" onclick="search()"><i class="fa fa-refresh">&nbsp;</i>刷新</button>
  </div>
  <div class="layui-form nowrap">
    <table class="layui-table" id="my-table" cyType="pageGrid" checkbox:"true" pageColor:"#2991d9">
        <thead>
        	<tr>	
	            <th width="10%">分类编号</th>
	
	            <th width="10%">分类名称</th>
	            
	            <th width="10%">是否可编辑</th>
	            
	           	<th width="5%">操作</th>        
	        </tr>
        </thead>
        
    </table>
    
  </div>
  

</body>

<script type="text/javascript">

$(document).ready(function(){
		
 		$.ajax({
			 url:'wordbook/categorys.action',
			 type:'post',
		//	 async:false,
			 data:{
				 "pageSize":"8"
			 },
			 success:function(data){
				 var result = eval('('+ data + ')');
				 //加载表格数据
				 loadTable_my(result);
				 						
			}
				 
		 });//ajax结束 
			
		
});
	//点击查询按钮
	function search(){
		my_post();
	}
	
	//post函数
	function my_post(){
		$.post("wordbook/categorys.action",{

		},
		function(data,status){
			var result = eval('('+ data + ')');
			loadTable_my(result);	
		});
	}
	 
	//加载表格数据
	 function loadTable_my(result) {
		//清空当前表格内容
		 $(".my-tr").remove();
		if(result.list == ''){
			Msg.info("没有符合条件的数据");
		}
		$.each(result,function(index,element){
			//console.log(index);
			//console.log(element);
			var editable = null;
			var button = '';
			if(element.editable == 1){
				editable = "可编辑";
				button = "<button onclick='my_edit("+element.id+")' class='layui-btn layui-btn-xs'>编辑</button>"
	            	+"<button onclick='my_delete("+element.value+")' class='layui-btn layui-btn-danger "
	            	+"layui-btn-xs'>删除</button>"
			}else{editable = "不可编辑";}				
				
			$("table").append(
					"<tr class='my-tr'>"
						+"<td>"+element.value+"</td>"
						+"<td>"+element.title+"</td>"
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
	 
	
	 //删除
	 function my_delete(category){
		 var msg = "确认删除编号为  <span class='ft-red ft-bold'>"+category+"</span> 的分类吗?";
		 url = "wordbook/deleteCate.action";
		 confirm(msg,function(){
		        $.ajax({
		            type: "post",
		            url: url,
		            data:{"category" : category},
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
		 my_editPage('pages/wordbook/editcategory.jsp',id,'400px','250px','编辑分类信息');
	 }
	 
	 


</script>

</html>