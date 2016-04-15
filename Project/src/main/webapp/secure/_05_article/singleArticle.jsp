<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>專欄文章</title>
<style type="text/css">
/* table tr:hover { */
/* 	background-color:#77FFCC; */
/* 	color: #BD63FF; */
/* } */
</style>


</head>


<body>
	

		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />


		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>


		<div
			style="height: 20em; margin: 2em auto; padding: 2em">


			<!-- 表格開始 -->


			
				<form action="<c:url value="/pages/article.controller">
					    <c:param name="ano" value="${singleArticle.ano}" /></c:url>" method="post">

				
				<h2 style="text-align:center;color:purple">${singleArticle.atitle}</h2>
				<p style="text-align:center">${singleArticle.aname}</p>
				<p style="text-align:center">${singleArticle.atime}</p>
				<br>
				<div style="width:500px;margin:0 auto">
				<p>${singleArticle.acontext}</p>
				</div>
				<div align=center>
				<input type="submit" name="prodaction" value="修改">
				<input type="submit" name="prodaction" value="刪除" onclick="if(confirm('您確定刪除此留言嗎?')) return true;else return false">
				
				
				</div>
				</form>

		</div>



</body>
</html>
