<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet' type='text/css'><script type="text/javascript">var _jf = _jf || [];_jf.push(['p','41723']);_jf.push(['_setFont','wt011','css','.wt011']);_jf.push(['_setFont','wt011','alias','wt011']);_jf.push(['_setFont','wt011','english','Asap']);_jf.push(['_setFont','wt011','weight',400]);(function(f,q,c,h,e,i,r,d){var k=f._jf;if(k.constructor===Object){return}var l,t=q.getElementsByTagName("html")[0],a=function(u){for(var v in k){if(k[v][0]==u){if(false===k[v][1].call(k)){break}}}},j=/\S+/g,o=/[\t\r\n\f]/g,b=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,g="".trim,s=g&&!g.call("\uFEFF\xA0")?function(u){return u==null?"":g.call(u)}:function(u){return u==null?"":(u+"").replace(b,"")},m=function(y){var w,z,v,u,x=typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):" ";if(z){u=0;while((v=w[u++])){if(z.indexOf(" "+v+" ")<0){z+=v+" "}}t[c]=s(z)}}},p=function(y){var w,z,v,u,x=arguments.length===0||typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):"";if(z){u=0;while((v=w[u++])){while(z.indexOf(" "+v+" ")>=0){z=z.replace(" "+v+" "," ")}}t[c]=y?s(z):""}}},n;k.push(["_eventActived",function(){p(h);m(e)}]);k.push(["_eventInactived",function(){p(h);m(i)}]);k.addScript=n=function(u,A,w,C,E,B){E=E||function(){};B=B||function(){};var x=q.createElement("script"),z=q.getElementsByTagName("script")[0],v,y=false,D=function(){x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;a("_eventInactived");B()};if(C){v=setTimeout(function(){D()},C)}x.type=A||"text/javascript";x.async=w;x.onload=x.onreadystatechange=function(G,F){if(!y&&(!x.readyState||/loaded|complete/.test(x.readyState))){y=true;if(C){clearTimeout(v)}x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;if(!F){setTimeout(function(){E()},200)}}};x.onerror=function(H,G,F){if(C){clearTimeout(v)}D();return true};x.src=u;z.parentNode.insertBefore(x,z)};a("_eventPreload");m(h);n(r,"text/javascript",false,3000)})(this,this.document,"className","jf-loading","jf-active","jf-inactive","//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");</script>
<title>風險屬性問卷</title>
</head>
<body style="background-color: #fff">

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />



	<!-- 網頁主要導覽列 -->
	<div>
		<jsp:include page="/nav.jsp" />
	</div>
	<div style="background-color:rgba(0, 0, 102,0.7);width:280px;margin:2px auto">
	<H2 align="center" style="color: pink;font-family: wt011;">風險屬性問卷</H2>
	</div>
	<div style="margin:0 auto;max-width:50em;align:center">
		<form action="<c:url value='/secure/_02_login.controller/QuestionServlet?insert=new' />"
			method="POST">
			<form role="form">
					<div class="form-group" style="background-color:#94b8b8;padding:20px;margin-bottom:0">
						<p>1.客戶年齡層？</p>
						<label>
							<select class="form-control" name="question1">
								<option value="1"><c:if test="${param.question1 eq '1'}"></c:if>70歲以上/未滿20歲</option>
								<option value="2"><c:if test="${param.question1 eq '2'}"></c:if>60至69歲</option>
								<option value="3"><c:if test="${param.question1 eq '3'}"></c:if>50至59歲</option>
								<option value="4"><c:if test="${param.question1 eq '4'}"></c:if>40至49歲</option>
								<option value="5"><c:if test="${param.question1 eq '5'}"></c:if>20至39歲</option>
							</select>
						</label>
						<label style="color: red">
							<span class="error">${error.question1}</span>
						</label>
					</div>
					
					<div class="form-group" style="background-color:#d1e0e0;padding:20px;margin-bottom:0">
					<p>2.投資經驗（包含投資股票、基金、外幣、黃金、期貨……等產品）？</p>
					<label>
						<select class="form-control" name="question2">
  						<option value="1"><c:if test="${param.question2 eq '1'}"></c:if>無投資經驗或新手</option>
						<option value="2"><c:if test="${param.question2 eq '2'}"></c:if>1年以下</option>
						<option value="3"><c:if test="${param.question2 eq '3'}"></c:if>1~3年</option>
						<option value="4"><c:if test="${param.question2 eq '4'}"></c:if>3~5年</option>
						<option value="5"><c:if test="${param.question2 eq '5'}"></c:if>5年以上</option>
						</select>
					</label>
					<label style="color: red">
						<span class="error">${error.question2}</span>
					</label>
					</div>
					
					<div class="form-group" style="background-color:#94b8b8;padding:20px;margin-bottom:0">
					<p>3.個人/家庭月收入中有多少比例可用於投資或儲蓄？</p>
					<label>
						<select class="form-control" name="question3">
							<option value="1"><c:if test="${param.question3 eq '1'}"></c:if>5%以下</option>
							<option value="2"><c:if test="${param.question3 eq '2'}"></c:if>5%~10%</option>
							<option value="3"><c:if test="${param.question3 eq '3'}"></c:if>10%~20%</option>
							<option value="4"><c:if test="${param.question3 eq '4'}"></c:if>20%~30%</option>
							<option value="5"><c:if test="${param.question3 eq '5'}"></c:if>30%以上</option>
						</select>
					</label>
					<label style="color: red">
						<span class="error">${error.question3}</span>
					</label>
					</div>
					
					<div class="form-group" style="background-color:#d1e0e0;padding:20px;margin-bottom:0">
					<p>4.可承受投資風險之程度資產的市值可能會上升或下降，就您所期望平均年投資報酬率是多少？（以投資100萬元為例）</p>
					<label>
						<select class="form-control" name="question5" >
						  	<option value="1"><c:if test="${param.question5 eq '1'}"></c:if>1%~2%（每年希望獲利1~2萬元）</option>
						  	<option value="2"><c:if test="${param.question5 eq '2'}"></c:if>3%~5%（每年希望獲利3~5萬元）</option>
						  	<option value="3"><c:if test="${param.question5 eq '3'}"></c:if>6%~8%（每年希望獲利6~8萬元）</option>
						  	<option value="4"><c:if test="${param.question5 eq '4'}"></c:if>9%~12%（每年希望獲利9~12萬元）</option>
						  	<option value="5"><c:if test="${param.question5 eq '5'}"></c:if>12%以上（每年希望獲利12萬元以上）</option>
						</select>
					</label>
					<label style="color: red">
						<span class="error">${error.question5}</span>
					</label>
					</div>
					
					<div class="form-group" style="background-color:#94b8b8;padding:20px;margin-bottom:0">
					<p>5.可承受投資風險之程度資產的市值可能會上升或下降，就您所能承受每年最大投資損失是多少？（以投資100萬元為例）</p>
						<label>
						<select class="form-control" name="question6" >
						  	<option value="1"><c:if test="${param.question6 eq '1'}"></c:if>1%~2%（每年可接受損失1~2萬元）</option>
						  	<option value="2"><c:if test="${param.question6 eq '2'}"></c:if>3%~5%（每年可接受損失3~5萬元）</option>
						  	<option value="3"><c:if test="${param.question6 eq '3'}"></c:if>6%~8%（每年可接受損失6~8萬元）</option>
						  	<option value="4"><c:if test="${param.question6 eq '4'}"></c:if>9%~12%（每年可接受損失9~12萬元）</option>
					  		<option value="5"><c:if test="${param.question6 eq '5'}"></c:if>12%以上（每年可接受損失12萬元以上）</option>
						</select>
						</label>
					<label style="color: red">
						<span class="error">${error.question6}</span>
					</label>
					</div>
					
					<div class="form-group" style="background-color:#d1e0e0;padding:20px;margin-bottom:0">
					<p>6. 請問您曾經投資過那些金融商品(可複選)？(必答)</p>
					
						<label class="checkbox-inline">
					  	<input type="checkbox" name="question4" id="inlineCheckbox1" value="1"
							<c:forEach var="aVar" items="${paramValues.question4}">
							<c:if test="${aVar eq '1'}">checked="checked"</c:if>							
							</c:forEach>>台外幣存款、貨幣型基金、儲蓄型保險或不曾投資過<br>
						</label>
						<br>
						<label class="checkbox-inline">
						  <input type="checkbox" name="question4" id="inlineCheckbox2" value="2"
							<c:forEach var="aVar" items="${paramValues.question4}">
							<c:if test="${aVar eq '2'}">checked="checked"</c:if>							
							</c:forEach>>債券、債券型基金<br>
						</label>
						<br>
						
						<label class="checkbox-inline">
						  <input type="checkbox"  name="question4" id="inlineCheckbox3" value="3"
							<c:forEach var="aVar" items="${paramValues.question4}">
							<c:if test="${aVar eq '3'}">checked="checked"</c:if>							
							</c:forEach>>股票、股票型基金、ETF<br>
						</label>
						<br>
						
						<label class="checkbox-inline">
						  <input type="checkbox" name="question4" id="inlineCheckbox3" value="4"
							<c:forEach var="aVar" items="${paramValues.question4}">
							<c:if test="${aVar eq '4'}">checked="checked"</c:if>							
						</c:forEach>>結構型商品、投資型保單<br>
						</label>
						<br>
						
						<label class="checkbox-inline">
							<input type="checkbox" name="question4" id="inlineCheckbox1" value="5"
							<c:forEach var="aVar" items="${paramValues.question4}">
							<c:if test="${aVar eq '5'}">checked="checked"</c:if>							
							</c:forEach>>期貨、選擇權或其他衍生性金融商品<br>
						</label>
					</label>
					<label style="color: red"><span class="error">${error.question4}</span></label>

					</div>
			<center>
			<input type="submit" value="送出" class="btn btn-default" style="margin:20px auto">
			</center>
		</form>
		</form>
	</div>



</body>
</html>
