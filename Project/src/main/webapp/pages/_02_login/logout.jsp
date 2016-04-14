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
<c:set var="memberName" value="${ user.name }" />
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="LoginOK" scope="session" />
<c:remove var="ShoppingCart" scope="session" />
<!-- 下列敘述設定變數funcName的值為OUT，top.jsp 會用到此變數 -->
<c:set var="funcName" value="OUT" scope="session"/>


<!-- 下列六行敘述設定登出後要顯示的感謝訊息 -->
<c:set var="logoutMessage" scope="request">
<font color='blue' ><BR>
訪客${ memberName }，感謝您使用本系統。<BR>
您已經登出<BR>
</font>
</c:set>
<%
  session.invalidate();
%>
<jsp:forward page="/index.jsp"/>
</body> 
</html>