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

<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet' type='text/css'><script type="text/javascript">var _jf = _jf || [];_jf.push(['p','41723']);_jf.push(['_setFont','wt011','css','.wt011']);_jf.push(['_setFont','wt011','alias','wt011']);_jf.push(['_setFont','wt011','english','Asap']);_jf.push(['_setFont','wt011','weight',400]);(function(f,q,c,h,e,i,r,d){var k=f._jf;if(k.constructor===Object){return}var l,t=q.getElementsByTagName("html")[0],a=function(u){for(var v in k){if(k[v][0]==u){if(false===k[v][1].call(k)){break}}}},j=/\S+/g,o=/[\t\r\n\f]/g,b=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,g="".trim,s=g&&!g.call("\uFEFF\xA0")?function(u){return u==null?"":g.call(u)}:function(u){return u==null?"":(u+"").replace(b,"")},m=function(y){var w,z,v,u,x=typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):" ";if(z){u=0;while((v=w[u++])){if(z.indexOf(" "+v+" ")<0){z+=v+" "}}t[c]=s(z)}}},p=function(y){var w,z,v,u,x=arguments.length===0||typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):"";if(z){u=0;while((v=w[u++])){while(z.indexOf(" "+v+" ")>=0){z=z.replace(" "+v+" "," ")}}t[c]=y?s(z):""}}},n;k.push(["_eventActived",function(){p(h);m(e)}]);k.push(["_eventInactived",function(){p(h);m(i)}]);k.addScript=n=function(u,A,w,C,E,B){E=E||function(){};B=B||function(){};var x=q.createElement("script"),z=q.getElementsByTagName("script")[0],v,y=false,D=function(){x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;a("_eventInactived");B()};if(C){v=setTimeout(function(){D()},C)}x.type=A||"text/javascript";x.async=w;x.onload=x.onreadystatechange=function(G,F){if(!y&&(!x.readyState||/loaded|complete/.test(x.readyState))){y=true;if(C){clearTimeout(v)}x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;if(!F){setTimeout(function(){E()},200)}}};x.onerror=function(H,G,F){if(C){clearTimeout(v)}D();return true};x.src=u;z.parentNode.insertBefore(x,z)};a("_eventPreload");m(h);n(r,"text/javascript",false,3000)})(this,this.document,"className","jf-loading","jf-active","jf-inactive","//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");</script>

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
		<div style="background-color: rgba(255, 255, 255, 0.5);width:200px;display: inline;padding:5px 20px 0 20px;margin:0 10px 0 0;height:50px">
		<c:url var="engURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="en_US" />
		</c:url>
		<a href="${engURL}"><font style="font-family: wt011;font-size:150%;color:black">English</font></a>
		</div>
		<div style="background-color: rgba(255, 255, 255, 0.5);width:200px;display: inline;padding:5px 20px 0 20px;margin:0 10px 0 0;height:50px">
		<c:url var="chineseURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="zh_TW" />
		</c:url>
		<a href="${chineseURL}"><font style="font-family: wt011;font-size:160%;color:black;">中文</font></a>
		</div>
		<div style="background-color: rgba(255, 255, 255, 0.5);width:200px;display: inline;padding:5px 20px 0 20px;margin:0 10px 0 0;height:50px">
		<c:url var="chineseURL" value="">
			<c:forEach var="args" items="${param}">
				<c:if test='${args.key ne "locale"}'>
					<c:param name="${args.key}" value="${args.value}"/>
				</c:if>
			</c:forEach>
			<c:param name="locale" value="ru_RU" />
		</c:url>
		<a href="${chineseURL}"><font style="font-family: wt011;font-size:160%;color:black;">русский</font></a>
		</div>
	<!-- 標題 END -->
</center>

