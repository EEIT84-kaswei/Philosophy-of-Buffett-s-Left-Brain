<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Display</title>
<style type="text/css">
#photo {
	position: absolute;
	z-index: 1;
	left: 600px;
	top: 75px;
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
		<table>
			<thead>
				<tr>
					<td><a href="/Project/test/pages/newAcontext.jsp"><input type="submit"value="發表文章"></a></td>
				</tr>
				<tr>
					<th>發表日期</th>
					<th>作者</th>
					<th>文章標題</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${select}">
					<c:url value="/test/pages/acontext.jsp" var="path" scope="page">
						<c:param name="ano" value="${row.ano}" />
						<c:param name="atime" value="${row.atime}" />
						<c:param name="aname" value="${row.aname}" />
						<c:param name="atitle" value="${row.atitle}" />
						<c:param name="acontext" value="${row.acontext}" />
					</c:url>
					<tr>
						<td><fmt:formatDate value="${row.atime}"
								pattern="yyyy-MM-dd" /></td>
						<td>${row.aname}</td>
						<td><a href="${path}">${row.atitle}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>