<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 匯入bootstrap -->
 	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">	 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> 


<!-- 匯入jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  
  
<!-- 匯入bootstrap javascript -->
  <script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
   <link href="<%=request.getContextPath() %>/css/jquery-ui.css" rel="stylesheet">
  <link href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css" rel="stylesheet">
<!--   <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.0.min.js"></script> -->
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/jquery-ui.min.js"></script>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>  
  
<style type="text/css">

body{
/* background-color:#FFE8E8; */
}

#google_translate_element {
	font-size: 20px;
	color: purple;
	display:inline;
 	float:right; 
}
#titleMark{
	font-size: 20px;
	color: purple;
	display:inline;
	float:left; 
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
			<a href="<c:url value='/index.jsp'/>">
			<img src="<%=request.getContextPath() %>/img/EEIT84-titleIMG.png" style="max-width:700" class="img-responsive"/>
        	</a>
        </li>
		<li id="google_translate_element">
		</li>
	</ul>
</div>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<!-- 標題 END -->
</center>

