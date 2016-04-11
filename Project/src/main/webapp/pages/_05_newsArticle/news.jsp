<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"> -->

<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<!-- <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> -->
<!-- <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function() {
	$('input[name="date"]').attr("readonly", "readonly").datepicker({
		appendText: "請輸入YYYY-MM-DD",
		showOn: "focus",
		changeMonth: true,
		changeYear: true,
		dateFormat: "yy-mm-dd",
	});
});

</script>

</head>
<body style="margin: 0em 3em">
	<div class="container">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />


		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>
		
		
	<%
		response.setCharacterEncoding("UTF-8");
	%>
	<h3>News</h3>

	<div class="container">
		<div class="row">
			<form class="form-search" action="<c:url value="/news.do"/>" method="get">
				<div class="input-append">
					<input type="text" class="span2 search-query" name="keyword" 
					placeholder="關鍵字搜尋" value="${param.keyword}" required autofocus>
					<input class="btn" type="submit" name="prodaction" value="keySearch">
				</div>
			</form>

			<form class="form-search" action="<c:url value="/news.do"/>" method="get">
				<div class="input-append">
					<input type="text" class="span2 search-query" name="date" 
					placeholder="日期搜尋" value="${param.date}" required autofocus>
					<input class="btn" type="submit" name="prodaction" value="dateSearch">
				</div>
			</form>
		</div>
	</div>



	<c:if test="${not empty select}">

		<table>
			<thead>
				<tr>
					<th>NewsTitle</th>
					<th>NewsDate</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${select}">
					<c:url value="/showNews.jsp" var="path" scope="page">
						<c:param name="nno" value="${row.nno}" />
						<c:param name="ntitle" value="${row.ntitle}" />
						<c:param name="ntime" value="${row.ntime}" />
						<c:param name="ncontext" value="${row.ncontext}" />
					</c:url>

					<tr>
						<td><a href="${path}">${row.ntitle}</a></td>
						<td><fmt:formatDate value="${row.ntime}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
		<form action="<c:url value="/updateNews.jsp"/>" method="get">
			<input type="submit" value="新增">
		</form>
</div>

</body>
</html>