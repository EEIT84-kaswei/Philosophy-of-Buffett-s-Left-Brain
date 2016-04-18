<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推薦</title>

<style type="text/css">
#mainDIV{
	border:1px blue solid;
	height:15em;
	margin:1em;
	padding:1em;
	align:center;
}

</style>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

<div align=center id="mainDIV">

<h3 align=center>推薦股票</h3>

	<div>
	
	根據您填寫的風險問卷，您的得分為：(${score.scores})
	<br>
	您屬於積極型。
	<br>
	據此，本網站推薦您選擇下列幾種股票，供您參考。
	<br>	
	<ol>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c1&send=送出"></c:url>'>生技醫療類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c11&send=送出"></c:url>'>生質能源類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c8&send=送出"></c:url>'>VR虛擬實境概念股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c13&send=送出"></c:url>'>電子3C類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c5&send=送出"></c:url>'>蘋果供應鏈類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c3&send=送出"></c:url>'>物聯網類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c14&send=送出"></c:url>'>能源類股</a></li>		
	</ol>
	</div>


</div>



</body>
</html>