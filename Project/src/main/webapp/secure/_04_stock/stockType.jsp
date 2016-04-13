<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
			#menu{overflow:auto !important;
				  overflow /**/:hidden;
				  width:100%;background-color:#FFDEDE;
				  border-top-left-radius:55pt 25pt;
				  border-top-right-radius:55pt 25pt;}
			#menu li{float:left;list-style-type:none;width:11.5em;border-right:1px solid #81C0C0;font-size:115%}
			#menu li a{display:block;width:100%;line-height:2.5em;color:#7E3D76;text-decoration:none;text-align:center}
			#menu li a:hover{background-color:#FFD2D2;color:#0066CC}

</style>



<title>股票分類：首頁</title>
</head>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

<div align=center>

	<h3 style="color:blue">股票分類</h3>
	<ul id="menu">
		<li><a href="<c:url value='/secure/_04_stock/concept_Stock/conceptStockIndex.jsp'/>">概念股</a></li>
		<li>上市股</li>
		<li>上櫃股</li>
		<li>興櫃股</li>
		<li>成分股</li>
	</ul>

</div>

</div>

</body>
</html>