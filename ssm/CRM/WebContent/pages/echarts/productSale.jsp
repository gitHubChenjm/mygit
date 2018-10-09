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
<div id="productSale" style="width: 850px;height:400px;"></div>
<script type="text/javascript">
var dom = document.getElementById("productSale");
var myChart = echarts.init(dom);
var app = {};
option = null;
var data = getData();
var colors = ['#5793f3', '#d14a61', '#675bba'];

option = {
    color: colors,

    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross'
        }
    },
    grid: {
        right: '20%'
    },
    toolbox: {
        feature: {
           /*  dataView: {show: true, readOnly: false},
            restore: {show: true}, */   //数据可视化，数据刷新
            saveAsImage: {show: true}     //保存图片
        }
    },
    /* legend: {
        data:data.legendData
    }, */
    xAxis: [
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            data: data.legendData,
			axisLabel:{
	        	
	        	interval: '0',//横轴全部显示
	        	rotate : -30,//-30度倾角
	        }
        }
    ],
    yAxis: [
       
        {
            type: 'value',
            name: '销售数量',
            position: 'left',
            axisLine: {
                lineStyle: {
                    color: colors[2]
                }
            },
            axisLabel: {
                formatter: '{value} 件'
            }
        }
    ],
    series: [
        {
            name:'销售数量',
            type:'bar',
            data:data.seriesData
        },{
            name:'销售数量',
            type:'line',
            data:data.seriesData
        }
        
      
    ]
};

if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
function getData(){
	var name = [];
	var count = [];
	$.ajax({
		url:"echarts/findProductSale.action",
		type:'post',
		async : false,
		success:function(result){
			var data = eval('('+ result +')');
			$.each(data,function(idx,obj){
				name.push(obj.name);
				count.push(obj.count);
			});
		}
	});
	return {
		legendData: name,  //右手边的
        seriesData: count  //数据，左边
	}
}
</script>
</body>
</html>