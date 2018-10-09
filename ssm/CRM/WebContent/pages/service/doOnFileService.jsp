<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务归档</title>
<base href="<%=basePath%>" />
<script src="statics/js/jquery.min.js"></script>
<!-- 日期 -->
<link rel="stylesheet" href="statics/css/date.css">
    <style>
        .demonstration {
            display: block;
            color: #8492a6;
            font-size: 14px;
            margin-top: 20px;
        }
    </style>
<!-- 日期end -->
<link rel="stylesheet" href="statics/css/font-awesome.min.css">
<!--layui ztree样式-->
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css"
	media="all">
 <link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<script src="statics/plugins/layui/layui.js"></script>
<script src="statics/plugins/ztree/jquery.ztree.all.min.js"></script>
<link rel="stylesheet"
	href="statics/plugins/ztree/css/metroStyle/metroStyle.css">
<!--js组件-->
<script src="common/js/pageGrid.js"></script>
<script src="common/js/selectTool.js"></script>
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
</head>
<body>
	<div class="layui-field-box">
		<form id="form" class="layui-form"  method="post">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  				<legend>信息显示</legend>
			</fieldset>
			<input type="hidden" value="${service.serviceId}" name="serviceId"/>
			<div class="layui-form-item">
				<label class="layui-form-label">服务状态</label>
				<div class="layui-input-inline">
					<!-- 如果星星为3星以后，设置为归档 -->
					<input type="hidden" id="statusId" name="statusId.id"/>
					<input type="text"  value="${service.statusId.value}"
						class="layui-input" readonly unselectable="on">
				</div>

				<label class="layui-form-label">服务类型</label>
				<div class="layui-input-inline">
					
					<input type="text"  value="${service.servicecategoryId.value}" 
						class="layui-input" readonly unselectable="on">
				</div>
				
				<label class="layui-form-label">服务方式</label>
				<div class="layui-input-inline">
					
					<input type="text" value="${service.serviceStyle.value}"
						class="layui-input" readonly unselectable="on">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label">概要</label>
				<div class="layui-input-block">
					
					<input type="text"  value="${service.summary}"  
						class="layui-input" readonly unselectable="on">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">客户</label>
				<div class="layui-input-block">
					
					<input type="text"  value="${service.customer.name}"
						class="layui-input" readonly unselectable="on">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">服务请求</label>
				<div class="layui-input-block">
					
					<input type="text"  value="${service.request}"  
						class="layui-input" readonly unselectable="on">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" >创建人</label>
				<div class="layui-input-inline">
					
					<input type="text"  value="${service.createId.account}" class="layui-input"
						 readonly unselectable="on">
				</div>
			<div id="button">
				<label class="layui-form-label">创建日期</label>
				<div class="layui-input-inline">
					<input type="text" id="createDate"   value="${service.createDate}" class="layui-input"
						 readonly unselectable="on">
				</div>
			</div>
			
			<label class="layui-form-label" >分配给</label>
				<div class="layui-input-inline">
					
					<input type="text"  value="${service.createId.account}" class="layui-input" readonly unselectable="on">
			</div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">服务处理</label>
				<div class="layui-input-block">
					<input type="text"  value="${service.dealContent}" class="layui-input" readonly unselectable="on">			
				</div>
			</div>
			
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
	     		 <label class="layui-form-label">处理时间</label>
	      			<div class="layui-input-inline">
	       		 		<input type="text" id="dealDate" value="${service.dealDate}" class="layui-input" readonly unselectable="on">
	     			 </div>
	   			 </div>
	   			
    		</div>
   			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  				<legend>信息录入</legend>
			</fieldset>
			<div class="layui-form-item layui-form-text">
			 	<div class="layui-inline">
	     		 <label class="layui-form-label">满意度</label>
	     		 	<div class="layui-input-inline">
	     		 		 <div id="evaluateId"></div>
	     		 	</div>
	   			 </div>
	   			 <!-- 满意度,由星星选择决定,默认为5，与页面显示一样 -->
				<input type="hidden" name="evaluateId.id" id="evaluate" value="5"/>
	   		</div>
	   		<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">服务结果</label>
				<div class="layui-input-block">
					<textarea lay-verify="required" name="result" placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
				
			</div>
		<div class="page-footer">
            <div class="btn-list">
                <div class="btnlist">
                    
                    <button class="layui-btn" lay-submit="" lay-filter="submit" data-url="service/editService.action"  ><i class="fa fa-floppy-o">&nbsp;</i>保存</button>
                    <button class="layui-btn" onclick="$t.closeWindow();"><i class="fa fa-undo">&nbsp;</i>返回</button>
                </div>
            </div>
        </div>
		</form>

	</div>
	
	<!-- 先引入 Vue -->
<script src="statics/js/vue.js"></script>
<!-- 引入组件库 -->
<script src="statics/js/dateindex.js"></script>
<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>
<script>
layui.use(['rate'], function(){
	  var rate = layui.rate;
		 rate.render({
	     elem: '#evaluateId'
	     ,value: 5 //初始值
	     ,text: true //开启文本
	     ,setText: function(value){
	    	    var arrs = {
	    	      '1': '极差'
	    	      ,'2': '差'
	    	      ,'3': '中等'
	    	      ,'4': '好'
	    	      ,'5': '极好'
	    	    };
	    	    this.span.text(arrs[value] || ( value + "星"));
	    	  }
	     ,choose: function(value){
	    	 //设置满意度的id 格式为 星星等级 + 0.因为在wordbook中满意度刚好为前五个，否为0改为其他
	    	    $('#evaluate').val(value);
	    	    if(value >= 3){
	    	    	$('#statusId').val('74');//归档模式
	    	    }else{
	    	    	$('#statusId').val('72');//处理模式
	    	    }
	    	  }
	  });
});
    new Vue({
        el: '#button',
        data: {
            value1: '',
            value2: ''
        }
    });
    
    /**
     * 
     * 获取当前时间
     */
    function p(s) {
        return s < 10 ? '0' + s: s;
    }
	$(function(){
		
		$('#createDate').val(getDate($('#createDate').val()));
		$('#dealDate').val(getDate(''));
	});
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