<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>標題</title>
<style type="text/css">

body{
background-color:#FFE8E8;
}

li {
	font-size: 20px;
	color: purple;
}

#fl_right {
	float: right;
}

#fl_right.li {
	text-align: right;
}
</style>

</head>


	<!-- 標題 START -->
<center>	
	<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'zh-TW',
			includedLanguages : 'ru,uk,en,ja,ko,zh-TW,fr,de,it,es,th,vi,ar-sa,gd-ie,yi,zu,sw,ts,tr,mm'
		}, 'google_translate_element');
	}
</script>

	
<table>
<tbody>
<tr>
	<td>
		<div id="logoimg">
			<img src="<c:url value="/img/logo.png"/>" style="float: left; height: 120px">
		</div>
	</td>
	<td>
			<h1>巴菲特的左腦哲學</h1><br>
			<font size="1px">EEIT84 project | Philosophy of Buffett's Left Brain</font>
	</td>
	<td class='menuData'>
				<div class='menu'>
					<c:if test="${empty LoginOK }">
						<a href="<c:url value='/pages/_02_login/login.jsp' />"> 登入 </a>
					</c:if>
				</div>
	</td>
	<td class='menuData'>
				<div class='menu'>
					<c:if test="${!empty LoginOK }">
						<a href="<c:url value='/_02_login/logout.jsp' />"> 登出 </a>
					</c:if>
				</div>
	</td>
	<td class='menuData'>
				<div class='menu'>
					<c:if test="${LoginOK }">
						<a href="<c:url value='/secure/backstage/backstageIndex.jsp' />"> 管理員 </a>
					</c:if>
				</div>
	</td>
		<td class='menuData'>
				<div class='menu'>
					<c:if test="${LoginOK }">
						<a href="<c:url value='/secure/author/authorIndex.jsp' />"> 專欄作家  </a>
					</c:if>
				</div>
	</td>
	<td>
	<div style="width:3em"></div>
	<div id="google_translate_element" align=right style="width:100%"></div>
	</td>
</tr>
</tbody>
</table>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<!-- 標題 END -->
</center>

</html>