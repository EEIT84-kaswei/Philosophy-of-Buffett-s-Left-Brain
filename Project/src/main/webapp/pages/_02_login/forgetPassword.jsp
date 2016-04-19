<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />

		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>

<div align=center>
<br><h3>忘記密碼</h3><br>
請輸入您註冊時登記的e-mail：<input type="text" name="email" size="30"><br>
<br>
本站將寄送新的密碼至您的e-mail地址，請使用新密碼重新登入。<br>
登入後，請即時修改您的密碼，以維護個人隱私權益。<br>
<input type="submit" value="送出" onclick="location.href='<c:url value="/pages/_02_login/login.jsp"/>'">
</div>



</body>
</html>