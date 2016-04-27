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
	background: #d9d9d9
	}
	
#Atitle{
	width: 20em;
	white-space: nowrap;
	text-overflow: ellipsis; 
	-o-text-overflow: ellipsis;
	overflow: hidden;
}

#Aname{
	width: 10em;
	white-space: nowrap;
	text-overflow: ellipsis; 
	-o-text-overflow: ellipsis;
	overflow: hidden;
}	

article, aside, figure, figcaption, footer, header, hgroup, menu, nav,
	section {
	display: block;
}

body {
	font: 62.5% "Trebuchet MS", sans-serif;
	margin: 50px;
}
</style>

</head>

<body>

		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />


		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>

<div class="table-responsive">
	<div style="margin: 2em auto; padding: 2em 0; max-width:48em;">

			<!-- 表格開始 -->

			<form action="<c:url value="/pages/article.controller" />" method="post">				
				<table id="maintable" class="table table-hover table-bordered"
					style="border: 2px #000066 solid; margin: 2em 0;width:100%"
					rules="all" cellpadding='5' align="center">
					<thead>
						<tr>							
							<th style="width: 50%; text-align: center;background-color: #4d4d4d"><font style="color:#fff">文章標題</font></th>
							<th style="width: 25%; text-align: center;background-color: #4d4d4d"><font style="color:#fff">作者</font></th>
							<th style="width: 25%; text-align: center;background-color: #4d4d4d"><font style="color:#fff">發表日期</font></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${select}">
							<c:url value="/pages/article.controller" var="path" scope="page" >
								<c:param name="ano" value="${row.ano}" />
							</c:url>
							<tr>
								<td><div id="Atitle"><a href="${path}"><font style="color:#0066cc">${row.atitle}</font></a></div></td>
								<td><div id="Aname">${row.aname}</div></td>
								<td style="text-align: center"><fmt:formatDate value="${row.atime}" pattern="yyyy/MM/dd HH:mm" /></td> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test='<%=request.isUserInRole("admin")%>'>
					<center>
						<div style="padding:20px">
						<a href="<c:url value='/secure/_05_article/newArticle.jsp'/>">
							<input type="button" value="發表文章" class="btn btn-default">
						</a>
						</div>
					</center>
				</c:if>
				<c:if test='<%=request.isUserInRole("writer")%>'>
					<center>
					<div style="padding:20px">
						<a href="<c:url value='/secure/_05_article/newArticle.jsp'/>">
							<input type="button" value="發表文章" class="btn btn-default">
						</a>
					</div>
					</center>
				</c:if>
			</form>

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
			$("#maintable").dataTable(opt);
		});
	</script>
</body>
</html>
