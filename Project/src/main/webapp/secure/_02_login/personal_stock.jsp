<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自選股</title>
<style type="text/css">
	#myTable{
		border:1px gray solid;
		margin:0 auto;
		text-align:center;
	}

	#myTable td{
		border:1px blue solid;
	}
</style>
</head>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

		<div style="align:center;margin:2em;padding:1em">

			<h2 style="text-align:center">會員(id)自選股</h2>

			
			<table id="myTable">
			
				<tr>
					<th>股票代號</th>
					<th>股票名稱</th>
					<th>加入時間</th>
					<th>移除</th>
				</tr>
				<tr>
					<td>1024</td>				
					<td>印楷</td>
					<td>08-04-2016 19:00:00</td>
					<td>○ 移除 ○</td>
				</tr>
			
			</table>
		</div>

</div>
</body>
</html>