<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>評量結果</title>
</head>

<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>
		
<H2 align=center>風險屬性問卷評量結果</H2>

<input type="text" size="10" />


<p>保守型</p>
<p>積極型</p>
<p>穩健型</p>
<p>智慧型???</p>
<br>
<p>如有疑問請洽專業顧問黃先生</p>



<div><a href="<c:url value='/Welcome.jsp'/>">回首頁</a></div>


</body>
</html>