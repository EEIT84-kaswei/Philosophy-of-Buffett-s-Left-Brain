<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>股票資訊首頁</title>

<style type="text/css">

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

<div align=center style="margin:2em">

<h3 style="color:pink">台股資訊</h3>
<table style="border:3px #cccccc solid;max-width: 40em" cellpadding="10" border="1" >
	<tr style="border:3px #cccccc solid;">
		<td style="width:20%">即時股票資訊</td>
		<td>除了數據，也會以圖形呈現即時股票訊息</td>
	</tr>
	<tr style="border:3px #cccccc solid;">
		<td>股票分類</td>
		<td>
		<ul style="list-style-type:square;">
			<li><a href="<c:url value='/secure/_04_stock/concept_Stock/conceptStockIndex.jsp' />">概念股</a></li>
			<li><a href="">上市股</a></li>
			<li><a href="">上櫃股</a></li>
			<li><a href="">興櫃股</a></li>
			<li><a href="">成分股</a></li>
		</ul>
		</td>
	</tr>
</table>

	
</div>

<a href="<c:url value='/pages/_03_stock_market/legalPerson.jsp'/>">三大法人資訊</a>
<br>所謂的「三大法人」，即外資、投信、自營商。這部分還是可以試著show一下，但只有管理員可以看。如何？<br>

<a href="<c:url value='/pages/_03_stock_market/taiex.jsp'/>">加權指數</a>
<br>所謂的「加權指數」，是為了表達一群股票的整體狀況用加權的方式所算出來的一個總分。我們會讓加權指數show在每個畫面的右方角落。<br>
</div>
</body>
</html>