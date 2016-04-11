<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="freemarker.template.SimpleDate"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="css/bootstrap.min.css" > -->

<head>
<script src="js/bootstrap.min.js"></script>
<title>歡迎頁面</title>


</head>

<body style="margin:0em 3em">
<div class="container">
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>
<!-- 主畫面 -->
<div align=center style="height:20px;width:200px;margin:15em 5em;padding:3em auto">
<jsp:include page="/defaultView.jsp" />
</div>


<!-- 
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>台灣股票<br>加權指數<br>我想睡覺&nbsp; 
			</td>

			<td>
			<div id="google_translate_element">
			台灣股票
			</div> &nbsp;
			</td>
		</tr>
	</table>
 -->

<%-- <%@ page language="java" contentType="text/html;charset=UTF-8" --%>
<%-- pageEncoding="UTF-8" import="java.util.Date" import="java.text.SimpleDateFormat" %> --%>

<%-- <% --%>
<!-- // Date date = new Date(); -->
<%-- %> --%>
<%-- <%= date %> --%>

</div>



</body>
</html>
