<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update News</title>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
#title {
	width: 500px;
	height: 50px;
}

#context {
	width: 500px;
	height: 500px;
}
</style>
</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>

	<div class="container">
		<% response.setCharacterEncoding("UTF-8"); %>
		
		<form action="<c:url value="/pages/_05_newsArticle/news.do"/>" method="post">
			<input type="hidden" name="updateNo" value="${select.nno}">
			<label>Title:</label>
			<textarea type="text" id="title" name="title" required autofocus>${select.ntitle}</textarea>
			<br /> 
			<label>Context:</label>
			<textarea id="context" name="context" rows="50" cols="100" required autofocus>${select.ncontext}</textarea>
			<script>CKEDITOR.replace( 'context', {width:800});</script>
			<br />
			<font size="-1" color="#FF0000">${error.content}</font>
			<br />
			<input type="submit" name="prodaction" value="送出">
		</form>
		
	</div>

</body>
</html>
