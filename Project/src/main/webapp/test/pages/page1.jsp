<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>page1</title>
</head>
<body>

<h3>Welcome ${user.email}</h3>
<h3>Article Table</h3>

<form action="<c:url value="/view/article.controller" />" method="post">
<table>
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Select">
		</td>
	</tr>
</table>
</form>
</body>
</html>