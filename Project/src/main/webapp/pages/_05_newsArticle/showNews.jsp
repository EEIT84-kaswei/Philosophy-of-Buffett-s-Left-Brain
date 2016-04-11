<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show News</title>
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("確定刪除此項新聞資料(編號:${param.nno})?")) {
			document.forms[0].action = "news.do?nno=${param.nno}";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		} else {
		}
	}

	function toUpdateView() {
		var title=encodeURI("${param.ntitle}");
		var context=encodeURI("${param.ncontext}");
		document.forms[0].action = "updateNews.jsp?no=${param.nno}&title="+title+"&context="+context;
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}
	
</script>
</head>
<body>
	<%
		response.setCharacterEncoding("UTF-8");
	%>

	<form action="news.do" method="POST">

		<h1>${param.ntitle}</h1>
		<fmt:parseDate var="parseDate" value="${param.ntime}" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${parseDate}" pattern="yyyy年MM月dd日"/>
		<p>${param.ncontext}</p>

		<input type="button" name="update" value="修改" onclick="toUpdateView()" />
		&nbsp;&nbsp;&nbsp; 
		<input type="button" name="delete" value="刪除" onclick="confirmDelete()" />

	</form>

</body>
</html>