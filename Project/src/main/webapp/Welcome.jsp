<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<head>

<title>歡迎頁面</title>


</head>

<body>
<<<<<<< HEAD
	<!-- <div class="container"> -->
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />
	<!-- 網頁主要導覽列 -->
	<div>
		<jsp:include page="/nav.jsp" />
	</div>
	<!-- 主畫面 -->
	<center>
	<div style="max-width:80em" >
		<div>
			<div
				style="margin: 2em auto; padding: 2em 0; max-width: 48em; height: 500px; overflow: hidden; float: left">
				<form>
					<c:if test="${not empty select}">
						<table id="newstable" class="table table-hover table-bordered"
							style="background-color: #BBFFEE	; border: 2px #000066 solid; margin: 2em 0; width: 100%; height: 50px"
							rules="all" cellpadding='5' align="center">
							<thead>
								<tr>
									<th style="text-align: center; background-color: #4d4d4d"><font
										style="color: #fff">新聞標題</font></th>
									<th style="text-align: center; background-color: #4d4d4d"><font
										style="color: #fff">發佈日期</font></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${select}">
									<c:url value="/pages/_05_newsArticle/news.do" var="path"
										scope="page">
										<c:param name="newUrl" value="${row.nno}" />
									</c:url>

									<tr style="height: 100%">
										<td><a href="${path}"> <font id="myTitle"
												style="color: #0066cc">${row.ntitle}</font>
										</a></td>
										<td style="text-align: center;width:180px"><fmt:formatDate
										value="${row.ntime}" pattern="yyyy/MM/dd HH:mm" />
								</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</form>
			</div>
		</div>
		<div
			style=" background-color: rgba(0, 0, 0, 0); padding: 5em; max-width: 35em; height: 35em ;position: relative;top: 20px;float:right;"
			class="container">
			<jsp:include page="/defaultView.jsp" />
		</div>
	</div>
	</center>


</body>
</html>
