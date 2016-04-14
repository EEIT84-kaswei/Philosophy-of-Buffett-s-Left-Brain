<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入</title>
<style>
#logtable{
	margin:3em;
	padding:1em;
	border:0.2px;
	border-color:green;
	border-radius:8px;
	color:purple;
	height:2em
}

</style>
<script src="js/bootstrap.min.js"></script>
</head>
<body style="margin:0 3em">
 <div class="container"> 
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>
<div align="center">

	<form>
	<table id="logtable" style="border:5px #FFD382 groove;" cellpadding="10" border='0'>
		<tr>
			<td>帳號</td>
			<td><input type="text" size="20" placeholder="請輸入帳號"></td>
		</tr>
		<tr>
			<td>密碼</td>
			<td><input type="password" size="20"></td>
		</tr>	
		
	</table>
	<p>
			<input type="button" value="登入">
			<input type="button" value="申請會員" onclick="location.href='<c:url value="/pages/_01_register/accept.jsp"/>'">
			<input type="button" value="忘記密碼" >
	
	</p>

	</form>
	</div>
</div>	
</body>
</html>