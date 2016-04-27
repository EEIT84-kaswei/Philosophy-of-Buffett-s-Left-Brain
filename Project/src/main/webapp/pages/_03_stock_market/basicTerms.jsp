<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>指標</title>
<style type="text/css">
#abgne-block-20120327 {
	max-width: 50em;
}

#abgne-block-20120327 ul, #abgne-block-20120327 li {
	list-style: none;
	margin: 0;
	padding: 0;
}

#abgne-block-20120327 .tabs li {
	float: left;
	margin: 0 0 -1px 5px;
	border: 1px solid #ddd;
	background: #fafafa;
	height: 32px;
	cursor: pointer;
	border-radius: 5px 5px 0 0;
}

#abgne-block-20120327 .tabs li.active {
	background: #fff;
	padding-bottom: 1px;
	border-bottom: none;
}

#abgne-block-20120327 .tabs li.hover {
	background: #f5f5f5;
}

#abgne-block-20120327 .tabs span {
	display: block;
	float: left;
	overflow: hidden;
	padding: 7px 15px 5px 15px;
}

#abgne-block-20120327 .tab_container {
	clear: both;
	border: 1px solid #DDD;
	background: #fff;
	overflow: hidden;
	border-radius: 5px;
}

#abgne-block-20120327 .tab_container ul {
	position: relative;
	height: 780px;
	overflow: hidden;
}

#abgne-block-20120327 .tab_container .tab_content li {
	position: absolute;
	width: auto;
	height: 100%;
	padding: 15px;
	margin-top: 10px;
	background: #fff;
}

#abgne-block-20120327 .tab_container .tab_content li img {
	display: block;
	float: left;
	margin-right: 15px;
}

#abgne-block-20120327 .tab_container .tab_content li h3 {
	font-size: 22px;
	line-height: 22px;
	margin: 5px 0 15px;
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

	<div style="margin:2em auto" class="container">

			<h2 style="text-align:center;color:#fff"><fmt:message key="importantIndex" /></h2>
		<div id="abgne-block-20120327" style="margin:0 auto">
			<ul class="tabs">
				<li><span>KD</span></li>
				<li><span>RSI</span></li>
				<li><span>MACD</span></li>
			</ul>
			<div class="tab_container">
				<ul class="tab_content">
				
					<li style="overflow:auto; font-size: 16px;color:#FAE5E5;background-image:url('${pageContext.request.contextPath}/img/02bgi-1.jpg'); ">
					<div style="background-color:rgba(0 , 0, 0, 0.3)">
						<h3>KD 隨機指標</h3>
						<p>
							說明:<br> KD市場常使用的一套技術分析工具。其適用範圍以中短期投資的技術分析為最佳。隨機
							指標的理論認為：當股市處於牛市時，收盤價往往接近當日最高價； 反之在熊市時，收盤價比較接近當日最低價，該指數的目的即在反映
							出近期收盤價在該段日子中價格區間的相對位置。<br> <br>計算公式:<br>
							它是由%K(快速平均值)、%D(慢速平均值)兩條線所組成，假設從n天週期計算出隨機指標時，首先須找出最近n天當中曾經出現過的最高價、最低價與第n天的收盤價，然後利用這三個數字來計算第n天的未成熟隨機值(RSV)。<br>
							第n天收盤價-最近n天內最低價<br> RSV ＝────────────────×100<br>
							最近n天內最高價-最近n天內最低價<br> 計算出RSV之後，再來計算K值與D值。<br> 當日K值(%K)=
							2/3 前一日 K值 + 1/3 RSV<br> 當日D值(%D)= 2/3 前一日 D值＋ 1/3 當日K值<br>
							若無前一日的K值與D值，可以分別用50來代入計算，經過長期的平滑的結果，起算基期雖然不同，但會趨於一致，差異很小。<br>
							<br> 使用方法:<br> 1.
							如果行情是一個明顯的漲勢，會帶動K線與D線向上升。如漲勢開始遲緩，則會反應到K值與D值，使得K值跌破D值，此時中短期跌勢確立。<br>
							2. 當K值大於D值，顯示目前是向上漲升的趨勢，因此在圖形上K線向上突破D線時，即為買進訊號。<br> 3.
							當D值大於K值，顯示目前是向下跌落，因此在圖形上K 線向下跌破D線，此即為賣出訊號。<br> 4.
							上述K線與D線的交叉，須在80以上，20以下(一說70、30；視市場投機程度而彈性擴大範圍)，訊號才正確。<br> 5.
							當K值大於80，D值大於70時，表示當日收盤價處於偏高之價格區域，即為超買狀態；當K值小於20，D值小於30時，表示當日收盤價處於偏低之價格區域，即為超賣狀態。<br>
							6. 當D值跌至15以下時，意味市場為嚴重之超賣，其為買入訊號；當D值超過85以上時，意味市場為嚴重之超買，其為賣出訊號。<br>
							7. 價格創新高或新低，而KD未有此現象，此為背離現象，亦即為可能反轉的重要前兆。<br> <br> <br>
						</p>
						</div>
					</li>
					
					
					<li style="overflow:auto; font-size: 16px;color:#FAE5E5;background-image:url('${pageContext.request.contextPath}/img/02bgi-2.jpg'); ">
					<div style="background-color:rgba(0 , 0, 0, 0.3)">
						<h3>RSI 相對強弱指標</h3>
						<p>
							說明:<br> RSI
							目前已為市場普遍使用，是主要技術指標之一，其主要特點是計算某一段時間內買賣雙方力量，作為超買、超賣的參考與Ｋ線圖及其他技術指標（三至五種）一起使用，以免過早賣及買進，造成少賺多賠的損失。<br>
							計算公式:<br> 過去n日內上漲點數總和<br> UP＝────────────────<br>
							n<br> 過去n日內下跌點數收總和<br> DN＝─────────────────<br> n<br>
							UP<br> RS ＝ ──────<br> DN<br> 100<br>
							n日RSI＝100 － ────<br> 1+RS<br> <br> 使用方法:<br>
							1. 以6日RSI值為例，80以上為超買，90以上或M頭為賣點；20以下為超賣，10以下或W底為買點。<br> 2.
							在股價創新高點，同時RSI也創新高點時，表示後市仍強，若未創新高點為賣出訊號。<br> 3.
							在股價創新低點，RSI也創新低點，則後市仍弱，若RSI未創新低點，則為買進訊號。<br> 4.
							當6日RSI由下穿過12日RSI而上時，可視為買點；反之當6日RSI由上貫破12日RSI而下時，可視為賣點。<br>
							5. 當出現類似這樣的訊號：3日RSI>5日RSI>10日RSI>20日RSI....，顯示市場是處於多頭行情；反之則為空頭行情。<br>
							6. 盤整期中，一底比一底高，為多頭勢強，後勢可能再漲一段，是買進時機，反之一底比一底低是賣出時機。<br> <br>
						</p>
						</div>
					</li>
					<li style="overflow:auto; font-size: 16px;color:#FAE5E5;background-image:url('${pageContext.request.contextPath}/img/02bgi-3.jpg'); ">
					<div style="background-color:rgba(0 , 0, 0, 0.3)">
						<h3>MACD</h3>
						<p>
							說明:<br>
							MACD根據移動平均線(MA)較易掌握趨勢變動的優點所延伸出來的一種分析方式。其基本原理是運用兩條不同速度的指數平滑移動平均線來計算兩者之間的差離狀態(DIF)，然後再對DIF進行平滑移動平均即為MACD線。簡而言之，MACD就是對長期與短期的移動平均線收斂或發散的徵兆，加以雙重平滑處理，用以研判買賣股票的時機與信號。<br>
							計算公式:<br> 先行計算出快速線(n日EMA)與慢速線(m日EMA,n&lt;m)。
							以此兩個數值，再計算兩者間的「差離值」(DIF),再計算DIF之x日EMA,此即MACD。<br>
							nEMA=(前一日nEMA*(n-1)＋今日收盤價×2)/(n+1)<br>
							mEMA=(前一日mEMA*(m-1)＋今日收盤價×2)/(m+1)<br> DIF=nEMA－mEMA<br>
							xMACD=(前一日xMACD*(x-1)＋DIF×2)/(x+1)<br> 一般會將DIF-MACD繪柱形圖(BAR)<br>
						使用方法：<br> 1.
						當DIF、MACD或BAR值大於0時，一般可視為多頭市場(三者之值均大於0時，其勢更為明顯)；反之當DIF、MACD或BAR值小於0時，可被視為空頭市場(三者之值均小於0時，可視為逃命訊號)。<br>
						2.
						短線而言，DIF與MACD均在水平軸下方，且DIF由下往上穿過MACD線(即同義於BAR值自下方突破水平軸)，是為買入訊號；反之DIF與MACD均在水平軸上方，且DIF由上往下穿過MACD線(即同義於BAR值自上方貫破水平軸)，是為賣出訊號。<br>
						3. 中線而言，BAR由下向上突破水平軸，可視為買入訊號，反之則為賣出訊號。<br> 4.
						股價出現兩三個相對高點，但MACD並未伴隨出現新高點，其為賣出訊號；反之股價出現兩三個相對低點，但MACD並未伴隨出現新低點，其為買入訊號。<br>
						<br>
						</p>
						</div>
					</li>
				</ul>
			</div>
		</div>

	

	</div>



<script type="text/javascript">
	$(function() {
		// 預設顯示第一個頁籤
		// 並先把 .tabs, .tabs li 及 .tab_content, .tab_content li 等元素取出
		// 同時也要取得 .tab_content 的寬
		var _default = 0, $block = $('#abgne-block-20120327'), $tabs = $block
				.find('.tabs'), $tabsLi = $tabs.find('li'), $tab_content = $block
				.find('.tab_content'), $tab_contentLi = $tab_content.find('li'), _width = $tab_content
				.width();

		// 當滑鼠移到 .tabs li 上時要套用 .hover 樣式
		// 移出時要移除 .hover 樣式
		$tabsLi
				.hover(function() {
					var $this = $(this);

					// 若被滑鼠移上去的 li 是目前顯示的頁籤就不做任何動作
					if ($this.hasClass('active'))
						return;

					$this.toggleClass('hover');
				})
				.click(
						function() { // 當滑鼠點擊 .tabs li 時
							// 先取出被點擊及目前顯示的頁籤與索引
							var $active = $tabsLi.filter('.active')
									.removeClass('active'), _activeIndex = $active
									.index(), $this = $(this)
									.addClass('active').removeClass('hover'), _index = $this
									.index(), isNext = _index > _activeIndex;

							// 如果被點擊的頁籤就是目前已顯示的頁籤, 則不做任何動作
							if (_activeIndex == _index)
								return;

							// 依索引大或小來決定移動的位置
							$tab_contentLi.eq(_activeIndex).stop().animate({
								left : isNext ? -_width : _width
							}).end().eq(_index).css('left',
									isNext ? _width : -_width).stop().animate({
								left : 0
							});
						});

		// 先把預設要顯示的頁籤加上 .active 樣式及顯示相對應的內容
		$tabsLi.eq(_default).addClass('active');
		$tab_contentLi.eq(_default).siblings().css({
			left : _width
		});
	});
</script>

</fmt:bundle>
</body>
</html>
