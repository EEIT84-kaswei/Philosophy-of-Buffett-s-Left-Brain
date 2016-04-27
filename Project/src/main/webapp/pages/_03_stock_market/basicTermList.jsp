<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 9]>
<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<html>
<head>
<meta><a name="viewport" content="width=device-width， initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重要術語</title>

<style type="text/css">
dl{
	color:purple;
	font-size:150%;
	margin:0 0 0 2em;
}

dd{
	color:black;
	font-size:100%;
	margin:0 2em 0 2em;
}
.list-inline a{
	color:#006699;
}
.dl-horizontal a{
	color:#006666;
}


</style>
<c:choose>
	<c:when test="${! empty (param.locale)}">
		<c:set var="loc" value="${param.locale}" scope="session"/>
	</c:when>
	<c:when test="${! empty (sessionScope.loc)}">
		<c:set var="loc" value="${sessionScope.loc}" scope="session"/>
	</c:when>
	<c:otherwise>
		<c:set var="loc" value="${pageContext.request.locale}" scope="session"/>
	</c:otherwise>
</c:choose>
<%--  <c:set var="loc" value="${param.locale}"/> --%>
<%--     <c:if test="${! empty (param.locale)}"> --%>
<%--        <c:set var="loc" value="${param.locale}"/> --%>
<%--     </c:if> --%>
   
 <fmt:setLocale value="${loc}"/>  
</head>

<body>
 <fmt:bundle basename="properties.message">  
<!-- <div class="container"> -->
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />
<!-- 網頁主要導覽列 -->
<div>
<jsp:include page="/nav.jsp" />
</div>


<div style="max-width:80em;margin:2em auto;background-color: #cccccc">
<h2 style="text-align:center;padding:2em 2em 0em 2em"><fmt:message key="importantTerms"/></h2>

<div style="max-width:60%;margin:3em auto">
<ul class="list-inline">
	<li><a href="#1">面額</a></li>
	<li><a href="#2">面值</a></li>
	<li><a href="#3">市價</a></li>
	<li><a href="#4">上市</a></li>
	<li><a href="#5">融資</a></li>
	<li><a href="#6">融券(墊股)</a></li>
	<li><a href="#7">普通股</a></li>
	<li><a href="#8">特別股</a></li>
	<li><a href="#9">開盤價</a></li>
	<li><a href="#10">收盤價</a></li>
	<li><a href="#11">最高價</a></li>
	<li><a href="#12">最低價</a></li>
	<li><a href="#13">壓力帶</a></li>
	<li><a href="#14">支撐點</a></li>
	<li><a href="#15">成交價</a></li>
	<li><a href="#16">本益比</a></li>
	<li><a href="#17">殖利率</a></li>
	<li><a href="#18">乖離率</a></li>
	<li><a href="#19">主力</a></li>
	<li><a href="#20">散戶</a></li>
	<li><a href="#21">進貨</a></li>
	<li><a href="#22">出貨</a></li>
	<li><a href="#23">除息</a></li>
	<li><a href="#24">除權</a></li>
	<li><a href="#25">填息</a></li>
	<li><a href="#26">填權</a></li>
	<li><a href="#27">全額交割</a></li>
	<li><a href="#28">部分全額交割</a></li>
	<li><a href="#29">加權指數</a></li>
</ul>

</div>

<br><br>


<dl class="dl-horizontal">
<dt><a name="1">面額</a></dt>
<dd>是指股票票面上所印製之金額，民國六十八年以前流通的股票，其面值有許多不同的金額。證管會有鑑於股票面值種類紊亂，不便於交易和交割的管理，於六十八年通令規定股票面值限期統一改為十元 ，這就是一般通稱的現行股票面額。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="2">面值</a></dt>
<dd>是指股票上所印刷之每股帳面值每股金額。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="3">市價</a></dt>
<dd>股票的市價是經由交易決定的價錢，隨時都在變動。決定股票市場的因素不一而足，包括發行公司獲利能力、市場資金的供需關係，甚至作手的人為炒作等，都足以影響股票的市價。</dd>
</dl>
<br>

<dl class="dl-horizontal">
<dt><a name="4">上市</a></dt>
<dd>股份有限公司申請股票上市，必須先經過辦理公開發行的手續，再提一定成數的股票(普通約一至三成)股票，委託證券商辦理承銷，以分散股權，等到股權分散符合規定時，再申請上市。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="5">融資</a></dt>
<dd>指散戶擴張信用之做法。意即手上錢不多又想多買些股票，此時可向證券公司申請融資，而達到融資買入的目的。因此特別注意：（當融資餘額不斷增加時，表示大部份的股票已經由大戶手中轉入散戶手中，後市行情下跌。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="6">融券(墊股)</a></dt>
<dd>手上沒有股票且同時看壞後市，先向證券金融公司借股票在證券市場賣出謂之融券賣出。以後不管漲跌，將這些股票回補時謂之融券買入。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="7">普通股</a></dt>
<dd>股份有限公司發行籌集股本之證明文件，是公司最基本的股份。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="8">特別股</a></dt>
<dd>除了普通股之外，某些公司還發行特別股份(優先股份)來籌集資金。優先股股東通常沒有投票權，不能對公司議案提出表決，但卻能夠優先獲得股利分配、以及在公司破產或結業清算時獲得分配利餘資產之二項權利。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="9">開盤價</a></dt>
<dd>每天開盤第一筆成交的價格。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="10">收盤價</a></dt>
<dd>當日收盤時最後一筆成交的價格。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="11">最高價</a></dt>
<dd>當天成交各種不同價格中，最高的價格。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="12">最低價</a></dt>
<dd>當天成交價格中最低的價格。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="13">壓力帶</a></dt>
<dd>股價經過若干時段的攀升，滯留在一定的區間，作小幅度的盤檔理，換手整雖然積極，卻久久難以突破的價位稱之為壓力帶或阻力帶。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="14">支撐點</a></dt>
<dd>股價經過若干時段的下跌，跌到一定的程度後，出現強勁的接手而盤穩，是謂支撐或抵抗點。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="15">成交價</a></dt>
<dd>經交易所電腦撮合而成交時之價位稱之。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="16">本益比</a></dt>
<dd>是指(股價買進價格)/(該股當期稅後純益)的比值。通常本益比的倍數是越低越好，本益比八倍的股票，遠比本益比十倍的股票具有投資價值。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="17">殖利率</a></dt>
<dd>判別投資收益的參考標的之一；為股利除以股價，所得出來的面數即為殖利率。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="18">乖離率</a></dt>
<dd>測量指數或股價與移動平均線，兩者距離的一種技術分析工具。當指數或股價在連續上揚或下跌時，指數與平均線產生距離，就叫做乖離，乖離率為「正」表示股價在移動平均線之上，乖離率為「負」表示股價在移動平均線之下。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="19">主力</a></dt>
<dd>是指那些有辦法在股市中大額進出，對股價造成重大影響的人。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="20">散戶</a></dt>
<dd>指的是在券商開戶買賣股票的個別自然人。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="21">進貨</a></dt>
<dd>市場主力將要介入將股價大力拉抬之前先要吃足籌碼，加以鎖定謂之進貨。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="22">出貨</a></dt>
<dd>市場主力要賣出股票的動作。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="23">除息</a></dt>
<dd>在股票停止過戶前買進股票的投資人，因為股東大會的名簿上登記，所以能領取各公司所發放的股息。除息交易，即按照前一日收盤價扣除發派股息的金額，就是『除息』。 </dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="24">除權</a></dt>
<dd>分配股票股利的交易。上市公司分配股票股利時都訂有一個「除權基準日」該日以前買進該股才可享受增資股分配。除權的配股又可分為有償配股和無償配股兩項。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="25">填息</a></dt>
<dd>除息交易前一日該股的收盤價與除息價間留下一個除息價位缺口，如果除息後 股價上升將該價位缺口填滿，謂之「填息」。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="26">填權</a></dt>
<dd>除權交易前一日該股的收盤價與除權後價位間留下一個除權價位缺囗，如果除 權後股價上升將該價位缺囗填滿，謂之「填權」。 </dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="27">全額交割</a></dt>
<dd>是證券交易的一種術語，簡單的說，就是現股、現款交割，有別於「普通交割」。證券交易所目前每日辦理交割是採取各證券商內部客戶買賣軋平後之「餘額」向交易所辦理交割，而全額交割是客戶在向證券商委託買賣，頃寫「委託書」之同時，即應繳足款、券，就是買進全額交割股票時要繳足買進價款;賣出時，必須先繳驗股票，不得作沖銷。如果沖銷後再委託時，另需重新辦理委託手續。被列全額交割的股票，都是財務發生困難、重整、或停工的公司，其用意在限制其股票的過度流通。 </dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="28">部份全額交割</a></dt>
<dd>每日委託買進達一百張，或多筆累積達三百張以上時的投資人，需先收取五成以上的價金始能買進，而信用交易部份需收足自備款或保證金。部份全額交割的交易方式，對中大戶將造成買進的不方便，故大多會影響行情下跌。</dd>
</dl>

<br>

<dl class="dl-horizontal">
<dt><a name="29">加權指數</a></dt>
<dd>發行量加權股價指數，為台灣證券交易所編製，係將每種選樣股票的每天收盤價格乘以上巿股數，計算出選樣股票的市價額，然後合計為選樣股票的市價總 額，除以基期的市價總額，再乘以一百予以指數化，以反映整體選樣股票價格水準的走勢。證券交易所股票指數的基期是民國五十五年，即以五十五年股價平均每年平均一乘以上市股價計算出基期市價總額。 </dd>
</dl>

<br>


</div>
</fmt:bundle>
</body>
</html>
