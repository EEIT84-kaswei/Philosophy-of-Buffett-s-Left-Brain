<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>new Acontext</title>
</head>
<body>

<h3>Welcome ${user.email}</h3>
<h3>new Acontext</h3>

<form action="<c:url value="/view/article.controller" />" method="post">
<table>
	<tr>
		<td>作家名稱 : </td>
		<td><input type="text" name="aname" value="${param.aname}"></td>
		<td><span class="error">${error.id}</span></td>
	</tr>
	<tr>
		<td>文章標題: </td>
		<td><input type="text" name="atitle" value="${param.atitle}"></td>
		<td></td>
	</tr>

	<tr>
		<td>文章內文 : </td>
		<td><textarea name="acontext" cols="60" rows="30" >${param.acontext}</textarea></td>
		<td><span class="error">${error.price}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Insert">
			<div style="display: none;"><input type="text" name="ano" value="${param.ano}" ></div>
		</td>
		<td>
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>
</form>
</body>
</html>