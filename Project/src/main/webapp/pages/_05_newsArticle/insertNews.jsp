<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update News</title>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>


</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>
	<div style="height: 50em; margin: 2em auto; padding: 0em;" class="table-responsive">

		<% response.setCharacterEncoding("UTF-8"); %>
		
		<form action="<c:url value="/pages/_05_newsArticle/news.do"/>" method="post">
			<table style="border: 2px #FFAC55 solid; padding: 5px; background-color:rgba(255, 255, 255, 0.5)" rules="all" cellpadding='5' align="center">
				
				<tr>
					<td>新聞標題:</td>
					<td>
						<input type="text" id="title" name="title" required autofocus size="45"></input>
				   <%-- <span class="error">${error.atitle}</span> --%>
					</td>
				</tr>
				<tr>
					<td>新聞內容 :</td>
					<td><textarea id="context" name="context" rows="30" cols="60" required autofocus></textarea>
						<script>
							CKEDITOR.replace('context', {});
						</script> 
						<br>
						<span><font size="-1" color="#FF0000">${error.content}</font></span>
					</td>
				</tr>

			</table>
			<input type="submit" name="prodaction" value="送出">
		</form>
		
	</div>

</body>
</html>