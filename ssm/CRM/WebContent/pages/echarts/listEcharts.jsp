<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<base href="<%=basePath%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看图表</title>
<link rel="stylesheet" href="statics/css/bootstrap.css">
<script src="statics/libs/jquery-1.7.2.js"></script>
<script src="statics/plugins/layer/layer.js"></script>
<script src="statics/plugins/layui/layui.js"></script>
<!--全局-->
<script src="common/js/whole/cyLayer.js"></script>
<script src="common/js/whole/common.js"></script>
<script src="common/js/whole/setting.js"></script>
<script src="common/js/whole/utils.js"></script>
<script src="common/js/whole/monitor.js"></script>

<style type="text/css">
	.poiont{
		cursor: pointer;
	}
	.bk{
		
		background:#e2e2e2;
	}
	.ml{
		margin: 15px;
	}
</style>
</head>
<body>
	<div class="container-fluid">

		<section class="col-xs-12 newsletters">
		<div class="row">
			<!-- demo start -->
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 bk ml"
				id="list-box-64" data-tags="business" 
				>
				<div class="infobox text-center">
					<div class="front poiont" onclick="Open('客户贡献度','pages/echarts/custAverage.jsp','1000px','600px')">
						<div>
								<figure class="col-lg-5 col-md-5 col-sm-12 col-xs-12 img-circle">
								<span>
									<a href="javascript:;">客户贡献度</a>
								</span>
						</div>
								<img alt="The latest deals, news, and firms in venture capital"
									src="statics/images/my/custAverage.jpg" style="width: 270px;height: 207px;"></figure>
									<div class="bk"></div>
					</div>
				</div>
			</div>
			<!-- demo end -->
			
			<!-- demo start -->
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 bk ml"
				id="list-box-64" data-tags="business" 
				>
				<div class="infobox text-center">
					<div class="front poiont " onclick="Open('客户分类','pages/echarts/custCategory.jsp','800px','500px')">
								
							<div>
								<figure class="col-lg-5 col-md-5 col-sm-12 col-xs-12 img-circle">
								<span>
									<a href="javascript:;">客户分类</a>
								</span>
							</div>
								<img alt="The latest deals, news, and firms in venture capital"
									src="statics/images/my/custCategory.jpg" style="width: 270px;height: 207px;"></figure>
					</div>
				</div>
			</div>
			<!-- demo end -->
			
			<!-- demo start -->
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 bk ml"
				id="list-box-64" data-tags="business" 
				>
				<div class="infobox text-center">
					<div class="front poiont " onclick="Open('产品销售','pages/echarts/productSale.jsp','940px','500px')">
								
							<div>
								<figure class="col-lg-5 col-md-5 col-sm-12 col-xs-12 img-circle">
								<span>
									<a href="javascript:;">产品销售</a>
								</span>
							</div>
								<img alt="The latest deals, news, and firms in venture capital"
									src="statics/images/my/saleSource.png" style="width: 270px;height: 207px;"></figure>
					</div>
				</div>
			</div>
			<!-- demo end -->
			<!-- demo start -->
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 bk ml"
				id="list-box-64" data-tags="business" 
				>
				<div class="infobox text-center">
					<div class="front poiont" onclick="Open('客户贡献度','pages/echarts/custAverage.jsp','1000px','600px')">
						<div>
								<figure class="col-lg-5 col-md-5 col-sm-12 col-xs-12 img-circle">
								<span>
									<a href="javascript:;">客户贡献度</a>
								</span>
						</div>
								<img alt="The latest deals, news, and firms in venture capital"
									src="statics/images/my/custAverage.jpg" style="width: 270px;height: 207px;"></figure>
									<div class="bk"></div>
					</div>
				</div>
			</div>
			<!-- demo end -->
			<!-- demo start -->
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 bk ml"
				id="list-box-64" data-tags="business" 
				>
				<div class="infobox text-center">
					<div class="front poiont" onclick="Open('客户贡献度','pages/echarts/custAverage.jsp','1000px','600px')">
						<div>
								<figure class="col-lg-5 col-md-5 col-sm-12 col-xs-12 img-circle">
								<span>
									<a href="javascript:;">客户贡献度</a>
								</span>
						</div>
								<img alt="The latest deals, news, and firms in venture capital"
									src="statics/images/my/custAverage.jpg" style="width: 270px;height: 207px;"></figure>
									<div class="bk"></div>
					</div>
				</div>
			</div>
			<!-- demo end -->
			<!-- demo start -->
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 bk ml"
				id="list-box-64" data-tags="business" 
				>
				<div class="infobox text-center">
					<div class="front poiont" onclick="Open('客户贡献度','pages/echarts/custAverage.jsp','1000px','600px')">
						<div>
								<figure class="col-lg-5 col-md-5 col-sm-12 col-xs-12 img-circle">
								<span>
									<a href="javascript:;">客户贡献度</a>
								</span>
						</div>
								<img alt="The latest deals, news, and firms in venture capital"
									src="statics/images/my/custAverage.jpg" style="width: 270px;height: 207px;"></figure>
									<div class="bk"></div>
					</div>
				</div>
			</div>
			<!-- demo end -->
		</div>
		
	
		</section>
	</div>
<script type="text/javascript">
function Open(name,url,width,height){		
	parent.layer.open({
		type: 2,
		title: name,
		shadeClose: false,
		shade: [0.5, '#000'],
		maxmin: true, //开启最大化最小化按钮
		area: [width, height],
		content: url
		
	});
 }
</script>
</body>
</html>