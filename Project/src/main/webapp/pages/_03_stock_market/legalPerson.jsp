<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>三大法人資訊</title>
<style type="text/css">
table tr:hover{
	color: #BD63FF;
	background-color: #FFFF00;
	}

</style>


</head>

<body style="margin: 0em 3em">
	<div class="container">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />


		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>


		<div style="height: 20em; margin:2em auto; padding:2em; border: 1px solid; border-color: green">

		<p style="text-align:center">三大法人資訊：靜態樣板文字，僅供參考，請後端工程師增加動態新聞</p>
			
			
			
			<!-- 表格開始 -->
			
			<form>
				<table style="border:2px #FFAC55 solid;padding:5px;" rules="all" cellpadding='5' align=center>
					<tr>
						<th>日期</th>
						<th>標題</th>
					</tr>
					<tr>
						<td>08-04-2016</td>
						<td>000</td>
					</tr>
					<tr>
						<td>08-04-2016</td>
						<td>111</td>
					</tr>
					<tr>
						<td>08-04-2016</td>
						<td>222</td>
					</tr>
				</table>


			</form>

		</div>

	</div>

</body>
</html>