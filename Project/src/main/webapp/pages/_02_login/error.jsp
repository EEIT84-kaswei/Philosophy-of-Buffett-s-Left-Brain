<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="2;url=${pageContext.request.contextPath}/pages/_02_login/login.jsp">
<title>登入失敗</title>
</head>
<body>
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

	<div align="center">
	
	<h2 style="color:yellow;">登入失敗，請重新輸入！</h2>
	<h3 style="color:yellow;">2秒後自動導入<a href="<c:url value='/pages/_02_login/login.jsp' />">登入</a>頁面</h3>
	</div>



</body>
</html>
