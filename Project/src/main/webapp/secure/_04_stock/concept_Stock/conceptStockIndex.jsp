<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>概念股首頁</title>
<script type="text/javascript">
function doAlert(){
	alert("已加入 (此為demo用)");
}
</script>
</head>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

<div align=center style="margin:2em">

	<h3>概念股樣板</h3>
	
	<div style="float:right">最後更新時間：08-04-2016 13:30:00</div>
	
	
<select style="align:left">
 <option> </option>
 <option>環保概念股</option>
 <option>石油概念股</option>
 <option>中國概念股</option>
</select>
	
	
	<table style="text-align:center;border:1px green solid">
		<tr>
			<th>加入自選股</th>
			<th>股票代碼</th>
			<th>股票名稱</th>
			<th>現價</th>
			<th>收盤價</th>
			<th>總市值</th>
			<th>本益比</th>
			<th>市價/每股營收</th>
			<th>市價/淨值</th>
		</tr>
		<tr>
			<td><a href="<c:url value='/secure/_02_login/personal_stock.jsp'/>" onclick="doAlert()">○ 加入 ○</a></td>
			<td>6803</td>
			<td><a href="<c:url value='/secure/_04_stock/concept_Stock/historyInfo.jsp' />">印楷</a></td>
			<td>158.00</td>
			<td>160.00</td>
			<td>10533</td>
			<td>14.59</td>
			<td>9.75</td>
			<td>2.45</td>
		</tr>
		<tr>
			<td>○ 加入 ○</td>
			<td>2596</td>
			<td>朔雯</td>
			<td>158.02</td>
			<td>160.20</td>
			<td>10503</td>
			<td>18.55</td>
			<td>5.08</td>
			<td>3.15</td>
		</tr>
		<tr>
			<td>○ 加入 ○</td>
			<td>2206</td>
			<td>袖微</td>
			<td>122.00</td>
			<td>60.00</td>
			<td>10203</td>
			<td>10.28</td>
			<td>20.72</td>
			<td>43.05</td>
		</tr>

	</table>
	
</div>
</div>

</body>
</html>