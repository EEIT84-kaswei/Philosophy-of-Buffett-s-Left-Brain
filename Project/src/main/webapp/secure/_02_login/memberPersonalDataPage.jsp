<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員資料管理</title>
<style type="text/css">
.mid{
	width:70%;
	align:center;
	margin:0 auto;
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

<h2 style="text-align:center">會員資料管理</h2>
<div id="mid" align="center">
<form action="<c:url value='/secure/AccountUpdateServlet' />" method="POST">
			<table class="table4_2" style="padding: 1em; height: 3em">
					
					
					
					<tr>
						<th>帳號</th>
						<td><input id="myPassword" type="text" name="account" value="${param.account}${Select.account}" size="35" readonly="readonly"></td>
						<td></td>
					</tr>
					<tr>
						<th>原密碼</th>
						<td><input id="myPassword" type="password" name="passw" value="${param.passw}" size="35"></td>
						<td><font size="-1" color="#FF0000">${error.passw}</font></td>
					</tr>
					<tr>
						<th>新密碼</th>
						<td><input type="password" name="checkpassw" value="${param.checkpassw}" size="35"></td>
						<td><font size="-1" color="#FF0000">${error.checkpassw}</font></td>
					</tr>
					<tr>
						<th>再輸入一次</th>
						<td><input type="password" name="checkpassw2" value="${param.checkpassw}" size="35"></td>
						<td><font size="-1" color="#FF0000">${error.checkpassw}</font></td>
					</tr>
					<tr>
						<th>姓名</th>
						<td><input type="text" name="name" size="35"
							value="${param.name}${Select.name}" placeholder="請填寫中文姓名"></td>
						<td><font size="-1" color="#FF0000">${error.name}</font></td>
					</tr>
					<tr>
						<th>身分證字號</th>
						<td><input type="text" name="idc" size="35"
							value="${param.idc}${Select.idc}" readonly="readonly"></td>
						<td><font size="-1" color="#FF0000">${error.idc}</font></td>
					</tr>
					<tr>
						<th>電子郵件信箱</th>
						<td><input type="text" name="email" value="${param.email}${Select.email}" size="35"></td>
						<td><font size="-1" color="#FF0000">${error.email}</font></td>
					</tr>
					<tr>
						<th>電話區碼</th>
						<td><input type="text" name="area_phone" value="${param.area_phone}${Select.area_phone}" size="35"></td>
					</tr>
					<tr>
						<th>電話號碼</th>
						<td><input type="text" name="phone" value="${param.phone}${Select.phone}" size="35"></td>
					</tr>
					<tr>
						<th>通訊地址</th>
						<td><input type="text" name="address" value="${param.address}${Select.address}" size="35"></td>
					</tr>				
						

					
			</table>
			
				<div align="center" style="margin: 2em">
					<input type="submit" name="prodaction" value="送出修改" />
					<input type="button" value="返回" onclick="location.href='../../Welcome.jsp'" /> 
					<input type="reset" value="清除表單">
				</div>

</form>
</div>
</body>
</html>