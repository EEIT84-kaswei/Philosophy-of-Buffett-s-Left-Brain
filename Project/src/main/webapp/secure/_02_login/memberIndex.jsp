<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員專區</title>
</head>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

<div style="margin:2em auto">

<h3 align=center>會員專區</h3>

<table align=center>

<tr>
	<td><a href="<c:url value='/secure/_02_login/personal_stock.jsp'/>">個股管理</a></td>
	<td><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp'/>">投資風險問卷</a></td>
	<td><a href="<c:url value='/secure/_02_login/recommend.jsp'/>">推薦股票</a></td>
<tr>

<td>
</table>
</div>



</div>
</body>
</html>