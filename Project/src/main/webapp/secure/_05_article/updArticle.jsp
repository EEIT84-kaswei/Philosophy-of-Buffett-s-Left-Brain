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
</style>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
</head>
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>
	<div style="height: 20em; margin: 2em auto; padding: 0em;">

		<!-- 表格開始 -->

		<form action="<c:url value="/pages/article.controller" />" method="post">
			<table style="border: 2px #FFAC55 solid; padding: 5px; background-color:rgba(255, 255, 255, 0.5)" rules="all" cellpadding='5' align="center">
				
				<tr>
					<td>作家名稱 ：</td>
					<td>
						<input type="text" name="aname" value="${updArticle.aname}" required size="45">
				   <%-- <span class="error">${error.aname}</span> --%>
					</td>
				</tr>
				<tr>
					<td>文章標題：</td>
					<td>
						${updArticle.atitle}
				   <%-- <span class="error">${error.atitle}</span> --%>
					</td>
				</tr>
				<tr>
					<td>文章內文 ：</td>
					<td><textarea name="acontext" cols="60" rows="30">${updArticle.acontext}</textarea>
						<script>
							CKEDITOR.replace('acontext', {});
						</script> 
						<br>
						<span class="error" style="font-size: medium; color: red">${error.acontext}</span>
					</td>
				</tr>
			</table>
			
			<center>
			<input type="hidden" name="uano" value="${updArticle.ano}" style="margin:30px" class="btn btn-default">
			<input type="submit" name="prodaction" value="Insert" style="margin:30px" class="btn btn-default">
			</center>
		</form>
	</div>


</body>
</html>

