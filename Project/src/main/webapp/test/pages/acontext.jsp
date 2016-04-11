<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Acontext</title>
</head>
<body>
<form action="<c:url value="/view/article.controller" ><c:param name="ano" value="${param.ano}" />
						<c:param name="aname" value="${param.aname}" />
						<c:param name="atitle" value="${param.atitle}" />
						<c:param name="acontext" value="${param.acontext}" /></c:url>" method="post">
	<table>
		<thead>
			<tr>
				<th>發表日期</th>
				<th>作者</th>
			</tr>
			<tr>
				<td>${param.atime}</td>
				<td>${param.aname}</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>文章標題</th>
			</tr>
			<tr>
				<td>${param.atitle}</td>
			</tr>
		</tbody>
	</table>
	<table>
		<thead>
			<tr>
				<th>文章內容</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${param.acontext}</td>
			</tr>
			<c:url value="/test/pages/newAcontext.jsp" var="path" scope="page">
						<c:param name="ano" value="${param.ano}" />
						<c:param name="aname" value="${param.aname}" />
						<c:param name="atitle" value="${param.atitle}" />
						<c:param name="acontext" value="${param.acontext}" />
					</c:url>
			<tr>
			<td><a href="${path}"><input type="button" name="prodaction" value="修改"></a></td>
			<td><input type="submit" name="prodaction" value="刪除"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>