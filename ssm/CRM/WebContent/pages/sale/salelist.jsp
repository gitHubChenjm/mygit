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
            <button type="reset" class="layui-btn layui-btn-primary"><i class="fa fa-refresh">&nbsp;</i>重置</button>
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
    <button class="layui-btn" onclick="Page.open('新增销售机会','pages/sale/addsale.jsp')">
        <i class="fa fa-plus">&nbsp;</i>增加
    </button>
  </div>
  <div class="layui-form nowrap">
    <table class="layui-table" id="my-table" cyType="pageGrid" lay-even
           checkbox:'true',pageColor:'#2991d9'">
        <thead>
        <tr>
            <!--复选框-->
<!--             <th width="1%" param="{type:'checkbox'}">
                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
            </th> -->
            <!--isPrimary：是否是主键-->
            <th width="1%" param="{name:'',isPrimary:'true',hide:'true'}">机会编号</th>

            <th width="5%" param="{name:'name'}">顾客名称</th>

            <th width="12%" param="{name:'age'}">机会概要</th>

            <th width="10%" param="{name:'address'}">机会来源</th>

            <th width="5%" param="{name:'sex',enumCode:'SexEnum'}">成功几率</th>

            <th width="5%" param="{name:'yingjie',codeName:'whether'}">联系人</th>

            <th width="5%" param="{name:'state',codeName:'state',render:'Render.customState'}">是否指派</th>

            <th width="7%" param="{name:'note'}">负责人</th>
            
            <th width="5%" >指派</th>

            <th width="2%" param="{name:'sort',sortBtn:'true'}">状态</th>

            <th width="10%" param="{operate:'true',buttons:'Render.state,Render.edit,Render.delete'}">操作</th>
        
        </tr>
        </thead>
        
    </table>
    
    <div id="studentTable_page" align="center">
    	<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">
    		<span id="pages" class="layui-laypage-count">共 0 页</span>
    		<span id="total" class="layui-laypage-count">0 条</span>
    		<span class="layui-laypage-count">当前第<label id="page"></label> 页</span>
    		<a id="prepage" href="javascript:;" class="layui-laypage-prev ye-ma" data-page="0">上一页</a>
    		<!-- <span class="layui-laypage-curr">
    			<em class="layui-laypage-em"></em>
    			<em>1</em>
    		</span> -->
<!--     	<a class="ye-ma" href="javascript:;" data-page="1" value="1">1</a>
    		<a class="ye-ma" href="javascript:;" data-page="2" value="2">2</a>
    		<a class="ye-ma" href="javascript:;" data-page="3" value="3">3</a> -->
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
			 url:'sale/list.action',
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
		
		//点击页码
		$(".ye-ma").click(function(){
			//alert($(this).attr("value"));
			var page = $(this).attr("value");
			var pagesize = $("#option").val();
			var customerName = $("#my-input02").val();
			var summary = $("#my-input03").val();
			var status = $("#my-select01").val();
			var problibity = $("#my-input04").val();
			var contacts = $("#my-input05").val();
			var tel = $("#my-input06").val();
			var dealId = $("#my-select02").val();
			var state = $("#my-select03").val();
			if(page < 1) page = 1;
			if(page > $("#pages").attr("value")) page = $("#pages").attr("value");
			my_post(page,pagesize,customerName,summary,status,problibity,contacts,tel,dealId,state);
		});
		
		//点击页码的确定按钮
		$("#but01").click(function(){
			//alert($("#option").val()+"----------"+$("#my-input01").val());
			var page = $("#my-input01").val();
			var pagesize = $("#option").val();
			var customerName = $("#my-input02").val();
			var summary = $("#my-input03").val();
			var status = $("#my-select01").val();
			var problibity = $("#my-input04").val();
			var contacts = $("#my-input05").val();
			var tel = $("#my-input06").val();
			var dealId = $("#my-select02").val();
			var state = $("#my-select03").val();
			if(page < 1) page = 1;
			if(page > $("#pages").attr("value")) page = $("#pages").attr("value");
			my_post(page,pagesize,customerName,summary,status,problibity,contacts,tel,dealId,state);
		});
		

		
		
});
	//点击查询按钮
	function search(page){
		//alert($("#my-input02").val()+"-"+$("#my-input03").val());
		if(page == '') page = 1;
		var pagesize = $("#option").val();
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
			my_yema(result);	
		});
	}
	 
	//加载表格数据
	 function loadTable_my(result) {
		//清空当前表格内容
		 $(".my-tr").remove();
		if(result.list == ''){
			alert("没有符合条件的数据");
		}
		$.each(result.list,function(index,element){
			//console.log(index);
			//console.log(element);
			var status = null;
			var state = null;
			var dealMan = null;
			if(element.status == 1){
				status = "已指派";
			}else{status = "未指派";}				
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
				
			if(element.dealMan != null) dealMan = element.dealMan
				+"<td><button  class='layui-btn layui-btn-warm layui-btn-xs  layui-btn-disabled'>指派</button></td>";
			//如果没有负责人就设置为下拉框
			else dealMan = ""
				+"<select lay-ignore id='"+element.saleId+"' class='my-customerDeal'>"
				+"<option value=''>请选择</option>"			
				+"</select>"
				+"<td><button  class='layui-btn layui-btn-warm layui-btn-xs' "
				+"onclick='my_deal("+element.saleId+")'>指派</button></td>"; 
			$("table").append(
					"<tr class='my-tr'>"
						+"<td>"+element.saleId+"</td>"
						+"<td>"+element.customerName+"</td>"
						+"<td>"+element.summary+"</td>"
						+"<td>"+element.source+"</td>"
						+"<td>"+probability+"</td>"
						+"<td>"+element.contacts+"</td>"
						+"<td>"+status+"</td>"
						+"<td>"+dealMan+"</td>"
						+"<td>"+state+"</td>"
						+"<td><button onclick='my_detail("+element.saleId+")' class='layui-btn layui-btn-xs my-but-detail' value='"+element.saleId+"'>详情</button>"
						+"<button onclick='my_edit("+element.saleId+")' class='layui-btn layui-btn-xs my-but-update' value='"+element.saleId+"'>更改</button>"
			            +"<button onclick='my_delete("+element.saleId+")' class='layui-btn layui-btn-danger layui-btn-xs my-but-delete' value='"+element.saleId+"'>删除</button></td>"
					+"</tr>"		
			);
		});//each
		
		
		//指派负责人下拉框需要获取客户经理名单
		$.ajax({
			url:"sale/cmanagers.action",
			Type:"post",
			async:false,
			data:{},
			success:function(data){
				var result = eval('('+ data + ')');
				$.each(result,function(index,element){
					$(".my-customerDeal").each(function(){
						$(this).append("<option value='"+element.id+"'>"+element.account+"</option>");
					});
				});
			}
		 });//end $
		 

		 
		layui.use(['layer', 'form'], function () {
		    //重新渲染下拉框
		    var form=layui.form;
		    form.render();//layui没有写这个，操作后没有效果
		});
		
	 }//加载表格数据函数结束
	 
	 //点击指派负责人，开始指派
	 function my_deal(saleId){
		 //alert($("#"+saleId+"").val());
		 if($("#"+saleId+"").val()==''){
			 Msg.info("未选择指派人");
			 return false;
		 }
		 var man =  $("#"+saleId).find("option:selected").text();
		 confirm("确认指派 <span class='ft-red'> "+man+"</span> 负责此销售机会？",function(){
			 $.post("sale/doDeal.action",{
				 "saleId" : saleId,
			 	 "dealId.id" : $("#"+saleId+"").val()
			 },function(result,status){
				 result = eval('('+result+')');
				 if (result.code == 0) {
					 //指派完成之后继续留在当前页面
					 search($("#prepage").attr("value")+1);
	                 parent.layer.msg('指派成功 !', {icon: 1});
	             } else {
	                 parent.layer.msg('指派失败 !', {icon: 5});
	             }
			 });
		 });		 
	 }
	 
	 
	//设置页数等值
	 function my_yema(result){
		 $("#pages").attr("value",result.pages);
		 $("#pages").text("共"+result.pages+"页");
		 $("#total").attr("value",result.total);
		 $("#total").text(result.total+"条");
		 $("#page").html("<label id='page'>"+result.page+"</label>");
		 $("#prepage").attr("value",result.page-1);
		 $("#nextpage").attr("value",result.page+1);
		 //记录指派状态
	 }
	
	//删除销售机会
	 function my_delete(saleId){
		 my_deleteOne("删除编号为  <span class='ft-red ft-bold'>"+saleId+"</span> 的记录吗","sale/dodel.action",saleId);
	 }
	 
	//编辑销售机会
	 function my_edit(saleId){
		 $.post("sale/getStatus.action",{
			 "saleId":saleId
		 },function(data,status){
			 if(data == 1){
				alert("已分配负责人的销售机会不可编辑");
			 }else{
				 //Page.open('编辑销售机会','pages/sale/editsale.jsp');
				 sale_editOne("pages/sale/editsale.jsp",saleId);
			 }
		 });
	 }
	
	//销售机会详情
	function my_detail(saleId){
		 sale_detail("pages/sale/sale_detail.jsp",saleId);
	}
	 
	 
	 


</script>

</html>