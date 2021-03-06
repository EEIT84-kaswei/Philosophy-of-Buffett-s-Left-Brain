<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 匯入jQuery JS-->
<script src="<%=request.getContextPath() %>/js/jquery-1.12.3.js"></script>

<!-- 匯入jQuery UI CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">

<!-- 匯入bootstrap JS -->
<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>

<!-- 匯入bootstrap CSS-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">	 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-theme.css">	 

<!-- 匯入jQuery DataTable JS -->
<script src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>
<%-- <script src="<%=request.getContextPath() %>/js/dataTables.foundation.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/js/dataTables.jqueryui.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/js/dataTables.bootstrap.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/js/dataTables.material.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/js/dataTables.semanticul.js"></script> --%>
<%--   <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.0.min.js"></script> --%>
<%--   <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/jquery-ui.min.js"></script> --%>
  
<!-- 匯入dataTable CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.dataTables.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.foundation.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.jqueryui.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.bootstrap.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.material.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.semanticui.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.uikit.css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.dataTables_themeroller.css"> --%>

<style type="text/css">

body{
/* background-color:#FFE8E8; */
}

#google_translate_element, #titleMark {
	font-size: 20px;
	color: purple;
	display:inline;
}

#fl_right {
	float: right;
}

#fl_right.li {
	text-align: right;
}
</style>


	<!-- 標題 START -->
	
	<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'zh-TW',
			includedLanguages : 'ru,uk,en,ja,ko,zh-TW,fr,de,it,es,th,vi,ar-sa,gd-ie,yi,zu,sw,ts,tr'
		}, 'google_translate_element');
	}
</script>
<script type="text/javascript">
$('document').ready(function(){
    $('#container').height($(window).height());    
}); 
</script>
<center>
<div class="container">
	<ul style="display:inline">
		<li id="titleMark">
			<a href="<c:url value='/Welcome.jsp' />">
			<img src="<%=request.getContextPath() %>/img/Examples01.png" style="width:35em" class="img-responsive"/>
        	</a>
        </li>
		<li id="google_translate_element" style="float:right;">
		</li>
	</ul>
</div>
<!-- <script type="text/javascript" -->
<!-- 	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> -->

	<div >
		<div style="background-color: rgba(255, 255, 255, 0.6);width:120px;display: inline;padding:5px 5px 0 5px;margin:0 8px 0 0;height:50px">
		<c:url var="engURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="en_US" />
		</c:url>
		<a href="${engURL}"><font style="font-size:110%;color:black">English</font></a>
		</div>
		<div style="background-color: rgba(255, 255, 255, 0.6);width:90px;display: inline;padding:5px 5px 0 5px;margin:0 8px 0 0;height:50px">
		<c:url var="chineseURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="zh_TW" />
		</c:url>
		<a href="${chineseURL}"><font style="font-size:120%;color:black;">中文</font></a>
		</div>
		<div style="background-color: rgba(255, 255, 255, 0.6);width:130px;display: inline;padding:5px 5px 0 5px;margin:0 8px 0 0;height:50px">
		<c:url var="russianURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="ru_RU" />
		</c:url>
		<a href="${russianURL}"><font style="font-size:110%;color:black;">русский</font></a>
		</div>
				<div style="background-color: rgba(255, 255, 255, 0.6);width:140px;display: inline;padding:5px 5px 0 5px;margin:0 0px 0 0;height:50px">
		<c:url var="japaneseURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="ja_JP" />
		</c:url>
		<a href="${japaneseURL}"><font style="font-size:120%;color:black;">日本語</font></a>
		</div>
		
	</div>	
	<!-- 標題 END -->
</center>

