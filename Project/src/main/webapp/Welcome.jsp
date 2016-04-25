<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<head>

<title>歡迎頁面</title>


</head>

<body>
<!-- <div class="container"> -->
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />
<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>
<!-- 主畫面 -->
<center>
<div align="center" style="margin:4em auto 2em auto; background-color: rgba(0, 0, 0, 0.3);padding:5em;max-width:30em;height:30em" class="container">
<jsp:include page="/defaultView.jsp" />
</div>
</center>

</body>
</html>
