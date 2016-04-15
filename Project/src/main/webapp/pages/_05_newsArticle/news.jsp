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
<style type="text/css">
#newstable tr:hover {
	color: #BD63FF;
	background-color:#77FFCC;
}

#newstable tr:nth-child(even) {
	background: #CCEEFF
	}
</style>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


		<jsp:include page="/nav.jsp"></jsp:include>
		
		
	<%
		response.setCharacterEncoding("UTF-8");
	%>

	<div align=center style="height:20px;width:10px"></div>

	<div align=center>
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



<form>
	<c:if test="${not empty select}">

			<table id="newstable" style="border: 2px #FFAC55 solid; padding:2em; width:35em" rules="all"
					cellpadding='5' align=center>
			<thead>
				<tr>
					<th>NewsTitle</th>
					<th>NewsDate</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${select}">
					<c:url value="/pages/_05_newsArticle/showNews.jsp" var="path" scope="page">
						<c:param name="nno" value="${row.nno}" />
						<c:param name="ntitle" value="${row.ntitle}" />
						<fmt:formatDate var="time" value="${row.ntime}" pattern="yyyy年MM月dd日" />
				   		<c:param name="ntime" value="${time}" />
						<c:param name="ncontext" value="${row.ncontext}" />
					</c:url>

					<tr style="height:2em">
						<td><a href="${path}">${row.ntitle}</a></td>
						<td><fmt:formatDate value="${row.ntime}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	</form>
	

		<form action="<c:url value="/pages/_05_newsArticle/updateNews.jsp"/>" method="get">
			<input type="submit" value="新增">
		</form>
	</div>


</body>
</html>