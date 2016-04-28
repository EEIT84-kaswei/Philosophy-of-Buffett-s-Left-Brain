<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 9]>
<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<html>
<head>
<meta>
<a name="viewport" content="width=device-width， initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>重要術語</title>

	<style type="text/css">
dl {
	color: purple;
	font-size: 150%;
	margin: 0 0 0 2em;
}

dd {
	color: black;
	font-size: 100%;
	margin: 0 2em 0 2em;
}

.list-inline a {
	color: #006699;
}

.dl-horizontal a {
	color: #006666;
}
</style> <c:choose>
		<c:when test="${! empty (param.locale)}">
			<c:set var="loc" value="${param.locale}" scope="session" />
		</c:when>
		<c:when test="${! empty (sessionScope.loc)}">
			<c:set var="loc" value="${sessionScope.loc}" scope="session" />
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="${pageContext.request.locale}"
				scope="session" />
		</c:otherwise>
	</c:choose> <%--  <c:set var="loc" value="${param.locale}"/> --%> <%--     <c:if test="${! empty (param.locale)}"> --%>
	<%--        <c:set var="loc" value="${param.locale}"/> --%> <%--     </c:if> --%>

	<fmt:setLocale value="${loc}" />
</head>

<body>


	<!-- <div class="container"> -->
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />
	<!-- 網頁主要導覽列 -->
	<div>
		<jsp:include page="/nav.jsp" />
	</div>

	<fmt:setLocale value="${loc}" />

	<fmt:bundle basename="properties.term">
		<div
			style="max-width: 80em; margin: 2em auto; background-color: #cccccc">
			<h2 style="text-align: center; padding: 2em 2em 0em 2em"><fmt:message key="ImportantTerms" /></h2>

			<div style="max-width: 60%; margin: 3em auto">
				<ul class="list-inline">
					<li><a href="#1"><fmt:message key="Denomination" /></a></li>
					<li><a href="#2"><fmt:message key="ParValue" /></a></li>
					<li><a href="#3"><fmt:message key="MarketPrice" /></a></li>
					<li><a href="#4"><fmt:message key="OnTheMarket" /></a></li>
					<li><a href="#5"><fmt:message key="Financing" /></a></li>
					<li><a href="#6"><fmt:message key="SecuritiesLending" /></a></li>
					<li><a href="#7"><fmt:message key="CommonStock" /></a></li>
					<li><a href="#8"><fmt:message key="SpecialUnit" /></a></li>
					<li><a href="#9"><fmt:message key="OpeningPrice" /></a></li>
					<li><a href="#10"><fmt:message key="ClosingPrice" /></a></li>
					<li><a href="#11"><fmt:message key="HighestPrice" /></a></li>
					<li><a href="#12"><fmt:message key="FloorPrice" /></a></li>
					<li><a href="#13"><fmt:message key="PressureBelt" /></a></li>
					<li><a href="#14"><fmt:message key="Anchor" /></a></li>
					<li><a href="#15"><fmt:message key="FinalPrice" /></a></li>
					<li><a href="#16"><fmt:message key="PE" /></a></li>
					<li><a href="#17"><fmt:message key="Yields" /></a></li>
					<li><a href="#18"><fmt:message key="DeviationRate" /></a></li>
					<li><a href="#19"><fmt:message key="TheMain" /></a></li>
					<li><a href="#20"><fmt:message key="Retail" /></a></li>
					<li><a href="#21"><fmt:message key="Purchase" /></a></li>
					<li><a href="#22"><fmt:message key="Shipments" /></a></li>
					<li><a href="#23"><fmt:message key="Dividend" /></a></li>
					<li><a href="#24"><fmt:message key="Ex" /></a></li>
					<li><a href="#25"><fmt:message key="FillInterest" /></a></li>
					<li><a href="#26"><fmt:message key="Tianquan" /></a></li>
					<li><a href="#27"><fmt:message key="FullSettlement" /></a></li>
					<li><a href="#28"><fmt:message key="PartOfTheFullDelivery" /></a></li>
					<li><a href="#29"><fmt:message key="WeightedIndex" /></a></li>

				</ul>

			</div>

			<br>
			<br>


			<dl class="dl-horizontal">
				<dt>
					<a name="1"><fmt:message key="Denomination" /></a>
				</dt>
				<dd><fmt:message key="01" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="2"><fmt:message key="ParValue" /></a>
				</dt>
				<dd><fmt:message key="02" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="3"><fmt:message key="MarketPrice" /></a>
				</dt>
				<dd><fmt:message key="03" /></dd>
			</dl>
			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="4"><fmt:message key="OnTheMarket" /></a>
				</dt>
				<dd><fmt:message key="04" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="5"><fmt:message key="Financing" /></a>
				</dt>
				<dd><fmt:message key="05" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="6"><fmt:message key="SecuritiesLending" /></a>
				</dt>
				<dd><fmt:message key="06" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="7"><fmt:message key="CommonStock" /></a>
				</dt>
				<dd><fmt:message key="07" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="8"><fmt:message key="SpecialUnit" /></a>
				</dt>
				<dd><fmt:message key="08" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="9"><fmt:message key="OpeningPrice" /></a>
				</dt>
				<dd><fmt:message key="09" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="10"><fmt:message key="ClosingPrice" /></a>
				</dt>
				<dd><fmt:message key="10" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="11"><fmt:message key="HighestPrice" /></a>
				</dt>
				<dd><fmt:message key="11" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="12"><fmt:message key="FloorPrice" /></a>
				</dt>
				<dd><fmt:message key="12" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="13"><fmt:message key="PressureBelt" /></a>
				</dt>
				<dd><fmt:message key="13" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="14"><fmt:message key="Anchor" /></a>
				</dt>
				<dd><fmt:message key="14" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="15"><fmt:message key="FinalPrice" /></a>
				</dt>
				<dd><fmt:message key="15" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="16"><fmt:message key="PE" /></a>
				</dt>
				<dd><fmt:message key="16" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="17"><fmt:message key="Yields" /></a>
				</dt>
				<dd><fmt:message key="17" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="18"><fmt:message key="DeviationRate" /></a>
				</dt>
				<dd><fmt:message key="18" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="19"><fmt:message key="TheMain" /></a>
				</dt>
				<dd><fmt:message key="19" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="20"><fmt:message key="Retail" /></a>
				</dt>
				<dd><fmt:message key="20" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="21"><fmt:message key="Purchase" /></a>
				</dt>
				<dd><fmt:message key="21" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="22"><fmt:message key="Shipments" /></a>
				</dt>
				<dd><fmt:message key="22" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="23"><fmt:message key="Dividend" /></a>
				</dt>
				<dd><fmt:message key="23" />
				</dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="24"><fmt:message key="Ex" /></a>
				</dt>
				<dd><fmt:message key="24" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="25"><fmt:message key="FillInterest" /></a>
				</dt>
				<dd><fmt:message key="25" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="26"><fmt:message key="Tianquan" /></a>
				</dt>
				<dd><fmt:message key="26" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="27"><fmt:message key="FullSettlement" /></a>
				</dt>
				<dd><fmt:message key="27" />
				</dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="28"><fmt:message key="PartOfTheFullDelivery" /></a>
				</dt>
				<dd><fmt:message key="28" /></dd>
			</dl>

			<br>

			<dl class="dl-horizontal">
				<dt>
					<a name="29"><fmt:message key="WeightedIndex" /></a>
				</dt>
				<dd><fmt:message key="29" />
				</dd>
			</dl>

			<br>


		</div>
	</fmt:bundle>
</body>
</html>
