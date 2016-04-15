<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- **************************************** CSS開始   ***************************************************** -->
<style type="text/css">
			
			/*分類股  按鈕設定*/
			#menu{overflow:auto !important;
				  overflow /**/:hidden;}
			
			#menu td{float:left;list-style-type:none;width:4em;font-size:115%}
			
			#menu td a{display:block;width:100%;line-height:2.5em;color:#7E3D76;text-decoration:none;text-align:center}
			
			#menu td a:hover{background-color:#DDD;color:#666}
			
			/*分類股表格設定*/
			#stockTypeTable{
				width: 100%;
 				border: 0px solid #E0E0E0; /*測完要改顏色*/ 
				border-collapse:collapse;  /*把內外框的距離清掉*/
				margin: 0 auto;} 
 			#stockTypeTable th{
 				border: 1px solid black;
 				text-align: center; 
 				height: 25px; }
 			#stockTypeTable td{
 				border: 1px solid black;
 				text-align: center; 
 				height: 25px; }
 			#stockTypeTable tbody tr:HOVER {background-color:#FFE6D9;color:#666}
 			td.favorL:hovor{background-color:#DDD;color:#666;}
</style>
<!-- **************************************** 引用jQuery   ***************************************************** -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.1.min.js"></script>
<!-- **************************************** 網頁抬頭   ******************************************************* -->
<title>${stockTypeName}</title>    
<!-- ************************************** 最外框DIV開始  ***************************************************** -->

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
<!-- 請胤凱填寫(呼叫哪知Servlet)	↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<%-- <form action="<c:url value="/CustFavoriteServlet" />" method="post"> --%>

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
<%-- 		<td><a href="<c:url value='/secure/_02_login/personal_stock.jsp'/>" onclick="doAlert()">○ 加入 ○</a></td> --%>
<!-- if 未加入自選 -->
			
			<td><input type="submit" name="" value="○ 加入 ○"></td>
<!-- esle -->
<!-- 		<td><input type="submit" name="" value="移除"></td> -->
<!-- end -->
<%--        <c:forEach> --%>
			<c:url value="/secure/SpecialFunctionServlet" var="path" scope="page">
			<c:param name="stock_Code" value="2330" /></c:url>
			<td>2317</td>
			<td><a href="${path}">印楷</a></td>
			<td>158.00</td>
			<td>160.00</td>
			<td>10533</td>
			<td>14.59</td>
			<td>9.75</td>
			<td>2.45</td>
		</tr>
<%-- 		</c:forEach> --%>
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
<!-- 	</form> -->
</div>
</div>

</body>

<script type="text/javascript">
function doAlert(){
	alert("已加入 (此為demo用)");
}
</script>
</html>
