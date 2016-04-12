<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>專欄文章</title>
<style type="text/css">
table tr:hover {
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


		<div
			style="height: 20em; margin: 2em auto; padding: 2em; border: 1px solid; border-color: green">

			<p style="text-align: center">專欄文章：靜態樣板文字，僅供參考，請後端工程師增加動態專欄文章</p>



			<!-- 表格開始 -->

			<form action="<c:url value="/view/article.controller" />" method="post">
				<table style="border: 2px #FFAC55 solid; padding: 5px;" rules="all"
					cellpadding='5' align=center>

					<tr>
						<td>作家名稱 :</td>
						<td ><input type="text" name="aname" value="${param.aname}"><span class="error">${error.aname}</span></td>
						
					</tr>
					<tr>
						<td>文章標題:</td>
						<td><input type="text" name="atitle" value="${param.atitle}"><span class="error">${error.atitle}</span></td>
					</tr>

					<tr>
						<td>文章內文 :</td>
						<td><textarea name="acontext" cols="60" rows="30">${param.acontext}</textarea><br><span class="error">${error.acontext}</span></td>
					</tr>
					<tr>
						<td></td>
						<td ><input type="submit" name="prodaction" value="Insert">
							<div style="display: none;">
								<input type="text" name="ano" value="${param.ano}">
							</div></td>
					</tr>
				</table>
			</form>
		</div>

	</div>

</body>
</html>