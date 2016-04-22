<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">

body{
/* background-color:#FFE8E8; */
}

ul,li {
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
<div style="max-width:80%;margin:0 3em" class="container">
	<ul>
		<li id="logoimg">
			<a href="<c:url value='/index.jsp'/>">
			<img src="<%=request.getContextPath() %>/img/logo2.png" style="float: left; max-height: 90px" class="hidden-xs">
			</a>
		</li>
		<li>
			<img src="<%=request.getContextPath() %>/img/EEIT84TITLE.png" style="max-width:700" class="img-responsive"/>
        </li>
		<li id="google_translate_element" style="float:right;margin:0 2em">
		</li>
	</ul>
</div>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<!-- 標題 END -->
</center>

