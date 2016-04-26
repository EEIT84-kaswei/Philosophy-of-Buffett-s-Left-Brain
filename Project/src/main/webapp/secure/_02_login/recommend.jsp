<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet' type='text/css'><script type="text/javascript">var _jf = _jf || [];_jf.push(['p','41723']);_jf.push(['_setFont','wt011','css','.wt011']);_jf.push(['_setFont','wt011','alias','wt011']);_jf.push(['_setFont','wt011','english','Asap']);_jf.push(['_setFont','wt011','weight',400]);(function(f,q,c,h,e,i,r,d){var k=f._jf;if(k.constructor===Object){return}var l,t=q.getElementsByTagName("html")[0],a=function(u){for(var v in k){if(k[v][0]==u){if(false===k[v][1].call(k)){break}}}},j=/\S+/g,o=/[\t\r\n\f]/g,b=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,g="".trim,s=g&&!g.call("\uFEFF\xA0")?function(u){return u==null?"":g.call(u)}:function(u){return u==null?"":(u+"").replace(b,"")},m=function(y){var w,z,v,u,x=typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):" ";if(z){u=0;while((v=w[u++])){if(z.indexOf(" "+v+" ")<0){z+=v+" "}}t[c]=s(z)}}},p=function(y){var w,z,v,u,x=arguments.length===0||typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):"";if(z){u=0;while((v=w[u++])){while(z.indexOf(" "+v+" ")>=0){z=z.replace(" "+v+" "," ")}}t[c]=y?s(z):""}}},n;k.push(["_eventActived",function(){p(h);m(e)}]);k.push(["_eventInactived",function(){p(h);m(i)}]);k.addScript=n=function(u,A,w,C,E,B){E=E||function(){};B=B||function(){};var x=q.createElement("script"),z=q.getElementsByTagName("script")[0],v,y=false,D=function(){x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;a("_eventInactived");B()};if(C){v=setTimeout(function(){D()},C)}x.type=A||"text/javascript";x.async=w;x.onload=x.onreadystatechange=function(G,F){if(!y&&(!x.readyState||/loaded|complete/.test(x.readyState))){y=true;if(C){clearTimeout(v)}x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;if(!F){setTimeout(function(){E()},200)}}};x.onerror=function(H,G,F){if(C){clearTimeout(v)}D();return true};x.src=u;z.parentNode.insertBefore(x,z)};a("_eventPreload");m(h);n(r,"text/javascript",false,3000)})(this,this.document,"className","jf-loading","jf-active","jf-inactive","//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");</script>

<title>推薦</title>

<style type="text/css">
#mainDIV{



	/*border:1px blue solid;*/
	/*height:15em;*/
	margin:1em;
	padding:1em;
	align:center;
}
ol li a{
	color:blue;
}
</style>
</head>
<body>

<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />



<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>

<div align="center" id="mainDIV" style="background-color:rgba(255, 255, 255, 0.8);max-width:520px;margin:60px auto;padding:20px">

<h3 align="center" style="font-family: wt011;">推薦股票</h3>

	<div style="font-size:130%">
	
	根據您填寫的風險問卷，您的得分為：(${oldScores})
	<br>
	您屬於積極型。
	<br>
	據此，本網站推薦您選擇下列幾種股票，供您參考。
	<br>	
	<ol>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c1&send=送出"></c:url>'>生技醫療類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c11&send=送出"></c:url>'>生質能源類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c8&send=送出"></c:url>'>VR虛擬實境概念股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c13&send=送出"></c:url>'>電子3C類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c5&send=送出"></c:url>'>蘋果供應鏈類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c3&send=送出"></c:url>'>物聯網類股</a></li>
		<li><a href='<c:url value="/secure/conceptStock.view?concept_Stock=c14&send=送出"></c:url>'>能源類股</a></li>	
	</ol>
	</div>


</div>



</body>
</html>
