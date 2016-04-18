<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show News</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("確定刪除此項新聞資料(編號:${select.nno})?")) {
			document.forms[0].action = "<c:url value='/pages/_05_newsArticle/news.do?nno=${select.nno}' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		} else {
		}
	}	
</script>
</head>
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>
	
	<% response.setCharacterEncoding("UTF-8"); %>

	<div style="margin: 2em auto; padding: 2em"></div>
	
		<form action="<c:url value="/pages/_05_newsArticle/news.do"/>" method="post">
			<input type="hidden" name="updtno" value="${select.nno}">
			<h2 style="text-align:center;color:purple">${select.ntitle}</h2>
			<fmt:formatDate var="time" value="${select.ntime}" pattern="yyyy年MM月dd日" />
			<p style="text-align:center">${time}</p>
			<br>
			<div style="max-width:50em;margin:0 auto">
				<p>${select.ncontext}</p>
			</div>
			
			<c:if test='<%=request.isUserInRole("admin")%>'>
				<div align=center>
					<input type="submit" name="prodaction" value="修改" />
					&nbsp;&nbsp;&nbsp; 
					<input type="button" name="delete" value="刪除" onclick="confirmDelete()" />
				</div>
			</c:if>
	</form>

</body>
</html>
