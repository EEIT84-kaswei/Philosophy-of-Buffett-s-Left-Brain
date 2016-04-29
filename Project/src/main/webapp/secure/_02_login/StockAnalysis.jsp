<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>籌碼分析</title>
<!-- **************************************** CSS開始   ***************************************************** -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" /> -->
<style type="text/css">

/*分類股表格設定*/
/* #stockTypeTable { */
/* 	width: 100%; */
/* 	border: 0px solid #BEBEBE; /*測完要改顏色*/
* /
	/* 	border-collapse: collapse; /*把內外框的距離清掉*/ * /
	/* 	margin: 0 auto; */
	/* } */
	/* #stockTypeTable th { */
	/* 	border: 1px solid #BEBEBE; */
	/* 	text-align: center; */
	/* 	height: 35px; */
	/* } */
	/* #stockTypeTable td { */
	/* 	border: 1px solid #BEBEBE; */
	/* 	text-align: center; */
	/* 	height: 35px; */
	/* 	color:#333333; */
	/* 	font-weight: bold; */
	/* } */

 #stockTypeTable tbody:hover {
	background-color: #FFE6D9;
	font-color: yellow;
}

#tbody tr:hovor {
	background-color: #fff;
	font-color: yellow;
}

#stockTypeTable th, tr, td {
	border: 1px groove #000000;
	font-size: 100%
}
</style>
<c:choose>
	<c:when test="${! empty (param.locale)}">
		<c:set var="loc" value="${param.locale}" scope="session" />
	</c:when>
	<c:when test="${! empty (sessionScope.loc)}">
		<c:set var="loc" value="${sessionScope.loc}" scope="session" />
	</c:when>
	<c:otherwise>
		<c:set var="loc" value="${pageContext.request.locale}" scope="session" />
	</c:otherwise>
</c:choose>
<!-- **************************************** 網頁抬頭   ******************************************************* -->
<title>籌碼分析</title>
<!-- **************************************** 網頁抬頭  結束 ***************************************************** -->
</head>
<!-- **************************************** body開始  ******************************************************* -->
<body>
	<fmt:setLocale value="${loc}" />

	<fmt:bundle basename="properties.term">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />

		<!-- 網頁主要導覽列 -->
		<div><jsp:include page="/nav.jsp" /></div>


		<!-- ************************************** 內文DIV開始  ***************************************************** -->
		<div class="table-responsive" style="max-width: 80em; margin: 30px auto;">

			<!-- **************************************表格開始*********************************************** -->
			<table id="stockTypeTable" class="table"
				style="border: 1px solid black; background-color: rgba(250, 250, 250, 0.8)">
				<thead>
					<tr style="border: 1px solid black;">
						<td colspan="9"
							style="background-color: rgba(102, 102, 153, 0.8); height: 28px; margin: 30px">
							<center>
								<font style="color: white; font-family: wt011; font-size: 150%">
									<fmt:message key="StockAnalysis" />
								</font>
							</center>
						</td>
					</tr>
					<tr>
						<td colspan="9" style="height: 20px;"></td>
					</tr>
					<tr style="height: 40px; background: #ccccff">

						<th>股票代碼</th>
						<th>股票名稱</th>
						<th>券商重押>30%</th>
						<th>TOP券商買超>500張<br>超額買超>4倍
						</th>
						<th>短線籌碼集中<br>一日集中>20%
						</th>
						<th>外資連買>3天<br>買超>1000張
						</th>
						<th>投信連買>3天<br>買超>1000張
						</th>

					</tr>
				</thead>

				<tbody>


					<c:forEach var="data" items="${beanS}">
						<tr style="border: 1.5px solid black;">
							<td><a style="color:blue"
								href="<c:url value='/secure/SpecialFunctionServlet'><c:param name='stock_Code' value='${data.stock_Code}'/></c:url> ">${data.stock_Code}</a></td>

							<td><a style="color:blue"
								href="<c:url value='/secure/SpecialFunctionServlet'><c:param name='stock_Code' value='${data.stock_Code}'/></c:url> ">${data.stock_Name}</a></td>
							<c:choose>
								<c:when test="${data.index1 eq '符合'}">
									<td style="color: red;">${data.index1}</td>
								</c:when>
								<c:otherwise>
									<td>${data.index1}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${data.index2 eq '符合'}">
									<td style="color: red;">${data.index2}</td>
								</c:when>
								<c:otherwise>
									<td>${data.index2}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${data.index3 eq '符合'}">
									<td style="color: red;">${data.index3}</td>
								</c:when>
								<c:otherwise>
									<td>${data.index3}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${data.index4 eq '符合'}">
									<td style="color: red;">${data.index4}</td>
								</c:when>
								<c:otherwise>
									<td>${data.index4}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${data.index5 eq '符合'}">
									<td style="color: red;">${data.index5}</td>
								</c:when>
								<c:otherwise>
									<td>${data.index5}</td>
								</c:otherwise>
							</c:choose>
						</tr>

					</c:forEach>
				</tbody>

			</table>
			<!-- ************************************** 表格結束   *************************************************** -->

		</div>
		<!-- ************************************** 內文DIV結束  ***************************************************** -->


	</fmt:bundle>
</body>
<!-- ************************************** body結束  ********************************************************* -->

<script type="text/javascript"
	src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		$("#stockTypeTable").DataTable({
			"pageLength" : 10,
			"lengthMenu" : [ 5, 10, 15, 20 ]
		});
	});
</script>


<!-- ************************************** JavaScript ***************************************************** -->
</html>