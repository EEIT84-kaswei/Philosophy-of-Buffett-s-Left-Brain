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
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js" ></script>
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
	<div><jsp:include page="/nav.jsp" /></div>

	<div style="height: 20em; margin: 2em auto; padding: 2em">

		<!-- 表格開始 -->
			
			<h2 style="text-align:center;color:purple">${singleArticle.atitle}</h2>
			<p style="text-align:center">${singleArticle.aname}</p>
			<fmt:formatDate var="time" value="${singleArticle.atime}" type="both" dateStyle="long" /> 
			<p style="text-align:center">${time}</p>
			<br>
			<div style="width:500px;margin:0 auto">
				<p>${singleArticle.acontext}</p>
			</div>
			
			<!-- ------------------------------- 楚河漢界 ------------------------------- -->
			
			<c:if test="${not empty msg}">
			<c:forEach var="row" items="${msg}">
				<table>
					<tr>
						<td>${row.account}</td>
					</tr>
					<tr>
						<td><fmt:formatDate value="${row.mtime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					
					<tr>								
						<c:if test="${row.mno == updno}">							
							<form action="<c:url value="/secure/_05_article/message.do"/>" method="get">
								<input type="hidden" name="mno" value="${row.mno}"> 
								<textarea rows="20" cols="40" name="mcontent">${row.mcontext}</textarea>
								<script>
									CKEDITOR.replace('mcontent', {
										width : 880,
									});
								</script>
								<input type="submit" name="prodaction" value="確認"> 
								<input type="submit" name="prodaction" value="取消">
							</form>
						</c:if>
					</tr>
					
					<c:if test="${row.mno != updno}">
						<tr>
							<td>${row.mcontext}</td>
						</tr>
					</c:if>
					
					<tr>
						<td>-----------------------------------</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>			
	</div>
</body>
</html>
