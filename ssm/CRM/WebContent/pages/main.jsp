<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="statics/css/style.css" rel="stylesheet">
<link href="statics/css/bootstrap-wysihtml5.css" rel="stylesheet">
<link href="statics/css/main.css" rel="stylesheet">
<script src="statics/libs/jquery-1.7.2.js"></script>
<script src="statics/plugins/echarts/echarts.js"></script>
<title>主页</title>
</head>
<body>
	<div class="dashboard-wrapper">
		<div class="left-sidebar">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget">
						<div class="widget-header">
							<div class="title">
								快速 移动<span class="mini-title"> 标题
									栏目 </span>
							</div>
							<span class="tools"> <a class="fs1" aria-hidden="true"
								data-icon=""></a>
							</span>
						</div>
						<div class="widget-body">
							<div class="row-fluid">
								<div class="metro-nav">
									<shiro:hasAnyRoles name="客户经理,销售经理,系统管理员">
										<div class="metro-nav-block nav-block-yellow current">
											<a class="cy-page" href="javascript:;"
												data-url="pages/sale/salelist3.jsp" title="销售机会管理">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">销售机会管理</div>
											</a>
										</div>
									</shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="客户经理,系统管理员">
										<div class="metro-nav-block nav-block-orange">
											<a class="cy-page" href="javascript:;"
												data-url="pages/sale/develop_mysale.jsp" title="机会开发计划">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">机会开发计划</div>
											</a>
										</div>
									</shiro:hasAnyRoles>

									<shiro:hasAnyRoles name="客户经理,系统管理员">
										<div class="metro-nav-block nav-block-blue double">
											<a class="cy-page" href="javascript:;"
												data-url="pages/customer/listCustomer.jsp" title="客户信息管理">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">客户信息管理</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a class="cy-page" href="javascript:;"
												data-url="pages/customer/listLoss.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">客户流失管理</div>
											</a>
										</div>
									</shiro:hasAnyRoles>

									<shiro:hasAnyRoles name="客户经理,销售经理,系统管理员">
										<div class="metro-nav-block nav-block-red">
											<a class="cy-page" href="javascript:;"
												data-url="pages/service/listService.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">服务查看</div>
											</a>
										</div>
									</shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="客户经理,系统管理员">
										<div class="metro-nav-block nav-block-red double">
											<a class="cy-page" href="javascript:;"
												data-url="pages/service/dealService.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">服务处理</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-green">
											<a class="cy-page" href="javascript:;"
												data-url="pages/service/onFileService.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">服务归档</div>
											</a>
										</div>
									</shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="高管,销售经理,客户经理,系统管理员">
										<div class="metro-nav-block nav-block-orange">
											<a class="cy-page" href="javascript:;"
												data-url="pages/echarts/listEcharts.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">报表</div>
											</a>
										</div>
									</shiro:hasAnyRoles>
									<shiro:hasAnyRoles name="系统管理员">
										<div class="metro-nav-block nav-block-blue">
											<a class="cy-page" href="javascript:;"
												data-url="pages/wordbook/wordbooklist.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">字典列表</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-yellow">
											<a class="cy-page" href="javascript:;"
												data-url="pages/wordbook/catelist.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">字典分类</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-blue">
											<a class="cy-page" href="javascript:;"
												data-url="pages/log/listLog.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">日志查看</div>
											</a>
										</div>
										<div class="metro-nav-block nav-block-yellow">
											<a class="cy-page" href="javascript:;"
												data-url="pages/log/listLog.jsp">
												<div class="fs1" aria-hidden="true" data-icon=""></div>
												<div class="brand">角色分配</div>
											</a>
										</div>
									</shiro:hasAnyRoles>


								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row-fluid">
				<div id="main" style="width: 1200px; height: 600px;"></div>
			</div>
		</div>

		<div class="right-sidebar">
			<div class="wrapper">
				<div id="scrollbar">
					<div class="scrollbar">
						<div class="track">
							<div class="thumb">
								<div class="end"></div>
							</div>
						</div>
					</div>
					<div class="viewport">
						<div class="overview">
							<div class="featured-articles-container">
								<h5 class="heading">欢迎使用薯仔CRM系统</h5>
								<div class="articles">
									<a href="javascript:;"> <span class="label-bullet">
											&nbsp; </span> 新的一天新的工作
									</a> <a href="javascript:;"> <span class="label-bullet">
											&nbsp; </span> 任务分配很简单
									</a> <a href="javascript:;"> <span class="label-bullet">
											&nbsp; </span> 快速浏览结果
									</a> <a href="#"> <span class="label-bullet"> &nbsp; </span>
										支持大量数据插入
									</a> <a href="javascript:;"> <span class="label-bullet">
											&nbsp; </span> 界面美化得体
									</a> <a href="javascript:;"> <span class="label-bullet">
											&nbsp; </span> 快速解决工作需求
									</a>


								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据

		var option = {
			title : {
				text : '登陆统计'
			},
			color : [ '#3398DB' ],
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				data : [ '星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期七' ],
				axisTick : {
					alignWithLabel : true
				}
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [ {
				name : '当前数量',
				type : 'bar',
				barWidth : '60%',
				data : [ 8459, 4845, 5486, 8974, 6584, 1536, 3654 ]
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
		
		
		
			$('.cy-page').click(function(){
				  var $this = $(this);
			        var name = $this.text() || $this.attr("title");
			        var url = unescape($this.attr("data-url")) || "";
			        //判断该页面是否已存在
			        var navTab = window.parent.document.getElementById("navTab");
			        var main = window.parent.document.getElementById("main");
			        if ($(navTab).find("li[data-url='" + url + "']").length === 0) {
			            var index = Loading.open(1,false);
			            //如果不存在
			            $(navTab).find("li").removeClass("layui-this");
			            //新增tab页
			            var _li = '<li class="layui-this" data-url="' + url + '">'+name+  '</li>';
			            
			            $(navTab).find("ul").append(_li);
						console.log( "xx" + $("#navTab").attr('lay-allowclose'));
			            $(main).find("iframe").removeClass("cy-show");
			            //打开iframe
			            var iframe = $('<iframe class="cy-show" scrolling="yes" frameborder="0" ></iframe>');
			            $(iframe).attr("src", url);
			            $(main).append(iframe);
			            $(iframe).load(function() {
			                Loading.close(index);
			            });
			            //tab过多时
			            var _lis = $(".layui-tab-title").find("li");
			            var n = 0;
			            for (var i = 0; i < _lis.length; i++) {
			                n += $(_lis[i]).width()+15;
			            }

			            var _width = $(".layui-body").width();
			            if (n > parseInt(_width)-50) {
			                $(".layui-tab-title").css("left", $(".layui-body").width()-n-70);
			            }


			        }else{
			            $(navTab).find("li").removeClass("layui-this");
			            $(navTab).find("li[data-url='" + url + "']").addClass("layui-this");
			            $(main).find("iframe").removeClass("cy-show");
			            $(main).find("iframe[src='"+url+"']").addClass("cy-show");
			        }

			        layui.use('element', function(){
			            var element = layui.element;
			            element.render();

			        });
			});
			
		
	</script>
	<script src="statics/libs/jquery-1.10.2.min.js"></script>
	
	<script src="statics/plugins/layui/layui.js"></script>
	<script src="statics/plugins/layer/layer.js"></script>
	<script src="common/js/whole/utils.js"></script>
	<script src="common/js/whole/cyLayer.js"></script>
	

</body>
</html>