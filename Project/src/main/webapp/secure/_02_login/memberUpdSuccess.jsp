<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員資料管理</title>
<style type="text/css">
.mid {
	width: 70%;
	align: center;
	margin: 0 auto;
}

.table4_2 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table4_2 th {
	background-color: #C8D7FF;
	color: #000000
}

.table4_2, .table4_2 th, .table4_2 td {
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_2 th, .table4_2 td {
	border: 1px solid #dfe8fe;
	border-width: 1px 0 1px 0
}

.table4_2 tr {
	border: 1px solid #dfe8fe;
}

.table4_2 tr:nth-child(odd) {
	background-color: #ecf1fe;
}

.table4_2 tr:nth-child(even) {
	background-color: #fdfdfd;
}
</style>

</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />


	<!-- 網頁主要導覽列 -->

	<jsp:include page="/nav.jsp" />

	<h2 style="text-align: center">會員資料更新結果</h2>
	<div id="mid" align="center">
		<table class="table4_2" style="padding: 1em; height: 3em">

			<tr>
				<th>帳號</th>
				<td>${user.account}</td>
			</tr>
			<tr>
				<th>姓名</th>
				<td>${user.name}</td>
			</tr>
			<tr>
				<th>身分證字號</th>
				<td>${user.idc}</td>
			</tr>
			<tr>
				<th>電子郵件信箱</th>
				<td>${user.email}</td>
			</tr>
			<tr>
				<th>電話區碼</th>
				<td>${user.area_phone}</td>
			</tr>
			<tr>
				<th>電話號碼</th>
				<td>${user.phone}</td>
			</tr>
			<tr>
				<th>通訊地址</th>
				<td>${user.address}</td>
			</tr>
		</table>
	</div>
</body>
</html>