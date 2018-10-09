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
<title>客户创建</title>
<base href="<%=basePath%>" />
<script src="./statics/libs/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="./statics/css/font-awesome.min.css">
<!--layui ztree样式-->
<link rel="stylesheet" href="./statics/plugins/layui/css/layui.css"
	media="all">
<script src="./statics/plugins/layui/layui.js"></script>
<script src="./statics/plugins/ztree/jquery.ztree.all.min.js"></script>
<link rel="stylesheet"
	href="./statics/plugins/ztree/css/metroStyle/metroStyle.css">
<!--js组件-->
<script src="./common/js/pageGrid.js"></script>
<script src="./common/js/selectTool.js"></script>
<script src="./common/js/radioTool.js"></script>
<script src="./common/js/checkboxTool.js"></script>
<script src="./common/js/treeTool.js"></script>
<script src="./common/js/labelTool.js"></script>
<script src="./common/js/linkSelectTool.js"></script>
<script src="./common/js/uploadTool.js"></script>
<script src="./common/js/HuploadTool.js"></script>
<script src="./common/js/tplTool.js"></script>
<script src="./common/js/editGrid.js"></script>
<!--全局-->
<script src="./common/js/whole/cyLayer.js"></script>
<script src="./common/js/whole/common.js"></script>
<script src="./common/js/whole/setting.js"></script>
<script src="./common/js/whole/utils.js"></script>
<script src="./common/js/whole/monitor.js"></script>
<!--样式-->
<link rel="stylesheet" href="./common/css/cyStyle.css">
<link rel="stylesheet" href="./common/css/cyType.css">
</head>
<body>
	<div class="layui-field-box">
		<form id="form" class="layui-form" action="" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold">客户名称</span></label>
				<div class="layui-input-block">
					<input id="name" type="text" name="name" lay-verify="name"
						autocomplete="off" placeholder="请输入客户名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold">首要联系人</span></label>
				<div class="layui-input-block">
					<input type="text" name="contacts" lay-verify="contacts"
						placeholder="请输入首要联系人" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">联系电话</span></label>
					<div class="layui-input-inline">
						<input type="tel" name="tel" lay-verify="tel"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">邮政编码</span></label>
					<div class="layui-input-inline">
						<input type="text" name="postal" autocomplete="off"
							lay-verify="postal" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">传真</span></label>
					<div class="layui-input-inline">
						<input type="text" name="fax" autocomplete="off"
							lay-verify="fax" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">客户信用度</span></label>
					<div class="layui-input-inline">
						<div id="creditId"></div>
						<!-- 信用度默认是1 -->
						<input type="hidden" name="creditId.id" id="credit" value="1"/>
						<%-- <select name="creditId.id" lay-verify="creditId">
							<option value="">请选择信用度</option>
							<c:forEach items="${credits}" var="credit">
								<option value="${credit.id }"><c:if
										test="${credit.value == 5 }">☆☆☆☆☆</c:if><c:if
										test="${credit.value == 4 }">☆☆☆☆</c:if><c:if
										test="${credit.value == 3 }">☆☆☆</c:if><c:if
										test="${credit.value == 2 }">☆☆</c:if><c:if
										test="${credit.value == 1 }">☆</c:if></option>
							</c:forEach>
						</select> --%>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">客户满意度</span></label>
					<div class="layui-input-inline">
						<div id="satisfiedId"></div>
						<!-- 满意度默认是1 -->
						<input type="hidden" name="satisfiedId.id" id="satisfied" value="1"/>
						<%-- <select name="satisfiedId.id" lay-verify="satisfiedId">
							<option value="">请选择满意度</option>
							<c:forEach items="${satisfieds}" var="satisfied">
								<option <c:if test="${satisfied.category == customer.satisfiedId.category}">selected</c:if> value="${satisfied.id}"><c:if
										test="${satisfied.value == 5 }">☆☆☆☆☆</c:if><c:if
										test="${satisfied.value == 4 }">☆☆☆☆</c:if><c:if
										test="${satisfied.value == 3 }">☆☆☆</c:if><c:if
										test="${satisfied.value == 2 }">☆☆</c:if><c:if
										test="${satisfied.value == 1 }">☆</c:if>
								</option>
							</c:forEach>
						</select> --%>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">客户来源</span></label>
					<div class="layui-input-inline">
						<select name="custfromId.id" lay-verify="custfromId">
							<option value="">请选择客户来源</option>
							<c:forEach items="${custfroms}" var="custfrom">
								<option value="${custfrom.id }">${custfrom.value}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold">客户经理</span></label>
				<div class="layui-input-inline">
					<select name="user.id" lay-verify="user">
						<option value="">请选择客户经理</option>
						<c:forEach items="${users}" var="user">
							<option value="${user.id }">${user.account}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">客户等级</span></label>
					<div class="layui-input-inline">
						<select name="custcategoryId.id" lay-verify="custcategoryId">
							<option value="">请选择客户等级</option>
							<c:forEach items="${custcategorys}" var="custcategory">
								<option value="${custcategory.id }">${custcategory.value}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">客户网址</span></label>
					<div class="layui-input-inline">
						<input type="text" name="url" lay-verify="urlname" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="ft-bold">联系地址</span></label>
				<div class="layui-input-block">
					<input type="text" name="address" lay-verify="address"
						placeholder="请输入联系地址" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">法人</span></label>
					<div class="layui-input-inline">
						<input type="text" name="legalPerson" lay-verify="legalPerson"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">营业执照</span></label>
					<div class="layui-input-inline">
						<input type="text" name="license" 
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">注册资金</span></label>
					<div class="layui-input-inline">
						<input type="text" name="fund" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">开户银行</span></label>
					<div class="layui-input-inline">
						<select name="bank" lay-verify="bank">
							<option value="">请选择客户等级</option>
							<option value="中国工商银行">中国工商银行</option>
							<option value="农业银行">农业银行</option>
							<option value="邮政储蓄所">邮政储蓄所</option>
							<option value="中国建设银行">中国建设银行</option>
							<option value="中国银行">中国银行</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">银行账号</span></label>
					<div class="layui-input-inline">
						<input type="text" name="bankNumber" lay-verify="bankNumber"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">年营业额</span></label>
					<div class="layui-input-inline">
						<input type="text" name="turnover"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">地税登记号</span></label>
					<div class="layui-input-inline">
						<input type="text" name="stateTax"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">国税登记号</span></label>
					<div class="layui-input-inline">
						<input type="text" name="landTax"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><span class="ft-bold">是否转移</span></label>
					<div class="layui-input-block">
						<input type="radio" lay-verify="required" name="changes" value="0"
							title="非转移" checked=""> <input type="radio"
							lay-verify="required" name="changes" value="1" title="转移">
					</div>
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit"
							data-url="customers/doadd.action">
							<i class="fa fa-floppy-o">&nbsp;</i>保存
						</button>
						<button class="layui-btn" onclick="$t.closeWindow();">
							<i class="fa fa-undo">&nbsp;</i>返回
						</button>
					</div>
				</div>
			</div>
		</form>

	</div>

	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;

			form.verify({
				name : function(value) {
					if (value.length == 0) {
						return '客户名称不能为空！';
					}
				},
				contacts : function(value) {
					if (value.length == 0) {
						return '首要联系人不能为空！';
					}
				},
				tel :[/^1\d{10}$/,"请输入正确的手机号"],
				postal : function(value) {
					if (value.length == 0) {
						return '邮编不能为空！';
					}
				},
				fax :function(value) {
					if (value.length == 0) {
						return '传真不能为空！';
					}
				},
				creditId : function(value) {
					if (value.length == 0) {
						return '选择一个信用度呗！';
					}
				},
				satisfiedId : function(value) {
					if (value.length == 0) {
						return '选择一个满意度呗！';
					}
				},
				custfromId : function(value) {
					if (value.length == 0) {
						return '客户来自哪里呢？';
					}
				},
				user : function(value) {
					if (value.length == 0) {
						return '哪个客户经理负责的？！';
					}
				},
				custcategoryId : function(value) {
					if (value.length == 0) {
						return '合作伙伴？战略伙伴？';
					}
				},
				urlname : [/(^#)|(^http(s*):\/\/[^\s]+\.[^\s]+)/,"告诉我客户的链接呗？"],
				address : function(value) {
					if (value.length == 0) {
						return '客户的联系地址呢？';
					}
				},
				legalPerson : [/[\S]+/,"请输入法人！"],
				fund : [/^[+][0-9]+\.[0-9]+$/,"请输入注册基金"],
				bank : function(value) {
					if (value.length == 0) {
						return '请选择开户银行';
					}
				},
				bankNumber : [/^1\d{10}$/,"请输入银行卡号"]
			});
		});
		
//星星评分
		
		//信用度评级
		layui.use([ 'rate' ], function() {
			var rate = layui.rate;
			rate.render({
				elem : '#creditId',
				value : 1 //初始值
				,
				text : false //开启文本
				,/* 
				setText : function(value) { //自定义文本的回调
					var arrs = {
						'1' : '极差',
						'2' : '差',
						'3' : '中等',
						'4' : '好',
						'5' : '极好'
					};
					this.span.text(arrs[value] || (value + "星"));
				}, */
				choose : function(value) {
					$('#credit').val(value);
				}
			});
			
			//满意度评级
			rate.render({
				elem : '#satisfiedId',
				value : 1 //初始值
				,
				text : false //开启文本
				,/* 
				setText : function(value) { //自定义文本的回调
					var arrs = {
						'1' : '极差',
						'2' : '差',
						'3' : '中等',
						'4' : '好',
						'5' : '极好'
					};
					this.span.text(arrs[value] || (value + "星"));
				}, */
				choose : function(value) {
					$('#satisfied').val(value);
				}
			});
		});
	</script>

	<script type="text/javascript">
		function add() {
			var name = $('#name').val();
			var contacts = $('#contacts').val();
			var tel = $('#tel').val();
			var params = $("#addcustomer").serialize();
			//params = decodeURIComponent(params,true);  //解码
			//Msg.success(params);
			//alert(params);
			$.post("customers/doadd.action", params, function(data) {
				var obj = JSON.parse(data);
				if (obj.ret == 1) {
					//console("操作成功！");
					Msg.success("添加成功");
					$t.closeWindow();
					window.location.href = "customers/list.action";
				} else {
					//console("操作失败！");
					Msg.success("添加失败");
					$t.closeWindow();
					window.location.href = "customers/add.action";
				}
			});
		}
	</script>
</body>
</html>