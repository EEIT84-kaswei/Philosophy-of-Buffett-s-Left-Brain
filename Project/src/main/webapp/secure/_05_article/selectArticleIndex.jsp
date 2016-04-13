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

<body style="margin: 0em 3em">
	<div class="container">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>


		<div
			style="height: 20em; margin: 2em auto; padding: 2em">


			<!-- 表格開始 -->



			<form action="<c:url value="/view/article.controller" >
			
			
			
				<c:param name="ano" value="${param.ano}" />
						<c:param name="aname" value="${param.aname}" />
						<c:param name="atitle" value="${param.atitle}" />
						<c:param name="acontext" value="${param.acontext}" /></c:url>"
				method="post">
				
				
				<h2 style="text-align:center;color:purple">${param.atitle}</h2>
				<p style="text-align:center">${param.aname}</p>
				<p style="text-align:center">${param.atime}</p>
				<br>
				<div style="width:500px;margin:0 auto">
				<p>${param.acontext}</p>
				</div>
				<div align=center>
				<a href="${path}"><input type="button"
									name="prodaction" value="修改"></a>
				<input type="submit" name="prodaction" value="刪除">
				
				</div>
				
<!-- 				<table style="border: 2px #FFAC55 solid; padding: 5px;" rules="all"
					cellpadding='5' align=center>
					
						<tr>
							<th>發表日期</th>
							<th>作者</th>
						</tr>
						<tr>
							<td>${param.atime}</td>
							<td>${param.aname}</td>
						</tr>
						<tr>
							<th colspan="2">文章標題</th>
						</tr>
						<tr>
							<td colspan="2">${param.atitle}</td>
						</tr>
					
						<tr>
							<th colspan="2">文章內容</th>
						</tr>
						<tr>
							<td colspan="2">${param.acontext}</td>
						</tr>
						<c:url value="/secure/_05_article/newArticleIndex.jsp" var="path" scope="page">
							<c:param name="ano" value="${param.ano}" />
							<c:param name="aname" value="${param.aname}" />
							<c:param name="atitle" value="${param.atitle}" />
							<c:param name="acontext" value="${param.acontext}" />
						</c:url>
						<tr>
							<td><a href="${path}"><input type="button"
									name="prodaction" value="修改"></a></td>
							<td><input type="submit" name="prodaction" value="刪除"></td>
						</tr>
				</table>
				
 -->
			</form>
		</div>

	</div>

</body>
</html>