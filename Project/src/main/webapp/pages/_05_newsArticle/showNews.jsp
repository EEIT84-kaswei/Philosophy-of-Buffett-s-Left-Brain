<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet' type='text/css'><script type="text/javascript">var _jf = _jf || [];_jf.push(['p','41723']);_jf.push(['_setFont','wt011','css','.wt011']);_jf.push(['_setFont','wt011','alias','wt011']);_jf.push(['_setFont','wt011','english','Asap']);_jf.push(['_setFont','wt011','weight',400]);(function(f,q,c,h,e,i,r,d){var k=f._jf;if(k.constructor===Object){return}var l,t=q.getElementsByTagName("html")[0],a=function(u){for(var v in k){if(k[v][0]==u){if(false===k[v][1].call(k)){break}}}},j=/\S+/g,o=/[\t\r\n\f]/g,b=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,g="".trim,s=g&&!g.call("\uFEFF\xA0")?function(u){return u==null?"":g.call(u)}:function(u){return u==null?"":(u+"").replace(b,"")},m=function(y){var w,z,v,u,x=typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):" ";if(z){u=0;while((v=w[u++])){if(z.indexOf(" "+v+" ")<0){z+=v+" "}}t[c]=s(z)}}},p=function(y){var w,z,v,u,x=arguments.length===0||typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):"";if(z){u=0;while((v=w[u++])){while(z.indexOf(" "+v+" ")>=0){z=z.replace(" "+v+" "," ")}}t[c]=y?s(z):""}}},n;k.push(["_eventActived",function(){p(h);m(e)}]);k.push(["_eventInactived",function(){p(h);m(i)}]);k.addScript=n=function(u,A,w,C,E,B){E=E||function(){};B=B||function(){};var x=q.createElement("script"),z=q.getElementsByTagName("script")[0],v,y=false,D=function(){x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;a("_eventInactived");B()};if(C){v=setTimeout(function(){D()},C)}x.type=A||"text/javascript";x.async=w;x.onload=x.onreadystatechange=function(G,F){if(!y&&(!x.readyState||/loaded|complete/.test(x.readyState))){y=true;if(C){clearTimeout(v)}x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;if(!F){setTimeout(function(){E()},200)}}};x.onerror=function(H,G,F){if(C){clearTimeout(v)}D();return true};x.src=u;z.parentNode.insertBefore(x,z)};a("_eventPreload");m(h);n(r,"text/javascript",false,3000)})(this,this.document,"className","jf-loading","jf-active","jf-inactive","//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");</script>	

<title>Show News</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("確定刪除此項新聞資料(編號:${select.nno})?")) {
			document.forms[0].action = "<c:url value='/pages/_05_newsArticle/news.do?nno=${select.nno}' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		} else {
		}
	}	
</script>
</head>
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>
	
	<% response.setCharacterEncoding("UTF-8"); %>

	<div style="margin: 2em auto; padding: 2em;background-color: rgba(204, 204, 204, 0.99);max-width:60em">	
		<form action="<c:url value="/pages/_05_newsArticle/news.do"/>" method="post">
			<input type="hidden" name="updtno" value="${select.nno}">
			<h2 style="text-align:center;color:#008080;font-family: wt011">${select.ntitle}</h2>
			<fmt:formatDate var="time" value="${select.ntime}" type="both" dateStyle="long" pattern="yyyy年MM月dd日  HH:mm"/>
			<p style="text-align:center;color:#999999">${time}</p>
			<br>
			<div style="max-width:58em;margin:0 auto;padding:0 10px">
				<p>${select.ncontext}</p>
			</div>
			
			<c:if test='<%=request.isUserInRole("admin")%>'>
				<div align=center>
					<input type="submit" name="prodaction" value="修改" class="btn btn-default"/>
					&nbsp;&nbsp;&nbsp; 
					<input type="button" name="delete" value="刪除" class="btn btn-default" onclick="confirmDelete()" />
				</div>
			</c:if>
	</form>
</div>
</body>
</html>
