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
<style type="text/css">
	.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
	     top: 50%;
	     transform: translateY(+50%);
	}
		
</style>
<!-- body{overflow-y: scroll;} -->
<base href="<%=basePath%>"/>

	<script src="statics/js/jquery.min.js"></script>
    <link rel="stylesheet" href="statics/css/font-awesome.min.css">
    <!--layui ztree样式-->
    <link rel="stylesheet" href="statics/plugins/layui/css/layui.css" media="all">
    <script src="statics/plugins/layer/layer.js"></script>
    <script src="statics/plugins/layui/layui.js"></script>
    <script src="statics/plugins/ztree/jquery.ztree.all.min.js"></script>
    <link rel="stylesheet" href="statics/plugins/ztree/css/metroStyle/metroStyle.css">
    <link rel="stylesheet" href="statics/plugins/layui/css/layui.css">
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

  <form class="layui-form">
  	<input id="my-userId" type="hidden" value="${sessionScope.user.id}" />
  	<input id="my-userName" type="hidden" value="${sessionScope.user.account}" />
    <div class="layui-form-item">
        <label class="layui-form-label">客户名:</label>
        <div class="layui-input-inline">
            <input type="text" id="my-input02" name="customerName" placeholder="请输入名称" class="layui-input">
        </div>
        <label class="layui-form-label">负责人:</label>
        <div class="layui-input-inline">
	       	<select id="my-select02" >
	       		<option value="" selected="selected">请选择负责人</option>
	       	</select>
	    </div>
        <label class="layui-form-label">指派状态:</label>
        <div class="layui-input-inline">
	       	<select id="my-select01" >
	       		<option value="" selected="selected">请选择指派状态</option>
	       		<option value="0" >未指派</option>
	       		<option value="1">已指派</option>
	       	</select>
	    </div>
        <div class="layui-input-normal">
        	<button class="layui-btn layui-btn-green" lay-submit="" lay-filter="moreSearch">
	            <i class="fa fa-chevron-down">&nbsp;</i>更多
	        </button>
            <button id="my-search"  type="button" class="layui-btn" onclick="search()" >
            <i class="fa fa-search">&nbsp;</i>查询</button>
            <button class="layui-btn"><i class="fa fa-refresh">&nbsp;</i>刷新</button>
        </div>
    </div>
    
    

<!--     <div class="layui-form-item more-search">
    	
    </div> -->
    
    <div class="layui-form-item more-search">
    
	    <div class="layui-form-item">
	    	<label class="layui-form-label">机会概要</label>
	        <div class="layui-input-inline">
	            <input type="text" id="my-input03" placeholder="机会概要" class="layui-input">
	        </div>
	        <label class="layui-form-label">成功概率</label>
	        <div class="layui-input-inline">
	        	<select id="my-input04" lay-filter="aihao">
	        		<option value="" >成功概率大于</option>
					<option value="0.9" >90 %</option>
					<option value="0.8" >80 %</option>
					<option value="0.7" >70 %</option>
					<option value="0.6" >60 %</option>
					<option value="0.5" >50 %</option>
					<option value="0.4" >40 %</option>
					<option value="0.3" >30 %</option>
					<option value="0.2" >20 %</option>
					<option value="0.1" >10 %</option>
				</select>
	        </div>
	        <label class="layui-form-label">开发状态</label>
		    <div class="layui-input-inline">
		       	<select id="my-select03" >
		       		<option value="" selected="selected">请选择机会状态</option>
		       		<option value="0" >开发中</option>
		       		<option value="1">开发成功</option>
		       		<option value="-1">开发失败</option>
		       	</select>
		    </div>
	    </div>
    	
    	<div class="layui-form-item">
	        <label class="layui-form-label">最早日期</label>
	        <div class="layui-input-inline">
	            <input type="text" id="earlyDate" placeholder="选择最早创建时间" class="layui-input" style="cursor: pointer;">
	        </div>
	        <label class="layui-form-label">最晚日期</label>
	        <div class="layui-input-inline">
	            <input type="text" id="lateDate" placeholder="选择最迟创建时间" class="layui-input" style="cursor: pointer;">
	        </div>
        </div>
    </div>
    
  </form>
  
  <div class="layui-btn-group">
    <button class="layui-btn" onclick="my_add()">
        <i class="fa fa-plus">&nbsp;</i>新增销售机会
    </button>
    <button class="layui-btn allsale" onclick="all_sale()">
        	所有销售机会
    </button>
    <button class="layui-btn mysale" onclick="my_sale()">
        	我创建的机会
    </button>
    <button class="layui-btn layui-btn-danger" onclick="my_deletes()">
    	<i class="fa fa-trash">&nbsp;</i>删除
    </button>
  </div>
  <div class="layui-form nowrap">
    <table class="layui-table" id="my-table" lay-filter="my-table" pageColor='#2991d9'>
        
    </table>   
  </div>
  

</body>

<script type="text/javascript">

//表格实例
var tableIns = '';
//记录创建人，用于切换我的销售机会和所哟销售机会
var createId = '';

$(document).ready(function(){
	$(".allsale").addClass("layui-btn-normal");
	layui.use('table', function(){
		  var table = layui.table;
		  
		  //第一个实例
		  tableIns = table.render({
		    elem: '#my-table'
		    ,height: 475
		    ,url: 'sale/list2.action' //数据接口
		    ,request: {
		    	 pageName: 'currentPage' //页码的参数名称，默认：page
		    	,limitName: 'pageSize' //每页数据量的参数名，默认：limit
		    }
		    ,page: {
		    	 curr: location.hash.replace('#!fenye=', '')
			    ,layout:['count','prev','page','next','limit','refresh','skip']
		    }
		    ,initSort: {
		        field: 'probability' //排序字段，对应 cols 设定的各字段名
		        ,type: 'desc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
		      }
		    ,even: true
		    ,cols: [[ //表头
		    	{type:'checkbox'}
		      ,{field: 'saleId', title: 'ID', sort: true,width:'6%'}
		      ,{field:'customerName',title:'客户名',width:'14%'}
		      ,{field:'summary',title:'概要',width:'20%'}
		      ,{field:'createMan',title:'创建人',width:'6%'}
		      ,{title:'成功几率',field:'probability', sort:true,width:'8%',templet:function(d){
		    	  var str=Number(d.probability*100).toFixed(1);
		    	  str+="%";
		    	  return str;
		      }}
		      ,{title:'创建日期',field:'createDate',sort:true,width:'12%',templet:function(d){
		    	  return dateformatter(d.createDate);
		      }}
		      ,{title:'负责人',field:'dealMan',width:'7%',templet:function(d){
		    	  if(d.dealMan != null){
		    		  return d.dealMan;
		    	  }else{
		    		  //return "<div><select type='select' id='my-assign' lay-ignore >"
								//+"<option value='0' >请选择</option></select></div>";
		    		  return "<a class='layui-btn layui-btn-xs layui-btn-warm my-bassign' href='javascript:;'"
		    		  	+"onclick='assign("+d.saleId+")'>指&nbsp;&nbsp;派</a>";
		    	  }
		      }}
		      ,{title:'状态',field:'state', sort:true,width:'8%',templet:function(d){
		    	  if(d.state == 0) return '开发中';
		    	  if(d.state == 1) return '<span class="ft-blue ft-bold">开发成功</span>';
		    	  if(d.state == -1) return '<span class="ft-red ft-bold">开发失败</span>';
		      }}
		      ,{toolbar: '#toolbar',title:'操作',width:'14%'}
		    ]]
		    ,done:function(res,curr,count){
		    	//console.log("当前页码为"+curr);
		    }
		  });	  
	});
		 
	//填充表单内容下拉框内容	
	$.ajax({
		url:"sale/cmanagers.action",
		Type:"post",
		async:false,
		data:{},
		success:function(data){
			//alert(data);
			var result = eval('('+ data + ')');
			layui.use(['layer','form'],function(){
				var form = layui.form;
				$.each(result,function(index,element){
					$("#my-select02").append("<option value='"+element.id+"'>"+element.account+"</option>");
				//	$("#my-assign").append("<option value='"+element.id+"'>"+element.account+"</option>");
				});
				form.render();
			})				
		}
	});
	
		
});
	

	//执行批量删除操作
	function my_deletes(){
		var rows = '';
		var saleIds = new Array();
		layui.use(['layer','table'],function(){
			var table = layui.table;
			rows = table.checkStatus('my-table'); //获取选中行的数据
		})	
		if (rows.data.length == 0) {
			Msg.info("未选中数据");
			return false;
		}
		//console.log(rows);
		var flag = 0;
		var userid = $("#my-userId").val();
		//遍历数据查看是否勾选了他人创建的机会
		$.each(rows.data,function(index,element){
			//console.log(element);
			if(element.createId != userid){
				//console.log(element.createId+"---"+userid);
				flag = 1;
			}
		})
		if (flag == 1) {
			layer.msg("无法删除他人创建的机会",{icon:5});
			return false;
		}
		$.each(rows.data,function(index,element){
			if(element.dealMan != null && element.dealMan != ''){
				flag = 1;
			}
			saleIds.push(element.saleId);
		})
		if(flag == 1){
			Msg.error("已指派负责人的机会不可删除",{icon:5});
			return false;
		}
		//console.log(saleIds);
		confirm('确认删除选中的  <span class="ft-red ft-bold">'+rows.data.length+'</span> 条记录吗?',
			function(){
				$.ajax({
					url:'sale/dodels.action',
					Type: 'post',
					data:{
						"saleIds":saleIds
					},
					traditional:true,
					success:function(data){
						data = eval('('+data+')');
						console.log(data);
						if (data.code == 0) {
							Msg.success('删除成功 !', {icon: 1});
							$(".layui-laypage-btn").click();
						}else{
							Msg.error(data.msg,{icon:5});
						}
					}
				})
		})		
	}
	
	//我创建的销售机会
	function my_sale(){
		createId = $("#my-userId").val();
		$(".allsale").removeClass("layui-btn-normal");
		$(".mysale").addClass("layui-btn-normal");
		search();
	}
	
	//所有销售机会
	function all_sale(){
		createId = '';
		$(".mysale").removeClass("layui-btn-normal");
		$(".allsale").addClass("layui-btn-normal");
		search();
	}
	
	//点击查询按钮
	function search(){
		var customerName = $("#my-input02").val();	
		var summary = $("#my-input03").val();
		var status = $("#my-select01").val();
		var problibity = $("#my-input04").val();
		var dealId = $("#my-select02").val();
		var state = $("#my-select03").val();
		var earlyDate = $("#earlyDate").val();
		var lateDate = $("#lateDate").val();
		//alert(earlyDate);
		tableIns.reload({
			method : 'post',//默认用的时get,导致参数在后台乱码
			loading: true,
			where: { //设定异步数据接口的额外参数
			  "customerName" : customerName,
			  "summary" : summary,
			  "status" : status,
			  "problibity" : problibity,
			  "dealId" : dealId,
			  "state" : state,
			  "earlyDate" : earlyDate,
			  "lateDate" : lateDate,
			  "createId" : createId
			}
			,page: {
			  curr: 1,  //重新从第 1 页开始
			  layout:['count','prev','page','next','limit','refresh','skip']
			}
		});
		
	}
 
	 //新增销售机会
	 function my_add(){		
		parent.layer.open({
			type: 2,
			title: '新增销售机会',
			shadeClose: false,
			shade: [0.5, '#000'],
			maxmin: true, //开启最大化最小化按钮
			area: ['700px', '550px'],
			content: "pages/sale/addsale.jsp",
			end:function(){
				$(".layui-laypage-btn").click();
			}
		});
	 }
	 
	
	 //执行删除操作
	 function my_delete(saleId){
		 $.ajax({
	            type: "post",
	            url: "sale/dodel.action",
	            data:{"saleId" : saleId},
	            async: false,
	            success: function (result) {
	            	result = eval('('+result+')');
	                if (result.code == 0) {
	                	$(".layui-laypage-btn").click();
	                    Msg.success('删除成功 !', {icon: 1});
	                } else {
	                    Msg.error(result.msg, {icon: 5});
	                }
	            },
	            error: function () {
	                Msg.error("系统繁忙", {icon: 5});
	            }
	        });
	 }
	 
	//编辑销售机会
	 function my_edit(saleId){		
		parent.layer.open({
			type: 2,
			title: '修改销售机会',
			shadeClose: false,
			shade: [0.5, '#000'],
			maxmin: true, //开启最大化最小化按钮
			area: ['1000px', '620px'],
			content: "pages/sale/editsale.jsp?id="+saleId,
			end:function(){
				$(".layui-laypage-btn").click();
			}
		});
	 }
	
	//销售机会详情
	function my_detail(saleId){
		 sale_detail("pages/sale/sale_detail.jsp",saleId);
	}
	
	
	//指派按钮
	function assign(id){
		var userId = $("#my-userId").val();
		$.ajax({
			type:"post",
			url :"sale/getRole.action",
			data:{
				"userId" : userId
			},
			success:function(result){
				result = eval('('+result+')');
				//console.log(result);
				if (result.code != 0) {
					layer.msg(result.msg,{icon:5});
				}else {
					var url = 'pages/sale/assign.jsp';
					parent.layer.open({
				        type: 2,
				        title: '指派负责人',
				        shadeClose: false,
				        shade: [0.5, '#000'],
				        maxmin: true, //开启最大化最小化按钮
				        area: ['300px', '450px'],
				        content: url+"?"+"id="+id,
				        end:function(){
				        	$(".layui-laypage-btn").click();
				        }
				    });
				}
			},
			error:function(){
				Msg.error("系统繁忙", {icon: 5});
			}
		})
		
	}
	
	//监听工具栏点击事件
	layui.use('table',function(){
		var table = layui.table;
		
		//监听复选框
		table.on('checkbox(my-table)', function(obj){
		    //console.log(obj);
		});
		
		//注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		table.on('tool(my-table)', function(obj){ 
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  var tr = obj.tr; //获得当前行 tr 的DOM对象
			  if(layEvent === 'detail'){ //查看
				console.log("监听到点击查看按钮");
			  	console.log(data);
			  	my_detail(data.saleId);
			  } else if(layEvent === 'delete'){ //删除
				  	console.log("监听到点击删除按钮");
			  		var id = $("#my-userId").val();
			  		if (id == data.createId) {
			  			if(data.dealMan == null){
				  			confirm('确定删除 <span class="ft-red ft-bold">'+data.customerName+'</span> 吗?', function(){
						    	my_delete(data.saleId);
						    });			  			
				  		}else{			  			
				  			Msg.error("已分配的机会不可删除");
				  		}
					}else{
						layer.msg("无法删除他人创建的机会",{icon:5});
					}	  	
				    
			  } else if(layEvent === 'edit'){ //编辑
			    	//do something
			    	console.log("监听到点击编辑按钮");
			    	if(data.dealMan == null){
			    		my_edit(data.saleId);			  			
			  		}else{			  			
			  			Msg.error("已分配的机会不可再编辑");
			  		}
			  }
			});
	});
	 
	//时间格式转换器
	function dateformatter(datestring){
		if(!datestring) return "无";
		var date = new Date(datestring);
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
 		var h = date.getHours();
		var mm = date.getMinutes();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+(h<10?('0'+h):h)+':'+(mm<10?('0'+mm):mm);
	}
	
	function toSaleSource(source){
		Page.open('销售机会分类','pages/echarts/SaleSource.jsp?source=' + source);
	}
	
	//转化成日期选择框
	layui.use('laydate', function(){
	  var laydate = layui.laydate;	  
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#earlyDate',//指定元素
	    type: 'datetime',
	    theme:'grid',
//	    format: 'yyyy-MM-dd HH:mm' 只有默认的时间格式才能正确上传到后台controller
	  });
	  
	  laydate.render({
		elem: '#lateDate',//指定元素
		type: 'datetime',
		theme:'grid',
//		format: 'yyyy-MM-dd HH:mm'
	  });
	  
	});
	

</script>

	<script type="text/html" id="toolbar">
  		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
	</script>

</html>