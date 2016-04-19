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
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
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

		<div style="margin: 2em auto; padding: 2em">

			<!-- 表格開始 -->
			
				<form action="
					<c:url value="/pages/article.controller">
					    <c:param name="sano" value="${singleArticle.ano}" />
					</c:url>" method="post">
				
				<h2 style="text-align:center;color:purple">${singleArticle.atitle}</h2>
				<p style="text-align:center">${singleArticle.aname}</p>
				<fmt:formatDate var="time" value="${singleArticle.atime}" type="both" dateStyle="long" /> 
				<p style="text-align:center">${time}</p>
				<br>
				<div style="max-width:50em;margin:0 auto">
					<p>${singleArticle.acontext}</p>
				</div>
				<div align=center>

					<c:if test='<%=request.isUserInRole("admin")%>'>
						<input type="submit" name="prodaction" value="修改">
						<input type="submit" name="prodaction" value="刪除" onclick="if(confirm('您確定刪除此篇文章嗎?')) return true;else return false">								
					</c:if>
					
				<%--
 					<h1><%=request.getRemoteUser()%></h1>
					<h1>${singleArticle.account}</h1> 
				--%>
					<c:if test='<%=request.isUserInRole("writer")%>'>
						<c:set var="user" value="<%=request.getRemoteUser()%>" />		
						<c:if test='${singleArticle.account == user }'>
							<input type="submit" name="prodaction" value="修改">
							<input type="submit" name="prodaction" value="刪除" onclick="if(confirm('您確定刪除此篇文章嗎?')) return true;else return false">								
						</c:if>
					</c:if>				
					
				</div>
				</form>
				</div>
				<!-- ------------------------------- 楚河漢界 ------------------------------- -->
				
				<div>
				<h3 style="text-align:center;color:blue">~~~~~~~~~~讀~者~回~應~~~~~~~~~~</h3>
				<br>

				<div style="max-width:50em;margin:0 auto">
				<c:if test="${not empty msg}">
				<c:forEach var="row" items="${msg}">
					<c:if test='${row.account == user }'>					
						<form action="<c:url value="/pages/article.controller"/>" method="get">
							<input type="hidden" name="mno" value="${row.mno}">
							<input type="hidden" name="updm" value="${singleArticle.ano}">
							<input type="submit" name="revise" value="編輯">
							&nbsp;
							<input type="submit" name="revise" value="刪除" 
								onclick="if(confirm('您確定刪除此留言嗎?')) return true;else return false">
						</form>									
					</c:if>
					
					<table>
						<tr>
							<td>回應者：${row.account}</td>
						</tr>
						<tr>
							<td>回應時間：<fmt:formatDate value="${row.mtime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<td>回應內容：<br>${row.mcontext}</td>
						</tr>
						<tr>
							<td>-----------------------------------</td>
						</tr>
					</table>
				</c:forEach>
			</c:if>
			
			<form action="<c:url value="/pages/article.controller"/>" method="post">
				<input type="hidden" name="account" value="<%=request.getRemoteUser()%>"> 
				<input type="hidden" name="sano" value="${singleArticle.ano}">
				<textarea rows="20" cols="40" name="content" required></textarea>
				<script>
					CKEDITOR.replace('content', {
						width:880,
					});
				</script>
				<br /> 
				<input type="submit" name="revise" value="留言">
			</form>
				</div>

		</div>



</body>
</html>
