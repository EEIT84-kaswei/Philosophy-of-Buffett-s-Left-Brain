<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>申請加入會員</title>
<script src="js/bootstrap.min.js"></script>
</head>
<style>
.table4_2 table {
	width:100%;
	margin:15px 0;
	border:0;
}
.table4_2 th {
	background-color:#C8D7FF;
	color:#000000
}
.table4_2,.table4_2 th,.table4_2 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_2 th,.table4_2 td {
	border: 1px solid #dfe8fe;
	border-width:1px 0 1px 0
}
.table4_2 tr {
	border: 1px solid #dfe8fe;
}
.table4_2 tr:nth-child(odd){
	background-color:#ecf1fe;
}
.table4_2 tr:nth-child(even){
	background-color:#fdfdfd;
}
</style>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>


<div align="center" style="margin:3em">
<form id='form'> 
<table class="table4_2" style="padding:1em;height:3em">
<tr>
	<th>帳號</th><td><input type="text" size="20" placeholder="請輸入帳號"></td>
</tr>
<tr>
	<th>密碼</th><td><input type="text" size="20"></td>
</tr>
<tr>
	<th>姓名</th><td><input type="text" size="20" placeholder="請填寫中文姓名"></td>
</tr>
<tr>
	<th>身分證字號</th><td><input type="text" size="20" placeholder="請輸入身分證字號"></td>
</tr>
<tr>
	<th>電子郵件信箱</th><td><input type="text" size="20"></td>
</tr>
<tr>
	<th>電話區碼</th><td><input type="text" size="20"></td>
</tr>
<tr>
	<th>電話號碼</th><td><input type="text" size="20"></td>
</tr>
<tr>
	<th>通訊地址</th><td><input type="text" size="20"></td>
</tr>
</table>


<div align="center" style="margin:2em">
<input type="submit" value="送出" onclick="location.href='../../Welcome.jsp'" /> <!-- 要改 -->
<input type="button" value="返回" onclick="location.href='../../Welcome.jsp'" />
<input type="reset" value="清除表單">
</div>

</form> 



</div>


</div>
</body>
</html>