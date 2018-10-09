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
<title>客户更改</title>
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
				<label class="layui-form-label">客户名称</label>
				<div class="layui-input-block">
				<input type="hidden" name="customerId" value="${customer.customerId}">
					<input type="text" name="name" lay-verify="name" value="${customer.name}"
						autocomplete="off" placeholder="请输入客户名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">首要联系人</label>
				<div class="layui-input-block">
					<input type="text" name="contacts" lay-verify="contacts" value="${customer.contacts}"
						placeholder="请输入首要联系人" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">联系电话</label>
					<div class="layui-input-inline">
						<input type="tel" name="tel" lay-verify="tel" value="${customer.tel}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">邮政编码</label>
					<div class="layui-input-inline">
						<input type="text" name="postal" autocomplete="off" value="${customer.postal}"
							lay-verify="postal" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">传真</label>
					<div class="layui-input-inline">
						<input type="text" name="fax" autocomplete="off" value="${customer.fax}"
							lay-verify="fax" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<div class="layui-inline">
					<label class="layui-form-label">客户信用度</label>
					<div class="layui-input-inline">
						<div id="creditId"></div>
						<!-- 信用度默认是1 -->
						<input type="hidden" name="creditId.id" id="credit" value="${customer.creditId.value}"/>
						<%-- <select name="creditId.id" lay-verify="creditId">
							<!-- <option value="">请选择信用度</option> -->
							<option value="${customer.creditId.id}"><c:if test="${customer.creditId.value == 5 }">☆☆☆☆☆</c:if><c:if test="${customer.creditId.value == 4 }">☆☆☆☆</c:if><c:if test="${customer.creditId.value == 3 }">☆☆☆</c:if><c:if test="${customer.creditId.value == 2 }">☆☆</c:if><c:if test="${customer.creditId.value == 1 }">☆</c:if></option>
							<c:forEach items="${credits}" var="credit">
								<option value="${credit.id}"><c:if
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
					<label class="layui-form-label">客户满意度</label>
					<div class="layui-input-inline">
						<div id="satisfiedId"></div>
						<!-- 满意度默认是1 -->
						<input type="hidden" name="satisfiedId.id" id="satisfied" value="${customer.satisfiedId.value}"/>
						<%-- <select name="satisfiedId.id" lay-verify="satisfiedId">
							<!-- <option value="">请选择满意度</option> -->
							<option value="${customer.satisfiedId.id}"><c:if test="${customer.satisfiedId.value == 5 }">☆☆☆☆☆</c:if><c:if test="${customer.satisfiedId.value == 4 }">☆☆☆☆</c:if><c:if test="${customer.satisfiedId.value == 3 }">☆☆☆</c:if><c:if test="${customer.satisfiedId.value == 2 }">☆☆</c:if><c:if test="${customer.satisfiedId.value == 1 }">☆</c:if></option>
							<c:forEach items="${satisfieds}" var="satisfied">
								<option value="${satisfied.id}"><c:if
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
					<label class="layui-form-label">客户来源</label>
					<div class="layui-input-inline">
						<select name="custfromId.id" lay-verify="custfromId">
							<!-- <option value="">请选择客户来源</option> -->
							<option value="${customer.custfromId.id}">${customer.custfromId.value}</option>
							<c:forEach items="${custfroms}" var="custfrom">
								<option value="${custfrom.id}">${custfrom.value}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">客户经理</label>
				<div class="layui-input-inline">
					<select name="user.id" lay-verify="user">
						<!-- <option value="">请选择客户经理</option> -->
						<option value="${customer.user.id}">${customer.user.account}</option>
						<c:forEach items="${users}" var="user">
							<option <c:if test="${user.id == customer.user.id}">selected</c:if> value="${user.id}">${user.account}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"> 客户等级</label>
					<div class="layui-input-inline">
						<select name="custcategoryId.id" lay-verify="custcategoryId">
							<!-- <option value="">请选择客户等级</option> -->
							<option value="${customer.custcategoryId.id}">${customer.custcategoryId.value}</option>
							<c:forEach items="${custcategorys}" var="custcategory">
								<option value="${custcategory.id }">${custcategory.value}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户网址</label>
					<div class="layui-input-inline">
						<input type="text" name="url" lay-verify="urlname" autocomplete="off" value="${customer.url}"
							class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">联系地址</label>
				<div class="layui-input-block">
					<input type="text" name="address" lay-verify="address" value="${customer.address}"
						placeholder="请输入联系地址" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">法人</label>
					<div class="layui-input-inline">
						<input type="text" name="legalPerson" lay-verify="legalPerson" value="${customer.legalPerson}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">营业执照</label>
					<div class="layui-input-inline">
						<input type="text" name="license"  value="${customer.license}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">注册资金</label>
					<div class="layui-input-inline">
						<input type="text" name="fund" lay-verify="required" value="${customer.fund}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">开户银行</label>
					<div class="layui-input-inline">
						<select name="bank" lay-verify="bank">
							<option value="${customer.bank}">${customer.bank}</option>
							<option value="中国工商银行">中国工商银行</option>
							<option value="农业银行">农业银行</option>
							<option value="邮政储蓄所">邮政储蓄所</option>
							<option value="中国建设银行">中国建设银行</option>
							<option value="中国银行">中国银行</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">银行账号</label>
					<div class="layui-input-inline">
						<input type="text" name="bankNumber" lay-verify="bankNumber" value="${customer.bankNumber}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">年营业额</label>
					<div class="layui-input-inline">
						<input type="text" name="turnover" value="${customer.turnover}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">地税登记号</label>
					<div class="layui-input-inline">
						<input type="text" name="stateTax" value="${customer.stateTax}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">国税登记号</label>
					<div class="layui-input-inline">
						<input type="text" name="landTax" value="${customer.landTax}"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">是否转移</label>
					<div class="layui-input-block">
						<c:if test="${customer.changes == 0}">
							<input type="radio" lay-verify="required" name="changes" value="0"
							title="非转移" checked=""> <input type="radio"
							lay-verify="required" name="changes" value="1" title="转移">
						</c:if>
						<c:if test="${customer.changes == 1}">
							<input type="radio" lay-verify="required" name="changes" value="0"
							title="非转移"> <input type="radio"
							lay-verify="required" name="changes" value="1" title="转移" checked="">
						</c:if>
					</div>
				</div>
			</div>

			<div class="page-footer">
				<div class="btn-list">
					<div class="btnlist">
						<button class="layui-btn" lay-submit="" lay-filter="submit2"
							data-url="customers/doedit.action">
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
				value : $('#credit').val() //初始值
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
				value : $('#satisfied').val() //初始值
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
		
		layui.use(['form'], function () {
		    var form = layui.form;
		    //监听提交
		    form.on('submit(submit2)', function (data) {
		        var url=$(this).attr("data-url");
		        var put = $('#form').serialize();
		        console.log(put);
		        $.ajax({
		            url: url,
		            type: "post",
		            data: put,
		            async: false,
		            success: function (R) {
		            	//console.log(R);
		            	R = eval('(' + R + ')');
		            	console.log(R.code);
		                if (R.code == 0) {
		                    $t.Refresh();
		                    //刷新页面
		                    parent.location.href="pages/customer/listCustomer.jsp";
		                    parent.layer.msg('操作成功 !', {icon: 1});
		                } else {
		                    parent.layer.msg(R.msg, {icon: 5});
		                }
		            },
		            error: function () {
		                alert("系统繁忙");
		            }
		        });
		        return false;
		    });
		});
	</script>

</body>
</html>