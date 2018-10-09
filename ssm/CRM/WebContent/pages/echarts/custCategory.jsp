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
 <div id="custCategory" style="width:700px;height:400px;"></div>
<script type="text/javascript">

var dom = document.getElementById("custCategory");
var myChart = echarts.init(dom);
var app = {};
option = null;
var data = genData();

option = {
    title : {
        text: '客户类别统计',
        subtext: '',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
        
    },
    toolbox: {
        feature: {
           /*  dataView: {show: true, readOnly: false},
            restore: {show: true}, */   //数据可视化，数据刷新
            saveAsImage: {show: true}     //保存图片
        },
   	 right:5
    },
    legend: {
        type: 'scroll',
        orient: 'vertical',
        right: 40,
        top: 20,
        bottom: 20,
        data: data.legendData,

        selected: data.selected
    },
    series : [
        {
            name: '分类名称',
            type: 'pie',
            radius : '53%',
            center: ['40%', '50%'],
            selectedMode: 'single',//点击是否会弹出
            selectedOffset: 20,
            data: data.seriesData,
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};




function genData(count) {
    var legendData = [];
    var seriesData = [];
    var selected = [];
    $.ajax({
    	url:'echarts/CountCusCagtegory.action',
    	type:'post',
    	async : false,
    	success:function(data){
    		
    		var result = '{ "list" : ' + '[' + data +']}';
    		result = eval('('+result+')');
    		
    		var total = 0;
    		//计算总数
    		$.each(result.list,function(idx,obj){
    			total += parseInt(obj.value);
    			
    		});//each	
    		$.each(result.list,function(idx,obj){
    			
    			legendData.push(obj.name);
    			seriesData.push({
    				name:obj.name,
    				value:obj.value
    			});
    			
    		});//each	
    		
    	}//success
    });//ajax

    return {
        legendData: legendData,  //右手边的
        seriesData: seriesData,  //数据，左边
        selected: selected
    };

}
;

if (option && typeof option === "object") {
    myChart.setOption(option, true);

}
       </script>
</body>
</html>