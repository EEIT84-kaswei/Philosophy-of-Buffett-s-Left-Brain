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


<style type="text/css">
#newstable tr:nth-child(odd) {
	background:rgb(179, 204, 204) ;
	}
#newstable tr:nth-child(even) {
	background: #d9d9d9
	}	
#newstable tr:hover {
	background-color: rgb(255, 230, 204);
}	
article, aside, figure, figcaption, footer, header, hgroup, menu, nav,
	section {
 	display: block; 
}

body {
	font: 62.5% "Trebuchet MS", sans-serif;
	margin: 50px;
}


#myTitle {
	width: 23em;
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
}
</style>
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
</head>
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<jsp:include page="/nav.jsp" />

	<%
		response.setCharacterEncoding("UTF-8");
	%>

<div class="table-responsive">
	<div style="margin: 2em auto; padding: 2em 0; max-width:50em;">
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
			<c:if test="${not empty allNews}">
				<table id="newstable" class="table table-hover table-bordered"
					style="border: 2px #000066 solid; margin: 2em 0;width:100%"
					rules="all" cellpadding='5' align="center">
					<thead>
						<tr>
							<th style="text-align: center;background-color: rgb(82, 122, 122)"><font style="color:#fff">新聞標題</font></th>
							<th style="text-align: center;background-color: rgb(82, 122, 122)"><font style="color:#fff">發佈日期</font></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${allNews}">
							<c:url value="/pages/_05_newsArticle/news.do" var="path"
								scope="page">
								<c:param name="newUrl" value="${row.nno}" />
							</c:url>

							<tr style="height: 100%">
								<td><a href="${path}">
										<font id="myTitle" style="color:#0066cc">${row.ntitle}</font>
									</a>
								</td>
								<td style="text-align: center;width:180px"><fmt:formatDate
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
					<input type="submit" value="新增" class="btn">
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
