<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歷史資訊</title>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>

		<h2>股票歷史資訊範例：印楷</h2>

		<div align=center
			style="border: 1px gray solid; height: 20em; width: 70%">
			<h4>歷史數據(走勢圖)</h4>
			<br>
			<h4>即時數據</h4>
			<table style="border: 2px black solid; padding: 5px;" rules="all"
						cellpadding='5' align=center>
				<thead>
					<tr>
						<td><h4>券商重押>30%</h4></td>
						<td><h4>TOP券商買超>500張<br>超額買超>4倍</h4></td>
						<td><h4>短線籌碼集中<br>一日集中>20%</h4></td>
						<td><h4>外資連買>3天<br>買超>1000張</h4></td>
						<td><h4>投信連買>3天<br>買超>1000張</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${index1}</td>
						<td>${index2}</td>
						<td>${index3}</td>
						<td>${index4}</td>
						<td>${index5}</td>
					</tr>
				</tbody>
			</table>
		</div>

</body>
</html>
