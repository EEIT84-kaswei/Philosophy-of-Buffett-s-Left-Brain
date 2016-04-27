<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>籌碼分析</title>
<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet' type='text/css'><script type="text/javascript">var _jf = _jf || [];_jf.push(['p','41723']);_jf.push(['_setFont','wt011','css','.wt011']);_jf.push(['_setFont','wt011','alias','wt011']);_jf.push(['_setFont','wt011','english','Asap']);_jf.push(['_setFont','wt011','weight',400]);(function(f,q,c,h,e,i,r,d){var k=f._jf;if(k.constructor===Object){return}var l,t=q.getElementsByTagName("html")[0],a=function(u){for(var v in k){if(k[v][0]==u){if(false===k[v][1].call(k)){break}}}},j=/\S+/g,o=/[\t\r\n\f]/g,b=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,g="".trim,s=g&&!g.call("\uFEFF\xA0")?function(u){return u==null?"":g.call(u)}:function(u){return u==null?"":(u+"").replace(b,"")},m=function(y){var w,z,v,u,x=typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):" ";if(z){u=0;while((v=w[u++])){if(z.indexOf(" "+v+" ")<0){z+=v+" "}}t[c]=s(z)}}},p=function(y){var w,z,v,u,x=arguments.length===0||typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):"";if(z){u=0;while((v=w[u++])){while(z.indexOf(" "+v+" ")>=0){z=z.replace(" "+v+" "," ")}}t[c]=y?s(z):""}}},n;k.push(["_eventActived",function(){p(h);m(e)}]);k.push(["_eventInactived",function(){p(h);m(i)}]);k.addScript=n=function(u,A,w,C,E,B){E=E||function(){};B=B||function(){};var x=q.createElement("script"),z=q.getElementsByTagName("script")[0],v,y=false,D=function(){x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;a("_eventInactived");B()};if(C){v=setTimeout(function(){D()},C)}x.type=A||"text/javascript";x.async=w;x.onload=x.onreadystatechange=function(G,F){if(!y&&(!x.readyState||/loaded|complete/.test(x.readyState))){y=true;if(C){clearTimeout(v)}x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;if(!F){setTimeout(function(){E()},200)}}};x.onerror=function(H,G,F){if(C){clearTimeout(v)}D();return true};x.src=u;z.parentNode.insertBefore(x,z)};a("_eventPreload");m(h);n(r,"text/javascript",false,3000)})(this,this.document,"className","jf-loading","jf-active","jf-inactive","//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");</script>
<!-- **************************************** CSS開始   ***************************************************** -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" /> -->
<style type="text/css">

/*分類股表格設定*/
/* #stockTypeTable { */
/* 	width: 100%; */
/* 	border: 0px solid #BEBEBE; /*測完要改顏色*/ */
/* 	border-collapse: collapse; /*把內外框的距離清掉*/ */
/* 	margin: 0 auto; */
/* } */

/* #stockTypeTable th { */
/* 	border: 1px solid #BEBEBE; */
/* 	text-align: center; */
/* 	height: 35px; */

/* } */

/* #stockTypeTable td { */
/* 	border: 1px solid #BEBEBE; */
/* 	text-align: center; */
/* 	height: 35px; */
/* 	color:#333333; */
/* 	font-weight: bold; */
/* } */

 #stockTypeTable tbody:hover { 
 	background-color: #FFE6D9; 
 	font-color: yellow; 
 } 

 #tbody tr:hovor { 
 	background-color: #fff; 
 	font-color: yellow; 
 } 

	#stockTypeTable th, tr,td{
	 border:1px groove #000000;
	font-size:120%
	}
</style>

<!-- **************************************** 網頁抬頭   ******************************************************* -->
<title>籌碼分析</title>
<!-- **************************************** 網頁抬頭  結束 ***************************************************** -->
</head>
<!-- **************************************** body開始  ******************************************************* -->
<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>


	<!-- ************************************** 內文DIV開始  ***************************************************** -->
	<div class="table-responsive" style="max-width:80em;margin: 30px auto;">
	
	<!-- **************************************表格開始*********************************************** -->
		<table id="stockTypeTable" class="table" style="border: 1px solid black; background-color:rgba(250, 250, 250, 0.8)">
			<thead>
				<tr style="border: 1px solid black;">
					<td colspan="9"
						style="background-color: rgba(102, 102, 153, 0.8); height: 28px; margin:30px">
						<center><font style="color: white;font-family: wt011;font-size:150%">籌碼分析</font></center>
					</td>
				</tr>
				<tr>
					<td colspan="9" style="height: 20px;"></td>
				</tr>
				<tr style="height:40px; background: #ccccff">
					
					<th>股票代碼</th>
					<th>股票名稱</th>
					<th>券商重押>30%</th>
					<th>TOP券商買超>500張<br>超額買超>4倍</th>
					<th>短線籌碼集中<br>一日集中>20%</th>
					<th>外資連買>3天<br>買超>1000張</th>
					<th>投信連買>3天<br>買超>1000張</th>
					
				</tr>
			</thead>

			<tbody>

				
				<c:forEach var="data" items="${beanS}">
					<tr style="border: 1.5px solid black;">
						<td>${data.stock_Code}</td>			
						<td>${data.stock_Name}</td>
						<c:choose>
						<c:when test="${data.index1 eq '符合'}">
							<td style="color:red;">${data.index1}</td>
						</c:when>						
						<c:otherwise>
							<td>${data.index1}</td>
						</c:otherwise>						
						</c:choose>	
						<c:choose>
						<c:when test="${data.index2 eq '符合'}">
							<td style="color:red;">${data.index2}</td>
						</c:when>						
						<c:otherwise>
							<td>${data.index2}</td>
						</c:otherwise>						
						</c:choose>			
						<c:choose>
						<c:when test="${data.index3 eq '符合'}">
							<td style="color:red;">${data.index3}</td>
						</c:when>						
						<c:otherwise>
							<td>${data.index3}</td>
						</c:otherwise>						
						</c:choose>			
						<c:choose>
						<c:when test="${data.index4 eq '符合'}">
							<td style="color:red;">${data.index4}</td>
						</c:when>						
						<c:otherwise>
							<td>${data.index4}</td>
						</c:otherwise>						
						</c:choose>			
						<c:choose>
						<c:when test="${data.index5 eq '符合'}">
							<td style="color:red;">${data.index5}</td>
						</c:when>						
						<c:otherwise>
							<td>${data.index5}</td>
						</c:otherwise>						
						</c:choose>								
					</tr>					

				</c:forEach>
			</tbody>

		</table>
		<!-- ************************************** 表格結束   *************************************************** -->

	</div>
	<!-- ************************************** 內文DIV結束  ***************************************************** -->


</body>
<!-- ************************************** body結束  ********************************************************* -->

<!-- ************************************** JavaScript ***************************************************** -->
</html>