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
<base href="<%=basePath%>"/>

	<script src="statics/js/jquery.min.js"></script>
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
        <label class="layui-form-label">客户名:</label>
        <div class="layui-input-inline">
            <input type="text" id="my-input02" name="customerName" placeholder="请输入名称" class="layui-input">
        </div>
        <label class="layui-form-label">概要:</label>
        <div class="layui-input-inline">
            <input type="text" id="my-input03" placeholder="机会概要" class="layui-input">
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
            <button class="layui-btn"><i class="fa fa-refresh">&nbsp;</i>重置</button>
        </div>
    </div>

    <div class="layui-form-item more-search">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
        	<select id="my-input04" lay-filter="aihao">
        		<option value="0.0" >成功几率大于</option>
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
        <!-- <label class="layui-form-label">联系人:</label> -->
        <div class="layui-input-inline">
        	<input type="text" id="my-input05" placeholder="联系人" class="layui-input">
        </div>
       <!--  <label class="layui-form-label">电话号码:</label> -->
        <div class="layui-input-inline">
        	<input type="text" id="my-input06" placeholder="电话号码" class="layui-input">
        </div>
        <div class="layui-input-inline">
	       	<select id="my-select02" >
	       		<option value="" selected="selected">请选择负责人</option>
	       	</select>
	    </div>
	    <div class="layui-input-inline">
	       	<select id="my-select03" >
	       		<option value="" selected="selected">请选择机会状态</option>
	       		<option value="0" >开发中</option>
	       		<option value="1">开发成功</option>
	       		<option value="-1">开发失败</option>
	       	</select>
	    </div>
    </div>
    
<!--     <div class="layui-form-item more-search">
        <label class="layui-form-label">所属地区:</label>
        <div cyType="selectTool" cyProps="enumName:'ProvinceEnum',search:'true',filter:'demo'"
             name="theAreaArr[]" value="" class="layui-input-inline">
        </div>
        <label class="layui-form-label">提交时间:</label>
        <div class="layui-input-inline">
            <input readonly="readonly" type="text" name="startDate" id="startDate" maxlength="20" value=""
                   placeholder="请选择开始时间" class="layui-input Wdate"
                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endDate\')}'})">
        </div>
        <div class="layui-input-inline">
            <input readonly="readonly" type="text" name="endDate" id="endDate" maxlength="20" value=""
                   placeholder="请选择截止时间" class="layui-input Wdate"
                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'startDate\')}'})">
        </div>
    </div> -->
  </form>
  <div class="layui-btn-group">
    <button class="layui-btn" onclick="my_add()">
        <i class="fa fa-plus">&nbsp;</i>新增销售机会
    </button>
  </div>
  <div class="layui-form nowrap">
    <table class="layui-table" id="my-table" lay-filter="my-table" pageColor='#2991d9'>
        <thead>
        <tr>
            <!--复选框-->
            <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
            
            <th lay-data="{field:'saleId', sort:true,width:'6%'}">编号</th>

            <th lay-data="{width:'14%',field:'customerName'}">顾客名称</th>

            <th lay-data="{field:'summary'}">概要</th>

            <th lay-data="{width:'8%',field:'source'}">来源</th>

            <th lay-data="{width:'7%',field:'probability', sort:true}">成功率</th>

            <th lay-data="{width:'11%',field:'createDate',sort:true}">创建日期</th>

            <th lay-data="{width:'7%',field:'dealMan'}">负责人</th>
            
            <th lay-data="{width:'5%',toolbar: '#assign'}" >指派</th>

            <th lay-data="{width:'8%',field:'state', sort:true}">状态</th>

            <th lay-data="{toolbar: '#toolbar',width:'14%'}">操作</th>
        
        </tr>
        </thead>
        
    </table>
    
    
    <div id="table_page" align="center">

    </div>
    
  </div>
  

</body>

<script type="text/javascript">

//记录当前页及行数的全局变量
var thispage = 1;
var thispagesize = 10;

$(document).ready(function(){
		 
	//查询数据
	search();
	//再查一次第一页数据,解决layui横向滚动问题
	table_page_click(thispage,thispagesize);
		 
		//填充表单内容下拉框内容	
		$.ajax({
			url:"sale/cmanagers.action",
			Type:"post",
			async:false,
			data:{},
			success:function(data){
				//alert(data);
				var result = eval('('+ data + ')');
				$.each(result,function(index,element){
					$("#my-select02").append("<option value='"+element.id+"'>"+element.account+"</option>");
				});
			}
		 });
		
});
	//点击查询按钮
	function search(page,pagesize){
		if(page == '') page = 1;
		if(pagesize == '') pagesize = 10;
		var customerName = $("#my-input02").val();	
		var summary = $("#my-input03").val();
		var status = $("#my-select01").val();
		var problibity = $("#my-input04").val();
		var contacts = $("#my-input05").val();
		var tel = $("#my-input06").val();
		var dealId = $("#my-select02").val();
		var state = $("#my-select03").val();
		my_post(page,pagesize,customerName,summary,status,problibity,contacts,tel,dealId,state);
	}
	
	//post函数
	function my_post(page,pagesize,customerName,summary,status,probability,contacts,tel,dealId,state){
		$.post("sale/list.action",{
			"currentPage" : page,
			"pageSize" : pagesize,
			"customerName":customerName,
			"summary":summary,
			"status":status,
			"probability":probability,
			"contacts":contacts,
			"tel":tel,
			"dealId":dealId,
			"state":state
		},
		function(data,status){
			var result = eval('('+ data + ')');
			loadTable_my(result);
			table_page(result);
		});
	}
	 
	//加载表格数据
	 function loadTable_my(result) {
		//清空当前表格内容
		$(".my-tr").remove();
		if(result.list == ''){
			alert("没有符合条件的数据");
		}
		$("table").append("<tbody>");
		$.each(result.list,function(index,element){
			//console.log(index);
			//console.log(element);
			var state = null;
			var dealMan = null;			
			if(element.state == 0) 	state = "开发中";
			else if(element.state == 1)	state = "开发成功";
			else state = "开发失败";
			var probability = 0;
			if (element.probability == 0.1) 	 probability = '10%';
			else if (element.probability == 0.2) probability = '20%';
			else if (element.probability == 0.3) probability = '30%';
			else if (element.probability == 0.4) probability = '40%';
			else if (element.probability == 0.5) probability = '50%';
			else if (element.probability == 0.6) probability = '60%';
			else if (element.probability == 0.7) probability = '70%';
			else if (element.probability == 0.8) probability = '80%';
			else if (element.probability == 0.9) probability = '90%';
			else if (element.probability == 1) 	 probability = '100%';
			else probability = element.probability;
				
			if(element.dealMan != null) dealMan = element.dealMan;
			else dealMan = "<span class='ft-red ft-bold'>未分配</span>";
			$("table").append(
					"<tr class='my-tr'>"
						+"<td></td>"
						+"<td>"+element.saleId+"</td>"
						+"<td>"+element.customerName+"</td>"
						+"<td>"+element.summary+"</td>"
						+"<td><a href='javascript:;' onclick='toSaleSource("+ '"' +element.source+ '"' +")'>"
						+ element.source + "</a></td>"
						+"<td>"+probability+"</td>"
						+"<td>"+dateformatter(element.createDate)+"</td>"
						+"<td>"+dealMan+"</td>"
						+"<td></td>"
						+"<td>"+state+"</td>"
					+"</tr>"		
			);
		});//each
		$("table").append("</tbody>");
		 
		//转换成动态数据表格
		 changeTable(result.pagesize); 
		
		//设置页码参数
		thispage = result.page;
		thispagesize = result.pagesize;
		
	 }//加载表格数据函数结束
	 
	 
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
				table_page_click(thispage,thispagesize);
			}
		});
	 }
	
	 //删除
	 function my_delete(saleId){
		 $.ajax({
	            type: "post",
	            url: "sale/dodel.action",
	            data:{"saleId" : saleId},
	            async: false,
	            success: function (result) {
	            	result = eval('('+result+')');
	                if (result.code == 0) {
	                    table_page_click(thispage,thispagesize);
	                    Msg.success('删除成功 !', {icon: 1});
	                } else {
	                    Msg.error(result.msg, {icon: 5});
	                }
	            },
	            error: function () {
	                Msg.error("系统繁忙", {icon: 5});
	            }
	        });
		 return back;
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
				table_page_click(thispage,thispagesize);
			}
		});
	 }
	
	//销售机会详情
	function my_detail(saleId){
		 sale_detail("pages/sale/sale_detail.jsp",saleId);
	}
	
	//转换动态数据表格
	function changeTable(pagesize){
		layui.use('table', function(){
			var table = layui.table;
			//转换静态表格
			table.init('my-table', {
			  height: '450' //设置高度  
			  ,limit:pagesize //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
			  //支持所有基础参数
			  ,even:true
			}); 
		});
		
	}
	
	//指派窗口
	function assign(id){
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
	        	table_page_click(thispage,thispagesize);
	        }
	    });
	}
	
	//监听工具栏点击事件
	layui.use('table',function(){
		var table = layui.table;
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
			  		if(data.dealMan == '<span class="ft-red ft-bold">未分配</span>'){
			  			confirm('确定删除 <span class="ft-red ft-bold">'+data.customerName+'</span> 吗?', function(){
					    	my_delete(data.saleId);
					    });			  			
			  		}else{			  			
			  			Msg.error("已分配的机会不可删除");
			  		}
				    
			  } else if(layEvent === 'edit'){ //编辑
			    	//do something
			    	console.log("监听到点击编辑按钮");
			    	if(data.dealMan == '<span class="ft-red ft-bold">未分配</span>'){
			    		my_edit(data.saleId);			  			
			  		}else{			  			
			  			Msg.error("已分配的机会不可再编辑");
			  		}
			  }
			  //指派负责人
			  else if(layEvent === 'assign'){
				  	console.log("监听到点击指派按钮");
				  	if(data.dealMan == '<span class="ft-red ft-bold">未分配</span>'){
				  		assign(data.saleId);
			  		}else{
			  			Msg.info("已分配");
			  		}		  		
			  }
			});
	});
	
	//layui页码 初始化
	function table_page(result){
		
		layui.use('laypage', function(){
			var laypage = layui.laypage;
			  
			  //执行一个laypage实例
			  laypage.render({
			     elem: 'table_page' //注意，这里的 test1 是 ID，不用加 # 号
			    ,count: result.total //数据总数，从服务端得到
			    ,limits:[10,20,30,40,50]
			    ,limit:10
			    ,groups:5
			    ,curr: location.hash.replace('#!fenye=', '')
			    ,layout:['count','prev','page','next','limit','refresh','skip']
			  	,jump:function(obj,first){ //obj含有当前页码的所有值
			  		console.log(obj.curr);
			  		//console.log(first);
			  		console.log(obj.limit);
			  		if(!first){
			  			table_page_click(obj.curr,obj.limit);
			  		}
			  	}
			  });
	 	});
	}
	
	//layui页码翻页请求
	function table_page_click(page,pagesize){
		
		var customerName = $("#my-input02").val();	
			var summary = $("#my-input03").val();
			var status = $("#my-select01").val();
			var probability = $("#my-input04").val();
			var contacts = $("#my-input05").val();
			var tel = $("#my-input06").val();
			var dealId = $("#my-select02").val();
			var state = $("#my-select03").val();
			$.post("sale/list.action",{
				"currentPage" : page,
				"pageSize" : pagesize,
				"customerName":customerName,
				"summary":summary,
				"status":status,
				"probability":probability,
				"contacts":contacts,
				"tel":tel,
				"dealId":dealId,
				"state":state
			},
			function(data,status){
				var result = eval('('+ data + ')');
				loadTable_my(result);
			});
	}
	 
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

</script>

	<script type="text/html" id="toolbar">
  		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
	</script>
	<script type="text/html" id="assign">
  		<a class="layui-btn layui-btn-xs" lay-event="assign">指派</a>
	</script>

</html>