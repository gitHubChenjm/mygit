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
 <div id="cusAverage" style="width: 900px;height:500px;"></div>
<script type="text/javascript">

//获取每个年份的数据
var v = [];
var data16 = getData('2016-01-01','2017-01-01');
var data17 = getData('2017-01-01','2018-01-01');
var data18 = getData('2018-01-01','2019-01-01');
var dom = document.getElementById("cusAverage");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '客户贡献度 - 条形图';
option = {
    title: {
        text: '客户贡献度',
        subtext: '统计'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
        
    },
    toolbox: {
        feature: {
           /*  dataView: {show: true, readOnly: false},
            restore: {show: true}, */   //数据可视化，数据刷新
            saveAsImage: {show: true}     //保存图片
        }
    },
    legend: {
        data: ['2016年', '2017年','2018年']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: {
        type: 'value',
        boundaryGap: [0, 0.01],
        axisLabel:{formatter:'{value} 万元'},
        splitLine: {
            show: true
        }
    },
    yAxis: {
        type: 'category',
        data: data16.names,
        splitLine: {
            show: true
        }
    },dataZoom: [
        {
        	orient: 'vertical',  //缩小方法，方向垂直
            type: 'inside'
            
        }, 
        {//y轴滚动条
            type: 'slider',
            show: true,
            yAxisIndex: [0],
            left: '96%'
        }
    ],
    series: [
        {
            name: '2016年',
            type: 'bar',
            data: data16.totals
        },
        {
            name: '2017年',
            type: 'bar',
            data: data17.totals
        },
        {
            name: '2018年',
            type: 'bar',
            data: data18.totals
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
/**
 * 获取页面参数之一：数据,价值
 */
function getTotal(startDate,endDate){
	var total = [];
	$.ajax({
		url:'echarts/CustAverage.action',
		async : false,
		data:{
			'startDate':startDate,
			'endDate':endDate
		},
		success:function(data){
			var result = eval('('+ data +')');
			//console.log(data);
			$.each(result,function(idx,obj){
				total.push(obj.total/10000.0); 
				 //按万元来算
			});//each
		}
		
	});
	return total;
}
/**
 * 获取页面参数之一：名字
 */
function getName(startDate,endDate){
	$.ajax({
		url:'echarts/CustAverage.action',
		async : false,
		data:{
			'startDate':startDate,
			'endDate':endDate
		},
		success:function(data){
			var result = eval('('+ data +')');
			
			$.each(result,function(idx,obj){
				if(!hasStr(v,obj.CusName)){
					console.log(obj.CusName);
					v.push(obj.CusName);
				}
				
			});//each
		}
		
	});
	return v;
}
/**
 * 获取页面参数
 */
function getData(startDate,endDate){
	return {
		names:getName(startDate,endDate),
		totals:getTotal(startDate,endDate)
	}
}

/**
 * 判断字符串是否相等
 */
function hasStr(array,str){
	for(var i = 0;i<array.length;i++){
		if(str == array[i]){
			return true;
		}
	}
	return false;
}

</script>
</body>
</html>