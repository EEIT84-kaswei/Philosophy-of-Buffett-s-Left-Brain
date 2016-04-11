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
	width:80%;
	height:15em;
	max-height:15em;
	margin:1em;
	padding:1em;
	align:center;
}

</style>
</head>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

<div align=center id="mainDIV">

<h3 align=center>推薦股票</h3>

	<div>
	
	根據您填寫的風險問卷，您的得分為：(?)
	<br>
	您屬於保守型/積極型/穩定型。
	<br>
	據此，本網站推薦您選擇下列幾種股票，供您參考。
	<br>
	<ol>
		<li>字神帝國概念股</li>
		<li>華碩概念股</li>
		<li>富邦金控概念股</li>
	</ol>
	</div>


</div>


</div>

</body>
</html>