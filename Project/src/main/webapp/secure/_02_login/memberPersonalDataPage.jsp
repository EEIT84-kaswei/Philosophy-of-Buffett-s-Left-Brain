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
	padding: 10px;
	border-radius: 10px;
}

#table4_2 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

#table4_2 th {
	background-color: rgba(0, 153, 204, 0.7);
	color: #000000;
	width:30px;
}

#table4_2, #table4_2 th, #table4_2 td {
	font-size: 1em;
	text-align: center;
	padding: 10px;
	margin:10px;
	border-collapse: collapse;
}

#table4_2 th, #table4_2 td {
	border: 1px solid #dfe8fe;
	border-width: 1px 0 1px 0;
	font-weight: bold;
	font-size: 120%;
}

#table4_2 tr {
	border: 1px solid #dfe8fe;
}

#table4_2 tr:nth-child(odd) {
	background-color: rgba(255,255,255,0.7);
}

#table4_2 tr:nth-child(even) {
	background-color: rgba(255,255,255,0.7);
}
</style>

</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />


	<!-- 網頁主要導覽列 -->

	<jsp:include page="/nav.jsp" />


	<h2 style="text-align: center;color:#ccffff;font-weight:bold">會員資料管理</h2>
	<div id="mid" align="center" class="table-responsive">
		<form action='<c:url value="/secure/_02_login/member.do"/>' method='POST'>
		<input type="hidden" name="id" value="${user.id}">
			<table id="table4_2" class="table" style="padding: 1em; height: 3em;max-width:40em;border-radius:10px;">
				<tr>
					<th>帳號</th>
					<td>${user.account}</td>
					<td></td>
				</tr>
				<tr>
					<th>更改密碼</th>
					<td><input type="password" name="newpassw" value="${param.newpassw}" size="35"></td>
					<td><font size="-1" color="#FF0000">${error.checkpassw}</font></td>
				</tr>
				<tr>
					<th>新密碼確認</th>
					<td><input type="password" name="checkpassw" value="${param.checkpassw}" size="35"></td>
					<td><font size="-1" color="#FF0000">${error.checkpassw}</font></td>
				</tr>
				<tr>
					<th>姓名</th>
					<td><input type="text" name="name" size="35" value="${user.name}" placeholder="請填寫中文姓名"></td>
					<td><font size="-1" color="#FF0000">${error.name}</font></td>
				</tr>
				<tr>
					<th>身分證字號</th>
 					<input type="hidden" name="idc" value="${user.idc}">
					<td>${user.idc}</td>
					<td><font size="-1" color="#FF0000">${error.idc}</font></td>
				</tr>
				<tr>
					<th>電子郵件信箱</th>
					<td><input type="text" name="email" value="${user.email}" size="35"></td>
					<td><font size="-1" color="#FF0000">${error.email}</font></td>
				</tr>
				<tr>
					<th>電話區碼</th>
					<td><input type="text" name="area_phone" value="${user.area_phone}" size="35"></td>
					<td></td>
				</tr>
				<tr>
					<th>電話號碼</th>
					<td><input type="text" name="phone" value="${user.phone}" size="35"></td>
					<td></td>
				</tr>
				<tr>
					<th>通訊地址</th>
					<td><input type="text" name="address" value="${user.address}" size="35"></td>
					<td></td>
				</tr>
			</table>

			<div align="center" style="margin: 2em">
				<input type="submit" name="prodaction" value="送出修改" class="btn btn-default"/> 
				<input type="button" value="返回" onclick="location.href='<c:url value='/Welcome.jsp' />" class="btn btn-default" /> 
				<input type="reset" value="清除表單" class="btn btn-default">
			</div>

		</form>
	</div>
</body>
</html>
