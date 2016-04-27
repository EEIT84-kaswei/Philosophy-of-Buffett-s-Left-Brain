<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
		

 		#weightedIndexChart{
  		width: 20em;
		height: 20em;
/* 		position: fixed; */
/* 		right: 0.5%; */
/* 		top: 0; */
/* 		margin: auto 2em; */
/* 		bottom: 0; */
		display: inline-block;
		padding:0;
		margin:0 1em;
		}
		

 		 #leftone
 		 {
  		max-width: 60em;
  		width:100%;
  		float:left;
  		margin:1em;
		padding:1em;
		 }

	
</style>
<title>歷史資訊</title>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/highstock.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/exporting.js"></script>
		
		<script type="text/javascript">
		var contextPath="${pageContext.request.contextPath}";
		var stock_Code="${bean.stock_Code}";
		var stock_Name="${bean.stock_Name}";
		</script>
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/historyInfo.js"></script>
		<div class="table-responsive">
		<div style="background-color:rgba(0, 0, 0, 0.5);width:30em;margin:0 auto;">
		<h2 style="color:rgba( 255, 230, 243, 1);font-family:'微軟正黑體';text-align:center">股票歷史資訊：${bean.stock_Name}</h2>
		</div>
		<div id="leftone"> 
			
			
			<h4 style="color:white">即時數據</h4>
			<div id="instantChart" style="height: 400px;"></div>
			<table style="background-color:	rgba(0, 0, 0, 0.6);border: 2px black solid;border-radius:10px;border-style:none; padding: 5px;color:#ffcc00;margin:2em auto" rules="all"
						cellpadding='5' align=center>
				<thead>
					<tr>
						<td style="text-align:center;padding:10px 10px 10px 10px;border-style:none;"><h4>券商重押>30%</h4></td>
						<td style="text-align:center;padding:10px 10px 10px 10px;border-style:none;"><h4>TOP券商買超>500張<br>超額買超>4倍</h4></td>
						<td style="text-align:center;padding:10px 10px 10px 10px;border-style:none;"><h4>短線籌碼集中<br>一日集中>20%</h4></td>
						<td style="text-align:center;padding:10px 10px 10px 10px;border-style:none;"><h4>外資連買>3天<br>買超>1000張</h4></td>
						<td style="text-align:center;padding:10px 10px 10px 10px;border-style:none;"><h4>投信連買>3天<br>買超>1000張</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align:center;padding:5px 15px 15px 15px;border-style:none;">${index1}</td>
						<td style="text-align:center;padding:5px 15px 15px 15px;border-style:none;">${index2}</td>
						<td style="text-align:center;padding:5px 15px 15px 15px;border-style:none;">${index3}</td>
						<td style="text-align:center;padding:5px 15px 15px 15px;border-style:none;">${index4}</td>
						<td style="text-align:center;padding:5px 15px 15px 15px;border-style:none;">${index5}</td>
					</tr>
				</tbody>
				
				
			</table><br>
			<input id="month" type="button" value="月K" style="float:right;">
			<input id="week" type="button" value="周K" style="float:right;">
			<input id="day" type="button" value="日K" style="float:right;">
			<h4 style="color:white">歷史數據(走勢圖)</h4>
			<div id="historyChart" style="width: 100%; height: 600px;"></div>
			<br>
			<table>
				<tbody>
					<tr></tr>
				
				
				</tbody>
			
			</table>
		</div>
		<center>
		<div id="weightedIndexChart"></div>
		</center>
		</div>
</body>
</html>
