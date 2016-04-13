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


			
				<form action="<c:url value="/pages/article.controller" >
					    <c:param name="ano" value="${select.ano}" />
						<c:param name="aname" value="${select.aname}" />
						<c:param name="atitle" value="${select.atitle}" />
						<c:param name="acontext" value="${select.acontext}" /></c:url>"
					method="post">
					<table style="border: 2px #FFAC55 solid; padding: 5px;" rules="all"
						cellpadding='5' align=center>

						<tr>
							<th>發表日期</th>
							<th>作者</th>
						</tr>
						<tr>
							<td>${select.atime}</td>
							<td>${select.aname}</td>
						</tr>
						<tr>
							<th colspan="2">文章標題</th>
						</tr>
						<tr>
							<td colspan="2">${select.atitle}</td>
						</tr>

						<tr>
							<th colspan="2">文章內容</th>
						</tr>
						<tr>
							<td colspan="2">${select.acontext}</td>
						</tr>
						<c:url value="/secure/_05_article/newArticleIndex.jsp" var="path"
							scope="page">
							<c:param name="ano" value="${select.ano}" />
							<c:param name="aname" value="${select.aname}" />
							<c:param name="atitle" value="${select.atitle}" />
							<c:param name="acontext" value="${select.acontext}" />
						</c:url>
						<tr>
							<td><a href="${path}"><input type="button"
									name="prodaction" value="修改"></a></td>
							<td><input type="submit" name="prodaction" value="刪除"></td>
						</tr>

					</table>
				</form>
			
		</div>

	</div>

</body>
</html>