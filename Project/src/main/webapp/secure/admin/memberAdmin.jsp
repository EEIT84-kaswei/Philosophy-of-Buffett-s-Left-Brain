<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 9]>
<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理員主控台</title>

<style>
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

	<jsp:include page="/nav.jsp" />

	<br>
	<br>
	<br>
	<h2 align="center">管理員平台</h2>
	<h4 align="center">會員權限管理</h4>
	<br>

	<center>
		<div style="width: 1000px; height: 600px">
				
				<table id="table1">
					<thead>
						<tr>
							<th style="display:none;">id</th>
							<th>登入帳號(account)</th>
							<th>會員權限(account_Role)</th>
							<th>修改權限</th>
							<th>刪除會員</th>
						</tr>
					</thead>
					
					<tbody>
						
						
							
							<c:forEach var="row" items="${yeah}">
							<tr>
							<form action="<c:url value='/member.do' />" method="post">
								<td style="display:none;"><input type="text" value="${row.account}" name="accountName"></td>
								<td>${row.account}</td>
								<td>
									<select name="role">
										<c:if test="${row.account_Role == 'admin'}">
											<option>admin</option>
											<option>customer</option>
											<option>writer</option>
										</c:if>
										<c:if test="${row.account_Role == 'writer'}">
											<option>writer</option>
											<option>customer</option>
											<option>admin</option>
										</c:if>
										<c:if test="${row.account_Role == 'customer'}">
											<option>customer</option>
											<option>writer</option>
											<option>admin</option>
										</c:if>
									</select></td>
								<td><input type="submit" name="revise" value="update"></td>
								<td><input type="submit" name="revise" value="delete"></td>
							</form>
							</tr>
						</c:forEach>
						
						

					</tbody>
					
				</table>
			
		</div>
		<p style="text-align: center">功能還沒寫完</p>
	</center>
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
			$("#table1").dataTable(opt);
		});
	</script>
</body>
</html>