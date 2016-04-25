<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 9]>
<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理員主控台</title>

<style>
 article, aside, figure, figcaption, footer, header, hgroup, menu, nav, 
 	section { 
 	display: block; 
}

@-moz-document url-prefix() {
  fieldset { display: table-cell; }
}

body {
/* 	font: 62.5% "Trebuchet MS", sans-serif; */
/* 	margin: 50px; */
}

#table2 th{
	background-color:#000080;
 	color:#ccffff;
}
</style>
</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<jsp:include page="/nav.jsp" />
	
	<script type="text/javascript">
		$(document).ready(function() {$("#table2 > tbody > tr > td:nth-child(6)").children().each(
				function() {$(this).click(
								function() {
									var commend = $(this).parent().prevAll()[0].firstChild.value;
									var cs_Code = $(this).parent().prevAll()[1].firstChild.value;
								    var stock_TypeCode = $(this).parent().prevAll()[2].firstChild.value;
								    var stock_Name = $(this).parent().prevAll()[3].firstChild.value;
									var stock_Code = $(this).parent().prevAll()[4].firstChild.value;
									var stockManage;
									if (stock_Name == undefined|| stock_Code == undefined) {
										stockManage = "Update";
										stock_Name = $(this).parent().prevAll()[3].firstChild.nodeValue;
										stock_Code = $(this).parent().prevAll()[4].firstChild.nodeValue;
										} else {stockManage = "Insert";
										}
									document.forms[1].action = "<c:url value='/secure/StockCodeServlet?stockManage=" + stockManage + "&stock_Code=" + stock_Code + "&stock_Name="+ stock_Name  + "&stock_TypeCode=" + stock_TypeCode + "&cs_Code=" + cs_Code + "&commend=" + commend + "' />";
									document.forms[1].method = "POST";
									document.forms[1].submit();
									})
							});

					});

	</script>

	<br>
	<br>
	<br>
	<h2 align="center" style="color:#ffe6ff">管理員平台</h2>
	<h4 align="center" style="color:#ffe6ff">個股資料管理</h4>
	<br>

	<center>
		<div style="margin:auto;max-width:50em">
		<div class="table-responsive" style="width:100%">
			<table id="table2" style="width:100%">
				<thead>
					<form action="<c:url value="/secure/StockCodeServlet" />" method="post">
						<tr>
							<td><input type="text" size="5" name="deleteMsg" placeholder="股票編號"></td>
							<td><input type="submit" value="Delete" name="stockManage" class="btn btn-primary"></td>
						</tr>
					</form>
					<tr>
						<th>股票編號</th>
						<th>股票名稱</th>
						<th>股票分類</th>
						<th>概念股分類</th>
						<th>風險等級</th>
						<th>修改</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" size="5" name="stock_Code"
							placeholder="股票編號"></td>
						<td><input type="text" size="7" name="stock_Name"
							placeholder="股票名稱"></td>
						<td><input type="text" size="5" name="stock_TypeCode"
							placeholder="股票分類"></td>
						<td><input type="text" size="5" name="cs_Code"
							placeholder="概念股分類"></td>
						<td><input type="text" size="5" name="commend"
							placeholder="風險等級"></td>
						<td><input type="submit" value="Insert" name="stockManage" class="btn btn-primary"></td>

					</tr>
					<c:forEach var="row" items="${Select}">
						<tr>
							<td>${row.stock_Code}</td>
							<td>${row.stock_Name}</td>
							<td><input type="text" name="stock_TypeCode" size="5"
								value="${row.stock_TypeCode}"></td>
							<td><input type="text" name="cs_Code" size="5"
								value="${row.cs_Code}"></td>
							<td><input type="text" name="commend" size="5"
								value="${row.commend}"></td>
							<td><input type="button" value="Update" name="stockManage" class="btn btn-primary"></td>

						</tr>

					</c:forEach>


				</tbody>

			</table>
			<!--   </form> -->
			<form>
				<input type="hidden" name="a" />
			</form>
		</div>
		</div>
	</center>
	<script language="JavaScript">
		 		    $(document).ready(function(){ 
		 		      var opt={"oLanguage":{"sProcessing":"處理中...",
		 		                            "sLengthMenu":"顯示 _MENU_ 項結果",
		 		                            "sZeroRecords":"沒有匹配結果",
		 		                            "sInfo":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
		 		                            "sInfoEmpty":"顯示第 0 至 0 項結果，共 0 項",
		 		                            "sInfoFiltered":"(從 _MAX_ 項結果過濾)",
		 		                            "sSearch":"搜索:",
		 		                            "oPaginate":{"sFirst":"首頁",
		 		                                         "sPrevious":"上頁",
		 		                                         "sNext":"下頁",
		 		                                         "sLast":"尾頁"}
		 				            }
		 			       };
		 		      $("#table2").dataTable(opt);
		 		      });
	</script>
</body>
</html>
