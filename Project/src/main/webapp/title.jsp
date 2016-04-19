<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">

body{
/* background-color:#FFE8E8; */
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


	<!-- 標題 START -->
<center>	
	<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'zh-TW',
			includedLanguages : 'ru,uk,en,ja,ko,zh-TW,fr,de,it,es,th,vi,ar-sa,gd-ie,yi,zu,sw,ts,tr'
		}, 'google_translate_element');
	}
</script>


<table>
<tbody>
<tr>
	<td>
		<div id="logoimg">
			<a href="<c:url value='/index.jsp'/>"><img src="<%=request.getContextPath() %>/img/logo2.png" style="float: left; height: 100px;"></a>
		</div>
	</td>
	<td style="padding:0 2em">
			<h1>巴菲特的左腦哲學</h1>
			<font size="1px">EEIT84 project | Philosophy of Buffett's Left Brain</font>
	</td>
	
	
<!-- 	<td style="padding:0 2em"> -->
<!-- 				<div class='menu'> -->
<%-- 					<c:if test="${empty LoginOK }"> --%>
<%-- 						<a href="<c:url value='/pages/_02_login/login.jsp' />"> 登入 </a> --%>
<%-- 					</c:if> --%>
<!-- 				</div> -->

<!-- 				<div class='menu'> -->
<%-- 					<c:if test="${!empty LoginOK }"> --%>
<%-- 						<a href="<c:url value='/_02_login/logout.jsp' />"> 登出 </a> --%>
<%-- 					</c:if> --%>
<!-- 				</div> -->

<!-- 				<div class='menu'> -->
<%-- 					<c:if test="${LoginOK }"> --%>
<%-- 						<a href="<c:url value='/secure/backstage/backstageIndex.jsp' />"> 管理員 </a> --%>
<%-- 					</c:if> --%>
<!-- 				</div> -->

<!-- 				<div class='menu'> -->
<%-- 					<c:if test="${LoginOK }"> --%>
<%-- 						<a href="<c:url value='/secure/author/authorIndex.jsp' />"> 專欄作家  </a> --%>
<%-- 					</c:if> --%>
<!-- 				</div> -->
<!-- 	</td> -->
	<td>
	<div style="width:3em"></div>
	<div id="google_translate_element" align=right style="width:100%"></div>
	</td>
	<td>
		<div style="margin:0 7em">

         </div>
	</td>
</tr>
</tbody>
</table>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<!-- 標題 END -->
</center>

