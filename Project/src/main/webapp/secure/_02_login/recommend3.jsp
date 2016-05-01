<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>推薦</title>

<style type="text/css">
#mainDIV{

	/*border:1px blue solid;*/
	/*height:15em;*/
	margin:1em;
	padding:1em;
	align:center;
}
ol li a{
	color:blue;
}
</style>
<c:choose>
	<c:when test="${! empty (param.locale)}">
		<c:set var="loc" value="${param.locale}" scope="session"/>
	</c:when>
	<c:when test="${! empty (sessionScope.loc)}">
		<c:set var="loc" value="${sessionScope.loc}" scope="session"/>
	</c:when>
	<c:otherwise>
		<c:set var="loc" value="${pageContext.request.locale}" scope="session"/>
	</c:otherwise>
</c:choose>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>
 <fmt:setLocale value="${loc}"/>  

 <fmt:bundle basename="properties.recommend">   
<div id="mainDIV" style="background-color:rgba(255, 255, 255, 0.8);max-width:520px;margin:60px auto;;padding:20px">

<h3 align="center"><fmt:message key="recommendedStocksTitle"/></h3>

	<div style="font-size:130%">
	
	<fmt:message key="yourScore"/>(${oldScores})
	<c:if test="${loc eq 'ja_JP'}"><fmt:message key="yourScoreEnd"/></c:if>
	<br>
	<fmt:message key="conservativeType"/>
	<br>
	<fmt:message key="listStockDescription"/>
	<br>
	<ol>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c2&send=送出"></c:url>'>定存股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c12&send=送出"></c:url>'>電信股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c17&send=送出"></c:url>'>食品工業股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c4&send=送出"></c:url>'>雲端概念股</a></li>		
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c16&send=送出"></c:url>'>觀光事業股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c7&send=送出"></c:url>'>航運股</a></li>	
	</ol>
	</div>


</div>


</fmt:bundle>
</body>
</html>
