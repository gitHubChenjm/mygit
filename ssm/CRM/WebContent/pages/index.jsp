<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@  taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath() + "/";  
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>薯仔后台管理系统</title>   

<base href="<%=basePath%>"/>

<link rel="shortcut icon" type="image/x-icon"
	href="statics/img/favicon.ico" media="screen" />
<link rel="stylesheet" href="statics/plugins/layui/css/layui.css">
<link rel="stylesheet"
	href="statics/plugins/layer/skin/default/layer.css">
<link rel="stylesheet" href="statics/css/font-awesome.min.css">
<link rel="stylesheet" href="statics/css/index.css">
<link rel="stylesheet" href="common/css/cyStyle.css">
<link rel="stylesheet"
	href="statics/plugins/ContextJS/css/context.standalone.green.css">

</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">客户后台管理系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<!--  <li class="layui-nav-item layui-this"><a href="javascript:createMenu('./statics/json/layuiMenu.json');">layui组件</a>
            </li> -->
				
			</ul>
			<ul class="layui-nav layui-layout-right">
				<!-- <li class="layui-nav-item"><a href="javascript:reward();">捐赠作者</a>
				</li> -->
				<li class="layui-nav-item"><a href="javascript:lockScreen();">
						<i class="fa fa-lock"></i>锁屏</a></li>
			<!-- 	<li class="layui-nav-item"><a href="javascript:;">通知<span
						class="layui-badge">9</span></a></li> -->
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="${user.head}" class="layui-nav-img">
						<c:out value="${user.account}"></c:out>
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;" class="cy-page"
								 data-url="pages/userInfo.jsp" >基本资料</a><!---->
						</dd>
						<dd>
							<a href="javascript:;" class="cy-page"
								data-url="findPW.jsp">修改密码</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a
					href="javascript:;window.location.href='./quit.action'">退了</a></li>
			</ul>
		</div>
		<div class="toggle-collapse"></div>
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item"><a class="" href="javascript:;"
						title="销售管理"><i class="fa fa-tachometer"></i>销售管理<span
							class="layui-nav-more"></span></a>
					<dl class="layui-nav-child">
							<shiro:hasAnyRoles name="客户经理,销售经理">
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/sale/salelist3.jsp" title="销售机会管理">销售机会管理</a>
								</dd>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="客户经理,系统管理员">
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/sale/develop_mysale.jsp" title="机会开发计划">客户开发计划</a>
								</dd>
							</shiro:hasAnyRoles>
						</dl></li>
					<li class="layui-nav-item"><a class="" href="javascript:;"
						title="客户管理"><i class="fa fa-window-restore"></i>客户管理<span
							class="layui-nav-more"></span></a>
					<dl class="layui-nav-child">
							<shiro:hasAnyRoles name="客户经理">
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/customer/listCustomer.jsp" title="客户信息管理">客户信息管理</a>
								</dd>
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/customer/listLoss.jsp" title="客户流失管理">客户流失管理</a>
								</dd>
							</shiro:hasAnyRoles>
							<!-- <dd>
								<a class="cy-page" href="javascript:;"
									data-url="frontframe/layer/alert.html" title="alert弹窗">alert弹窗</a>
							</dd>
							<dd>
								<a class="cy-page" href="javascript:;"
									data-url="frontframe/layer/msg.html" title="msg短信息">msg短信息</a>
							</dd>
							<dd>
								<a class="cy-page" href="javascript:;"
									data-url="frontframe/layer/tips.html" title="tips吸附">tips吸附</a>
							</dd>
							<dd>
								<a class="cy-page" href="javascript:;"
									data-url="frontframe/layer/load.html" title="load加载层">load加载层</a>
							</dd>
							<dd>
								<a class="cy-page" href="javascript:;"
									data-url="frontframe/layer/page.html" title="弹出页面">弹出页面</a>
							</dd> -->
						</dl></li>
					<li class="layui-nav-item"><a class="" href="javascript:;"
						title="服务管理"><i class="fa fa-css3"></i>服务管理<span
							class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<shiro:hasAnyRoles name="客户经理,销售经理">
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/service/listService.jsp" title="服务查看">服务查看</a>
								</dd>
							</shiro:hasAnyRoles>
							<shiro:hasAnyRoles name="客户经理">
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/service/dealService.jsp" title="服务处理">服务处理</a>
								</dd>
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/service/onFileService.jsp" title="服务归档">服务归档</a>
								</dd>
							</shiro:hasAnyRoles>
							
						</dl></li>
					<shiro:hasAnyRoles name="高管,销售经理,客户经理,系统管理员">
					<li class="layui-nav-item"><a class="" href="javascript:;"
						title="统计报表"><i class="fa fa-bar-chart"></i>统计报表<span
							class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/echarts/listEcharts.jsp" title="ECharts">报表</a>
								</dd>
							
						</dl>
					</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="系统管理员">
						<li class="layui-nav-item"><a class="" href="javascript:;"
							title="基础数据"><i class="fa fa-pie-chart"></i>基础数据<span
								class="layui-nav-more"></span></a>
							<dl class="layui-nav-child">
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/wordbook/wordbooklist.jsp" title="字典列表">基础数据管理</a>
								</dd>
								<dd>
									<a class="cy-page" href="javascript:;"
										data-url="pages/wordbook/catelist.jsp" title="字典分类">数据分类管理</a>
								</dd>
							</dl>
						</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="系统管理员">
						<li class="layui-nav-item"><a class="" href="javascript:;"
						title="日志管理"><i class="fa fa-tripadvisor"> </i>日志管理<span
							class="layui-nav-more"></span></a>
						<dl class="layui-nav-child">
							<dd>
								<a  class="cy-page" href="javascript:;"
									data-url="pages/log/listLog.jsp" title="日志查看">日志查看</a>
							</dd>	
						</dl>
					</li>
					</shiro:hasAnyRoles>
					<shiro:hasAnyRoles name="系统管理员">
					<li class="layui-nav-item"><a class="" href="javascript:;"
						title="用户权限"><i class="layui-icon layui-icon-user"> </i>用户权限<span
							class="layui-nav-more"></span></a>
					<dl class="layui-nav-child">
							<dd>
								<a  class="cy-page" href="javascript:;"
									data-url="pages/authority/authorityChange.jsp" title="角色分配">角色分配</a>
							</dd>	
						</dl></li>
					</shiro:hasAnyRoles>
					
					
					<span class="layui-nav-bar"></span>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 1px;">
				<div id="navTab" class="layui-tab layui-tab-brief"
					lay-allowClose="true" lay-filter="tabs">
					<div class="layui-tab-left">
						<i class="layui-icon">&#xe65a;</i>
					</div>
					<ul class="layui-tab-title" data-url="pages/main.jsp">
						<li class="layui-this main-tab" data-url="pages/main.jsp">我的主页</li>

					</ul>
					<div class="layui-tab-right">
						<i class="layui-icon">&#xe65b;</i>
					</div>

				</div>

			</div>


			<div id="main">
				<iframe scrolling="yes" frameborder="0" class="cy-show"
					src="pages/main.jsp"></iframe>
			</div>
		</div>

 		<div class="layui-footer">
			<!-- 底部固定区域 -->
			@shuzai.crm.com
		</div>
	</div>

	<script src="statics/libs/jquery-1.10.2.min.js"></script>
	<script src="statics/plugins/ContextJS/js/context.js"></script>
	<script src="statics/plugins/layui/layui.js"></script>
	<script src="statics/plugins/layer/layer.js"></script>
	<script src="common/js/whole/utils.js"></script>
	<script src="common/js/whole/cyLayer.js"></script>
	<script src="statics/js/navTab.js"></script>
	<script src="statics/js/index.js"></script>
	
</body>
</html>