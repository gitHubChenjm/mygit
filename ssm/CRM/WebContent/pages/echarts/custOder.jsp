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
<title>客户分类统计</title>
<script src="statics/libs/jquery-1.7.2.js"></script>
<script src="statics/plugins/echarts/echarts.js"></script>
</head>
<body>
	<input type="hidden" id="customerId" name="customerId" value='<%=request.getParameter("customerId")%>'/>
 <div id="cusOder" style="width: 800px;height:400px;"></div>
<script type="text/javascript">
//获取customner id为1的
var id = $('#customerId').val();
var data = getData(id);
var dom = document.getElementById("cusOder");
var myChart = echarts.init(dom);
var app = {};
option = {
		title : {
	        text: '客户购买记录',
	        subtext: '按日期计算',
	        x:'center'
	    },
	    xAxis: {
	        type: 'category',
	        data: data.date,
	        axisLabel:{
	        	
	        	interval: '0',//横轴全部显示
	        	rotate : -30,//-30度倾角
	        }
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel:{
	 	        	formatter:'{value} 万元',
	 	        }
	    },toolbox: {
	        feature: {
	            /*  dataView: {show: true, readOnly: false},
	             restore: {show: true}, */   //数据可视化，数据刷新
	             saveAsImage: {show: true}     //保存图片
	         }
	     },
	    series: [{
	        data: data.total,
	        type: 'line',
	        smooth: true
	    }]
	};
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
/**
 * 获取页面参数之一：数据,价值
 */
function getData(customer_id){
	var date = [];
	var total = [];
	$.ajax({
		url:'echarts/CustOrder.action',
		async : false,
		data:{
			'customerId':customer_id
		},
		success:function(data){
			var result = eval('('+ data +')');
			
			$.each(result,function(idx,obj){
				
				date.push(getDate(obj.startDate));
				total.push(obj.total/10000);
				//以万为单位
			});//each
			
		}
		
	});
	return {
		date:date,
		total:total
	}
}

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

	    var now=year+'-'+p(month)+"-"+p(date)+" "+p(h)+':'+p(m)+":"+p(s);
		return now;
}




</script>
</body>
</html>