<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巴菲特的左腦哲學</title>

<style>
html {
	height: 100%;
}

body {
	/* 	font-family: 'Montserrat', sans-serif; */
	font-size: x-large;
	background-image: url("${pageContext.request.contextPath}/img/back.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}

#full_screen {
	margin: 5em 0 0 0;
	width: 40%;
	height: auto;
}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.1.min.js"></script>

<script type="text/javascript">
<!-- 	圖片自適應畫面大小：1.設定圖片最大尺寸。2. 設定JS如下面兩行。 -->
	$('document').ready(function() {
		$('#container').height($(window).height());
	});
</script>

</head>
<body>
	<div class="container" id="container" align="center">
		<div class="main">

			<a href="<c:url value="/pages/_05_newsArticle/Index.do"/>">	 <img
				src="<%=request.getContextPath()%>/img/logo.png" id="full_screen" style="max-width:500px;min-width:250px">
			</a>
		</div>
		<h4 style="margin:1em">${logoutMessage}</h4>
		<div class="footer">
			<table>
				<tr>
					<td>廖千慧&nbsp;</td>
					<td>Liao, Chien-huei</td>
				</tr>
				<tr>
					<td>張秀維&nbsp;</td>
					<td>Chang, Hsiu-wei</td>
				</tr>
				<tr>
					<td>張碩文&nbsp;</td>
					<td>Chang, Shuo-wen</td>
				</tr>
				<tr>
					<td>陳姵吟&nbsp;</td>
					<td>Chen, Pei-yin</td>
				</tr>
				<tr>
					<td>陳昱華&nbsp;</td>
					<td>Chen, Yu-hua</td>
				</tr>
				<tr>
					<td>黃胤凱&nbsp;</td>
					<td>Huang, In-kai</td>
				</tr>
				<tr>
					<td>趙育伸&nbsp;</td>
					<td>Chao, Yu-shen</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
