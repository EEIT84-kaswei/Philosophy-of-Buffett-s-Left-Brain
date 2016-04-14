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
#maintable tr:hover {
	color: #BD63FF;
	background-color: #77FFCC;
}
#maintable tr:nth-child(even) {
	background: #CCEEFF
	}
</style>


</head>

<body style="margin: 0em 3em">
	<div class="container">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>


	<!-- 	<div align="center" style="height: 20em; margin: 2em auto; padding: 2em"> -->

			<!-- 表格開始 -->

			<form action="<c:url value="/view/article.controller" />" method="post">
				<center>

						依作家搜尋
				<input type="text" name="sname" value="">
				<input type="submit" name="prodaction" value="搜尋">
				</center>
				
				<table id="maintable"  align=center style="border: 2px #FFAC55 solid; padding:2em; width:35em" rules="all"
					cellpadding='5'>
					<thead>
<!-- 						<tr><td ></td><th></th><td></td></tr> -->
						<tr>
							
							<th>文章標題</th>
							<th>作者</th>
							<th>發表日期</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${select}">
							<c:url value="/secure/_05_article/selectArticleIndex.jsp" var="path" scope="page">
								<c:param name="ano" value="${row.ano}" />
								<c:param name="atime" value="${row.atime}" />
								<c:param name="aname" value="${row.aname}" />
								<c:param name="atitle" value="${row.atitle}" />
								<c:param name="acontext" value="${row.acontext}" />
							</c:url>
							<tr style="height:2.5em">
								
								<td><a href="${path}">${row.atitle}</a></td>
								<td>${row.aname}</td>
								<td><fmt:formatDate value="${row.atime}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
						<center>
						<a href="/Project/secure/_05_article/newArticleIndex.jsp">
						<input type="button" value="發表文章">
						</a>
						</center>
			</form>

		</div>

<!-- 	</div> -->

</body>
</html>