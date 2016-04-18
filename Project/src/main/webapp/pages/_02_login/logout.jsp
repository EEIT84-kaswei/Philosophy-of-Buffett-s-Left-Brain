<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 軍雅購物商城的logout頁面，為Irina測試用 --> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登出</title>
</head>
<body>
<!-- 先將使用者名稱取出 -->
<%-- <c:set var="memberName" value="${pageContext.request.remoteUser}" /> --%>

<!-- 下列六行敘述設定登出後要顯示的感謝訊息 -->
<c:set var="logoutMessage" scope="request">
<font color='blue' ><BR>

訪客${pageContext.request.remoteUser}，感謝您使用本系統。<BR>

您已經登出<BR>
</font>
</c:set>
<%
  session.invalidate();
%>
<jsp:forward page="/index.jsp"/>
</body> 
</html>
