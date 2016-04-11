<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基礎知識</title>
<style>
	li{
		padding:2em 2em;
		margin:2em 2em;
		line-height: 35px;
		color:#A42D00;
	}
	p{
		margin:2em;
	}
</style>
</head>
<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->
<div style="background-color:#FFF0D4;padding:20;height:40px;margin:0 auto">
<jsp:include page="/nav.jsp" />
</div>

	<div align=center style="width:80%;margin:0 auto; padding:2em">
		<h3 style="text-align:center;color:gold">基本概念</h3>
		
		
		<ul>
			<li><a href="#">關於股票</a></li>
			<li><a href="#">股票類型</a></li>
			<li><a href="#">術語介紹</a></li>
			<li><a href="#">投資指南</a></li>
			<li><a href="#">趨勢圖解析</a></li>
			<li><a href="#">自我測驗</a></li>		
		</ul>
		
	
	</div>


</div>
</body>
</html>