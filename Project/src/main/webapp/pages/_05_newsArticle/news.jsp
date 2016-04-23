<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>股市新聞</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"> -->

<!-- <script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script> -->
<!-- <script type="text/javascript" src="../js/jquery-ui.min.js"></script> -->
<!-- <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> -->
<!-- <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
<script type="text/javascript">
	$(document).ready(function() {
		$('input[name="date"]').attr("readonly", "readonly").datepicker({
			appendText : "請輸入YYYY-MM-DD",
			showOn : "focus",
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
		});
	});
</script>
<style type="text/css">
article, aside, figure, figcaption, footer, header, hgroup, menu, nav,
	section {
	display: block;
}

body {
	font: 62.5% "Trebuchet MS", sans-serif;
	margin: 50px;
}

#newstable tr:hover {
	color: #BD63FF;
	background-color: #77FFCC;
}

#newstable tr:nth-child(even) {
	background: #CCEEFF
}

#myTitle {
	width: 23em;
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
}
</style>
</head>
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<jsp:include page="/nav.jsp" />

	<%
		response.setCharacterEncoding("UTF-8");
	%>

<div class="table-responsive">
	<div style="margin: 2em auto; padding: 2em 0; max-width:38em;">
		<!-- 		<div align=center> -->
		<!-- 			<div class="row"> -->
		<%-- 				<form class="form-search" action="<c:url value="/news.do"/>" method="get"> --%>
		<!-- 					<div class="input-append"> -->
		<!-- 						<input type="text" class="span2 search-query" name="keyword" -->
		<%-- 							placeholder="關鍵字搜尋" value="${param.keyword}" required autofocus> --%>
		<!-- 						<input class="btn" type="submit" name="prodaction" value="keySearch"> -->
		<!-- 					</div> -->
		<!-- 				</form> -->

		<%-- 				<form class="form-search" action="<c:url value="/news.do"/>" method="get"> --%>
		<!-- 					<div class="input-append"> -->
		<!-- 						<input type="text" class="span2 search-query" name="date" -->
		<%-- 							placeholder="日期搜尋" value="${param.date}" required autofocus> --%>
		<!-- 						<input class="btn" type="submit" name="prodaction" value="dateSearch"> -->
		<!-- 					</div> -->
		<!-- 				</form> -->
		<!-- 			</div> -->

		<form>
			<c:if test="${not empty select}">
				<table id="newstable" class="table table-hover table-bordered"
					style="border: 2px #FFAC55 solid; margin: 2em 0;width:100%"
					rules="all" cellpadding='5' align="center">
					<thead>
						<tr>
							<th style="text-align: center">新聞標題</th>
							<th style="text-align: center">發佈日期</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${select}">
							<c:url value="/pages/_05_newsArticle/news.do" var="path"
								scope="page">
								<c:param name="newUrl" value="${row.nno}" />
							</c:url>

							<tr style="height: 150%">
								<td><a href="${path}">
										<font id="myTitle">${row.ntitle}</font>
									</a>
								</td>
								<td style="text-align: center"><fmt:formatDate
										value="${row.ntime}" pattern="yyyy/MM/dd HH:mm" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</form>

		<c:if test='<%=request.isUserInRole("admin")%>'>
			<form action="<c:url value="/pages/_05_newsArticle/insertNews.jsp"/>"
				method="post">
				<center>
					<input type="submit" value="新增">
				</center>
			</form>
		</c:if>
	</div>
	</div>
	

	<script language="JavaScript">
		$(document).ready(function() {
			var opt = {
				"oLanguage" : {
					"sProcessing" : "處理中...",
					"sLengthMenu" : "顯示 _MENU_ 項結果",
					"sZeroRecords" : "沒有匹配結果",
					"sInfo" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
					"sInfoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
					"sInfoFiltered" : "(從 _MAX_ 項結果過濾)",
					"sSearch" : "搜索:",
					"oPaginate" : {
						"sFirst" : "首頁",
						"sPrevious" : "上頁",
						"sNext" : "下頁",
						"sLast" : "尾頁"
					}
				}
			};
			$("#newstable").dataTable(opt);
		});
	</script>
	
</body>
</html>
