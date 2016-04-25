<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- **************************************** CSS開始   ***************************************************** -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
<style type="text/css">

/*分類股  按鈕設定*/
#menu {
	overflow: auto !important;
	overflow /**/: hidden;
}

#menu td {
	float: left;
	list-style-type: none;
	width: 4em;
	font-size: 115%
}

#menu td a {
	display: block;
	width: 100%;
	line-height: 2.5em;
	color: #7E3D76;
	text-decoration: none;
	text-align: center
}

#menu td a:hover {
	background-color: #DDD;
	color: #666
}

/*分類股表格設定*/
#stockTypeTable {
	width: 100%;
	border: 0px solid #BEBEBE; /*測完要改顏色*/
	border-collapse: collapse; /*把內外框的距離清掉*/
	margin: 0 auto;
}

#stockTypeTable th {
	border: 1px solid #BEBEBE;
	text-align: center;
	height: 35px;
}

#stockTypeTable td {
	border: 1px solid #BEBEBE;
	text-align: center;
	height: 35px;
}

#stockTypeTable tbody tr:HOVER {
	background-color: #FFE6D9;
	color: #666
}

td.favorL:hovor {
	background-color: #DDD;
	color: #666;
}
</style>

<!-- **************************************** 網頁抬頭   ******************************************************* -->
<title>籌碼分析</title>
<!-- **************************************** 網頁抬頭  結束 ***************************************************** -->
</head>
<!-- **************************************** body開始  ******************************************************* -->
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>


	<!-- ************************************** 內文DIV開始  ***************************************************** -->
	<div align="center" style="width: 90%; margin: 0 auto;">

		

		<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
		<div style="float: right">
			網頁最後更新時間：
			<fmt:formatDate value="${date}" pattern="yyyy-MM-dd hh:mm:ss" />
		</div>

		<!-- **************************************表格開始*********************************************** -->
		<table id="stockTypeTable">
			<thead>
				<tr>
					<td colspan="9"
						style="background: #642100; height: 28px; border: none;"><b
						style="color: white">籌碼分析</b></td>
				</tr>
				<tr>
					<td colspan="9" style="height: 20px; border: none"></td>
				</tr>
				<tr style="height: 30px; background: #FFDCB9">
					
					<th>股票代碼</th>
					<th>&nbsp;&nbsp;股票名稱&nbsp;&nbsp;</th>
					<th>券商重押>30%</th>
					<th>TOP券商買超>500張<br>超額買超>4倍</th>
					<th>短線籌碼集中<br>一日集中>20%</th>
					<th>外資連買>3天<br>買超>1000張</th>
					<th>投信連買>3天<br>買超>1000張</th>
					
				</tr>
			</thead>

			<tbody id="tbody">

				
				<c:forEach var="data" items="${beanS}">
					<tr>
						<td>${data.stock_Code}</td>			
						<td>${data.stock_Name}</td>
						<td>${data.index1}</td>
						<td>${data.index2}</td>
						<td>${data.index3}</td>
						<td>${data.index4}</td>
						<td>${data.index5}</td>
												
					</tr>					

				</c:forEach>
			</tbody>

		</table>
		<!-- ************************************** 表格結束   *************************************************** -->

	</div>
	<!-- ************************************** 內文DIV結束  ***************************************************** -->


</body>
<!-- ************************************** body結束  ********************************************************* -->

<!-- ************************************** JavaScript ***************************************************** -->
</html>