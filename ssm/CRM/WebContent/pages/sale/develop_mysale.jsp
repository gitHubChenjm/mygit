<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的销售机会</title>
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

  <form class="layui-form" action="">
  	<input id="my-userId" type="hidden" value="${sessionScope.user.id}" />
    <div class="layui-form-item">
        <label class="layui-form-label">客户名:</label>
        <div class="layui-input-inline">
            <input type="text" id="my-input02" name="customerName" placeholder="请输入名称" class="layui-input">
        </div>
        <label class="layui-form-label">概要:</label>
        <div class="layui-input-inline">
            <input type="text" id="my-input03" placeholder="机会概要" class="layui-input">
        </div>
        
        <label class="layui-form-label">联系人:</label>
        <div class="layui-input-inline">
        	<input type="text" id="my-input05" placeholder="联系人" class="layui-input">
        </div>

        <div class="layui-input-normal">
            <button id="my-search"  type="button" class="layui-btn" onclick="search()" >
            <i class="fa fa-search">&nbsp;</i>查询</button>
        </div>
    </div>
  </form>
  
  
  <div class="layui-btn-group">
    <button class="layui-btn my-btn my-all" onclick="refresh()">
                    我负责的所有机会
    </button>
    <button class="layui-btn my-btn my-success" onclick="my_success()">
    	开发成功
    </button>
    <button class="layui-btn my-btn my-stop" onclick="my_stop()">
    	开发失败
    </button>
    <button class="layui-btn my-btn my-doing" onclick="my_doing()">
    	开发中
    </button>
  </div>
  
  
  <div class="layui-form nowrap">
    <table class="layui-table" id="my-table" lay-filter="my-table" cyType="pageGrid">
        
    </table>    
  </div>
  

</body>

<script type="text/javascript">

	var tableIns = '';
	
	//记录状态,搜索时用到
	var state = '';

	$(document).ready(function(){
	
		$(".my-all").addClass("layui-btn-danger");
		
		layui.use(['layer','table'], function(){
			
			  var table = layui.table;			  
			  //第一个实例
			  tableIns = table.render({
			    elem: '#my-table'
			    ,height: 475
			    ,url: 'sale/list.action' //数据接口
			    ,request: {
			    	 pageName: 'currentPage' //页码的参数名称，默认：page
			    	,limitName: 'pageSize' //每页数据量的参数名，默认：limit
			    }
			    ,where:{
			    	"dealId":$("#my-userId").val()
			    	// "state":0
			    }
			    ,page: {
			    	 curr: location.hash.replace('#!fenye=', '')
				    ,layout:['count','prev','page','next','limit','refresh','skip']
			    }
			    ,even: true
			    ,cols: [[ //表头
			       {field: 'saleId', title: 'ID', sort: true,width:'5%'}
			      ,{field:'customerName',title:'客户名',width:'13%'}
			      ,{field:'summary',title:'概要',width:'18%'}
			      ,{field:'assignDate',title:'指派时间',sort:true,width:'12%',templet:function(d){
			    	  return dateformatter(d.assignDate);
			      }}
			      ,{title:'成功几率',field:'probability', sort:true,templet:function(d){
			    	  var str=Number(d.probability*100).toFixed(1);
			    	  str+="%";
			    	  return str;
			      },width:'8%'}
			      ,{title:'联系人',field:'contacts',width:'8%'}
			      ,{field:'tel',title:'联系电话',width:'10%'}
			      ,{field:'createMan',title:'创建人',width:'8%'}
			      ,{field:'state',title:'状态',templet:function(d){
			    	  if(d.state == 0) return '开发中';
			    	  if(d.state == 1) return '<span class="ft-blue ft-bold">开发成功</span>';
			    	  if(d.state == -1) return '<span class="ft-red ft-bold">开发失败</span>';
			      },width:'8%'}
			      ,{toolbar: '#toolbar',title:'操作',width:'8%'}
			    ]]
			    ,done:function(res,curr,count){
			    	console.log("当前页码为"+curr);
			    }
			  })	  
		})

	});
	
	//监听工具栏点击事件
	layui.use('table',function(){
		var table = layui.table;
		
		//监听复选框
		table.on('checkbox(my-table)', function(obj){
		    console.log(obj);
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
			  } 
			});
	});
	
	//点击查询按钮
	function search(){
		var customerName = $("#my-input02").val();
		var summary = $("#my-input03").val();
		var contacts = $("#my-input05").val();
		tableIns.reload({
			method : 'post',//默认用的时get,导致参数在后台乱码
			loading: true,
			where: { //设定异步数据接口的额外参数
				"customerName":customerName,
				"summary":summary,
				"contacts":contacts,
				"dealId":$("#my-userId").val(),
				"state" : state
			}
			,page: {
			  curr: 1,  //重新从第 1 页开始
			  layout:['count','prev','page','next','limit','refresh','skip']
			}
		})
		
	}
	 	 
	 function my_detail(saleId){
		 parent.layer.open({
		 	type: 2,
		    title: '销售机会及计划详情',
		    shadeClose: false,
		    shade: [0.5, '#000'],
		    maxmin: true, //开启最大化最小化按钮
		    area: ['1000px', '620px'],
		    content: "pages/sale/develop_sale_detail.jsp?id="+saleId,
		    end:function(){
		    	$(".layui-laypage-btn").click();
		    }
		 });
	 }
	 
	 function my_success(){
		 state = 1;
		 $(".my-btn").removeClass("layui-btn-danger");
		 $(".my-success").addClass("layui-btn-danger");
		 $("#my-input02").val('');
		 $("#my-input03").val('');
		 $("#my-input05").val('');
		 search();
	 }
	 
	 function my_stop(){
		 state = -1;
		 $(".my-btn").removeClass("layui-btn-danger");
		 $(".my-stop").addClass("layui-btn-danger");
		 $("#my-input02").val('');
		 $("#my-input03").val('');
		 $("#my-input05").val('');
		 search();
	 }
	 
	 function my_doing(){
		 state = 0;
		 $(".my-btn").removeClass("layui-btn-danger");
		 $(".my-doing").addClass("layui-btn-danger");
		 $("#my-input02").val('');
		 $("#my-input03").val('');
		 $("#my-input05").val('');
		 search();
	 }
	 
	 function refresh(){
		 state = '';
		 $(".my-btn").removeClass("layui-btn-danger");
		 $(".my-all").addClass("layui-btn-danger");
		 $("#my-input02").val('');
		 $("#my-input03").val('');
		 $("#my-input05").val('');		 
		 search();
	 }
	 
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
	 


</script>

<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-xs" lay-event="detail">计划详情</a>
</script>

</html>