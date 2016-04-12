<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>風險屬性問卷</title>
<style type="text/css">
#midTable {
	width: 80%
}

#middleTable {
	border: 1px gray solid;
}
</style>
<script type="text/javascript">
	function doOnclick() {
		alert("您已送出問卷");
		//這只是demo用的
	}
</script>

</head>
<body style="margin: 0em 3em">
	<div class="container">
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />


		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>
		<H2 align=center>風險屬性問卷</H2>
		<div align=center id="midTable">
			<form
				action="<c:url value='/_02_login.controller/QuestionServlet' />"
				method="POST">
				<table id="middleTable">
					<tr>
						<td>1.客戶年齡層？<br></td>
						<td><input type="radio" name="question1" value="1"
							<c:if test="${param.question1 eq '1'}">checked</c:if>>70歲以上/未滿20歲<br></td>
						<td><input type="radio" name="question1" value="2"
							<c:if test="${param.question1 eq '2'}">checked</c:if>>60至69歲<br></td>
						<td><input type="radio" name="question1" value="3"
							<c:if test="${param.question1 eq '3'}">checked</c:if>>50至59歲<br></td>
						<td><input type="radio" name="question1" value="4"
							<c:if test="${param.question1 eq '4'}">checked</c:if>>40至49歲<br></td>
						<td><input type="radio" name="question1" value="5"
							<c:if test="${param.question1 eq '5'}">checked</c:if>>20至39歲<br></td>
						<td style="color: red"><span class="error">${error.question1}</span></td>
					</tr>
					<tr>
						<td>2.投資經驗（包含投資股票、基金、外幣、黃金、期貨……等產品）？<br></td>
						<td><input type="radio" name="question2" value="1"
							<c:if test="${param.question2 eq '1'}">checked</c:if>>無投資經驗或新手<br></td>
						<td><input type="radio" name="question2" value="2"
							<c:if test="${param.question2 eq '2'}">checked</c:if>>1年以下<br></td>
						<td><input type="radio" name="question2" value="3"
							<c:if test="${param.question2 eq '3'}">checked</c:if>>1~3年<br></td>
						<td><input type="radio" name="question2" value="4"
							<c:if test="${param.question2 eq '4'}">checked</c:if>>3~5年<br></td>
						<td><input type="radio" name="question2" value="5"
							<c:if test="${param.question2 eq '5'}">checked</c:if>>5年以上<br></td>
						<td style="color: red"><span class="error">${error.question2}</span></td>
					</tr>
					<tr>
						<td>3.個人/家庭月收入中有多少比例可用於投資或儲蓄？<br></td>
						<td><input type="radio" name="question3" value="1"
							<c:if test="${param.question3 eq '1'}">checked</c:if>>5%
							以下<br></td>
						<td><input type="radio" name="question3" value="2"
							<c:if test="${param.question3 eq '2'}">checked</c:if>>5%~10%<br></td>
						<td><input type="radio" name="question3" value="3"
							<c:if test="${param.question3 eq '3'}">checked</c:if>>10%~20%<br></td>
						<td><input type="radio" name="question3" value="4"
							<c:if test="${param.question3 eq '4'}">checked</c:if>>20%~30%<br></td>
						<td><input type="radio" name="question3" value="5"
							<c:if test="${param.question3 eq '5'}">checked</c:if>>30%
							以上<br></td>
						<td style="color: red"><span class="error">${error.question3}</span></td>
					</tr>
					<tr>
						<td>4. 請問您曾經投資過那些金融商品(可複選)？<br>
						<td><input type="checkbox" name="question4" value="1"
							<c:forEach var="aVar" items="${paramValues.question4}">
						<c:if test="${aVar eq '1'}">checked="checked"</c:if>							
					</c:forEach>>台外幣存款、貨幣型基金、儲蓄型保險或不曾投資過<br></td>
						<td><input type="checkbox" name="question4" value="2"
							<c:forEach var="aVar" items="${paramValues.question4}">
						<c:if test="${aVar eq '2'}">checked="checked"</c:if>							
					</c:forEach>>債券、債券型基金<br></td>
						<td><input type="checkbox" name="question4" value="3"
							<c:forEach var="aVar" items="${paramValues.question4}">
						<c:if test="${aVar eq '3'}">checked="checked"</c:if>							
					</c:forEach>>股票、股票型基金、ETF
							<br></td>
						<td><input type="checkbox" name="question4" value="4"
							<c:forEach var="aVar" items="${paramValues.question4}">
						<c:if test="${aVar eq '4'}">checked="checked"</c:if>							
					</c:forEach>>結構型商品、投資型保單
							<br></td>
						<td><input type="checkbox" name="question4" value="5"
							<c:forEach var="aVar" items="${paramValues.question4}">
						<c:if test="${aVar eq '5'}">checked="checked"</c:if>							
					</c:forEach>>期貨、選擇權或其他衍生性金融商品
							<br></td>
						<td style="color: red"><span class="error">${error.question4}</span></td>
					</tr>
					<tr>
						<td>5.可承受投資風險之程度資產的市值可能會上升或下降，就您所期望平均年投資報酬率是多少？（以投資100萬元為例）<br></td>
						<td><input type="radio" name="question5" value="1"
							<c:if test="${param.question5 eq '1'}">checked</c:if>>1%~2%（每年希望獲利1~2萬元）<br></td>
						<td><input type="radio" name="question5" value="2"
							<c:if test="${param.question5 eq '2'}">checked</c:if>>3%~5%（每年希望獲利3~5萬元）<br></td>
						<td><input type="radio" name="question5" value="3"
							<c:if test="${param.question5 eq '3'}">checked</c:if>>6%~8%（每年希望獲利6~8萬元）<br></td>
						<td><input type="radio" name="question5" value="4"
							<c:if test="${param.question5 eq '4'}">checked</c:if>>9%~12%（每年希望獲利9~12萬元）<br></td>
						<td><input type="radio" name="question5" value="5"
							<c:if test="${param.question5 eq '5'}">checked</c:if>>12%以上（每年希望獲利12萬元以上）<br></td>

						<td style="color: red"><span class="error">${error.question5}</td>

					</tr>
					<tr>
						<td>6.可承受投資風險之程度資產的市值可能會上升或下降，就您所能承受每年最大投資損失是多少？（以投資100萬元為例）<br>
							%~2%（每年可接受損失1~2萬元）
						<td><input type="radio" name="question6" value="1"
							<c:if test="${param.question6 eq '1'}">checked</c:if>>1
						<td><input type="radio" name="question6" value="2"
							<c:if test="${param.question6 eq '2'}">checked</c:if>>3%~5%（每年可接受損失3~5萬元）<br>
						</td>
						<td><input type="radio" name="question6" value="3"
							<c:if test="${param.question6 eq '3'}">checked</c:if>>6%~8%（每年可接受損失6~8萬元）<br>
						</td>
						<td><input type="radio" name="question6" value="4"
							<c:if test="${param.question6 eq '4'}">checked</c:if>>9%~12%（每年可接受損失9~12萬元）<br></td>
						<td><input type="radio" name="question6" value="5"
							<c:if test="${param.question6 eq '5'}">checked</c:if>>12%以上（每年可接受損失12萬元以上）<br></td>
						<td style="color: red"><span class="error">${error.question6}</span></td>
					</tr>
					<tr>
						<td><input type="submit" value="送出"></td>
					</tr>
				</table>

			</form>
		</div>
		<br>


	</div>
</body>
</html>