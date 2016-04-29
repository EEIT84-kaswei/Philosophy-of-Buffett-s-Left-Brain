<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>專欄文章</title>
<style type="text/css">
</style>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
		$("#one").click(function(){
			$( "input[name='aname']" ).val( "撰文者｜劉以親" );
			$( "input[name='atitle']" ).val( "負利率吹襲全球會是啥面貌?" );
			CKEDITOR.instances["my-content"].setData("<p>後天是五一勞動節，勞動部送出大禮，自後天起，十年未調高的勞保投保薪資上限（俗稱勞保天花板）將由43900元調高為45800元，208萬高薪族勞工受惠。適用此級距勞工，以投保30年為例，每月勞保年金將可從20414元提高為21297元，每月退休金多領883元。<p>勞保分級表調高後，勞工投保薪資從43900元上調為45800元後，每月負擔保費增38元、雇主增137元。<p>勞保投保薪資上限43900元自2006年適用至今，剛好十年未調，本報去年9月率先勞保投保薪資上限十年未調，打破勞工保險史紀錄，不但形成高所得保費低繳現象，投保薪資上下限差距也與其他國家愈差愈大。勞動部去年底即表態同意打開勞保天花板，今年3月經行政院核定通過5月1日生效，當做五一勞動節大禮。<p>勞動部表示，經核對勞保原投保級距及勞退提繳、健保級距後，薪資43900元以上受僱勞工及雇主約178萬人，加上在職業工會、漁會投保等勞工適用人數約30萬人，總計適用投保薪資45800元級距人數約208萬人。<p>勞動部表示，已在本月底發函各事業單位調高投保薪資上限，其中屬於受僱勞工及雇主，勞保局將會自5月起逕予調整，若雇主認為與勞工實際薪資不符，可以事後舉證修正。<p>目前勞保條例規定，勞保年金領取標準以勞工投保薪資最高60個月計算，勞保天花板上調後，高薪族勞工每月可領勞保年金也將增加。舉例而言，若是勞工最高60個月投保薪資為43900元，投保25年後，每月可領年金為17011元，若調高為45800元，則每月可領17747元，月增736元。若投保30年，則月領退休金由20414元增為21297元，每月增領883元。<p></p>")
		});

	});


</script>

</head>

<body>

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>

	<div style="height: 50em; margin: 2em auto; padding: 0em;" class="table-responsive">
		<!-- 表格開始 -->
		<form action="<c:url value="/pages/article.controller" />" method="post">
			<table style="border: 2px #FFAC55 solid; padding: 5px; background-color:rgba(255, 255, 255, 0.8)" rules="all" cellpadding='5' align="center">
				<tr>
					<td>作家名稱 :</td>
					<td>
						<input type="text" name="aname" value="${param.aname}" required>
				   <%-- <span class="error">${error.aname}</span> --%>
					</td>
				</tr>
				<tr>					
					<td>文章標題:</td>
					<td>
						<input type="text" name="atitle" value="${param.atitle}" required>
				   <%-- <span class="error">${error.atitle}</span> --%>
				    </td>
				</tr>
				<tr>
					<td>文章內文 :</td>
					<td><textarea id="my-content" name="acontext" cols="60" rows="30">${param.acontext}</textarea>
					
						<script>
							CKEDITOR.replace('acontext', {});							
						</script> <br>
						<span class="error" style="font-size: medium; color: red">${error.acontext}</span>
					</td>
				</tr>
			</table>
				<center>
					<input type="submit" name="prodaction" value="Insert"  style="margin:30px" class="btn btn-default">
					<input id="one" type="button" value="一鍵輸入"  style="margin:30px" class="btn btn-default">
				</center>
		</form>
	</div>



</body>
</html>

