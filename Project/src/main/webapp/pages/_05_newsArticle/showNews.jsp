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
			document.forms[0].action = "<c:url value="/news.do?nno=${param.nno}"/>";
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
	<div class="container">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>
	<%
		response.setCharacterEncoding("UTF-8");
	%>

<div style="hieght:20px;width:20px;padding:20px;margin:2em">
</div>

	<form action="news.do" method="POST">
		
		<h2 style="text-align:center;color:purple">${param.ntitle}</h2>
		<p style="text-align:center">${param.ntime}</p>
		<br>
		<div style="width:500px;margin:0 auto">
		<p>${param.ncontext}</p>
		</div>
		<div align=center>
		<input type="button" name="update" value="修改" onclick="toUpdateView()" />
		&nbsp;&nbsp;&nbsp; 
		<input type="button" name="delete" value="刪除" onclick="confirmDelete()" />
		</div>
	</form>
</div>
</body>
</html>