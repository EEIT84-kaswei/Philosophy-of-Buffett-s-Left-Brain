<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員資料管理</title>
<style type="text/css">
.mid {
	width: 50%;
	align: center;
	margin: 2em auto;
	padding: 10px;
	border-radius: 10px;
}

#table4_2 {
	width: 38em;
	margin: 15px 0;
	border: 0;
}

#table4_2 th {
	background-color: rgba(0, 153, 204, 0.7);
	color: #000000;

}

#table4_2, #table4_2 th, #table4_2 td {
	font-size: 1em;
	text-align: center;
	padding: 10px;
	margin:10px;
	border-collapse: collapse;
}

#table4_2 th, #table4_2 td {
	border: 1px solid #dfe8fe;
	border-width: 1px 0 1px 0;
	font-weight: bold;
	font-size: 120%;
}

#table4_2 tr {
	border: 1px solid #dfe8fe;
}

#table4_2 tr:nth-child(odd) {
	background-color: rgba(255,255,255,0.7);
}

#table4_2 tr:nth-child(even) {
	background-color: rgba(255,255,255,0.7);
}
</style>
<c:choose>
	<c:when test="${! empty (param.locale)}">
		<c:set var="loc" value="${param.locale}" scope="session"/>
	</c:when>
	<c:when test="${! empty (sessionScope.loc)}">
		<c:set var="loc" value="${sessionScope.loc}" scope="session"/>
	</c:when>
	<c:otherwise>
		<c:set var="loc" value="${pageContext.request.locale}" scope="session"/>
	</c:otherwise>
</c:choose>
</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />


	<!-- 網頁主要導覽列 -->

	<jsp:include page="/nav.jsp" />

 <fmt:setLocale value="${loc}"/>  

 <fmt:bundle basename="properties.member">   
	<h2 style="text-align: center;color:#ccffff;font-weight:bold"><fmt:message key="management" /></h2>
	<div id="mid" align="center" class="table-responsive">
		<form action='<c:url value="/secure/_02_login/member.do"/>' method='POST'>
		<input type="hidden" name="id" value="${user.id}">
			<table id="table4_2" class="table" style="padding: 1em; height: 3em;border-radius:10px;">
				<tr>
					<th><fmt:message key="account" /></th>
					<td>${user.account}</td>
				</tr>
				<tr>
					<th><fmt:message key="changePassword"/></th>
					<td><input type="password" name="newpassw" value="${param.newpassw}" size="30"><br>
						<font size="-1" style="text-align:left;color:#008080">${error.checkpassw}</font>
					</td>
				</tr>
				<tr>
					<th><fmt:message key="confirmPassword"/></th>
					<td><input type="password" name="checkpassw" value="${param.checkpassw}" size="30"><br>
						<font size="-1" style="text-align:left;color:#008080">${error.checkpassw}</font>
					</td>
				</tr>
				<tr>
					<th><fmt:message key="name"/></th>
					<td><input type="text" name="name" size="30" value="${user.name}" placeholder="請填寫中文姓名"><br>
						<font size="-1" style="text-align:left;color:#008080">${error.name}</font>
					</td>
				</tr>
				<tr>
					<th><fmt:message key="id"/></th>	
					<td><input type="hidden" name="idc" value="${user.idc}">${user.idc}<br>
					<font size="-1" style="text-align:left;color:#008080">${error.idc}</font>
				</tr>
				<tr>
					<th><fmt:message key="email"/></th>
					<td><input type="text" name="email" value="${user.email}" size="30"><br>
						<font size="-1" style="text-align:left;color:#008080">${error.email}</font>
					</td>
				</tr>
				<tr>
					<th><fmt:message key="telephone_Area_Code"/></th>
					<td><input type="text" name="area_phone" value="${user.area_phone}" size="30"></td>
				</tr>
				<tr>
					<th><fmt:message key="telephone_Code"/></th>
					<td><input type="text" name="phone" value="${user.phone}" size="30"></td>
				</tr>
				<tr>
					<th><fmt:message key="address"/></th>
					<td><input type="text" name="address" value="${user.address}" size="30"></td>
				</tr>
			</table>

			<div align="center" style="margin: 2em">
				<input type="submit" name="prodaction" value="<fmt:message key='send'/>" class="btn btn-default"/> 
				<input type="button" value="<fmt:message key='back'/>" onclick="location.href='<c:url value='/Welcome.jsp' />" class="btn btn-default" /> 
				<input type="reset" value="<fmt:message key='clear'/>" class="btn btn-default">
			</div>

		</form>
	</div>
	</fmt:bundle>
</body>
</html>
