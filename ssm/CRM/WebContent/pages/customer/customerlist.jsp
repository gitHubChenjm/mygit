<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  //使用base标签解决网站的相对路径问题
  //网站的上下路径
  String basePath = request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顾客列表页面</title>
<base href="<%=basePath %>">
<style type="text/css">
* {
	font-size: 18px;
}
</style>
</head>
<body>

	<table align="center">
		<tr style="background-color: #0000FF;">
			<td colspan="8" style="font-size: 32px; text-align: center;">顾客列表页面</td>
		</tr>

		<tr style="background-color: #8800FF;">
			<td>用户名称</td>
			<td>首要联系人</td>
			<td>电话</td>
			<td>客户经理</td>
			<td>客户等级</td>
			<td>地址</td>
			<td>客户来源</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list}" var="customer" varStatus="idx">
			<c:if test="${idx.index mod 2 ==0}">
				<tr>
			</c:if>
			<c:if test="${idx.index mod 2 ==1}">
				<tr style="background-color: #00eeee;">
			</c:if>

			<td>${customer.name}</td>
			<td>${customer.contacts}</td>
			<td>${customer.tel}</td>
			<td>${customer.user.account}</td>
			<td>${customer.custcategoryId.value}</td>
			<td>${customer.address}</td>
			<td>${customer.custfromId.value}</td>
			<td><a href="pages/edit.action?isbn=${product.isbn}">修改</a> <a
				href="javascript:deleteBook('${product.isbn}');">删除</a></td>
			</tr>
		</c:forEach>
	</table>

	<script type="text/javascript">
  
    <%-- function deleteBook(isbn){
    	if(confirm("确认删除？误删端午节要加班！")){
    		location.href="<%=basePath%>pages/del.action?isbn="+isbn;
    	}
    } --%>
  </script>
</body>
</html>