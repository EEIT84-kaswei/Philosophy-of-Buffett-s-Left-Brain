<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="css/bootstrap.min.css" > -->
<%-- <script src="js/bootstrap.min.js"></script> --%>
<title>導覽列</title>
<!-- <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
<%-- <script src="http://code.jquery.com/jquery-latest.js"></script> --%>
<%-- <script src="js/bootstrap.min.js"></script> --%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>


<script type="text/javascript">
			$(function(){
				$("ul.navigation > li:has(ul) > a").append('<div class="arrow-bottom"></div>');
				$("ul.navigation > li ul li:has(ul) > a").append('<div class="arrow-right"></div>');
			});
		</script>
		<style type="text/css">

			#pageDiv{
  				width:800px;   
 				margin:auto; 
/* 				margin-right:auto; */
			}


			/*
				教學文：http://fundesigner.net/only-css-menu
				授權：MIT License
			*/
			


			/* 初始化 */
			body, ul, li, a{
				margin: auto;
				padding: 0;
				font-size: 14px;
				text-decoration: blink;
			}
			ul, li {
				list-style: none;
			}
			/* 選單 li 之樣式 */
			ul.navigation li {
				position: relative;
				float: left;
				
			}
			/* 選單 li 裡面連結之樣式 */
			ul.navigation li a{
				display: block;
				padding: 12px 20px;
				background: #FFF0D4;
				color: #000033;
			}
			/* 特定在第一層，以左邊灰線分隔 */
			ul.navigation > li > a{
/* 				border-bottom: 1px solid #CCC;				 */
/* 				border-left: 1px solid #CCC; */
			}
			ul.navigation > li > a:hover{
				color: #666;
				background: #DDD
			}
			/* 特定在第一層 > 第二層或以後下拉部分之樣式 */
			ul.navigation ul{
				display: none;
				float: left;
				position: absolute;			
				left: 0;	
				margin: 0;
			}
			/* 當第一層選單被觸發時，指定第二層顯示 */
			ul.navigation li:hover > ul{
				display: block;
			}			
			/* 特定在第二層或以後下拉部分 li 之樣式 */
			ul.navigation ul li {
				border-bottom: 1px solid #DDD;
			}
			/* 特定在第二層或以後下拉部分 li （最後一項不要底線）之樣式 */
			ul.navigation ul li:last-child {
				border-bottom: none;
			}
			/* 第二層或以後選單 li 之樣式 */
			ul.navigation ul a {
				width: 120px;
				padding: 10px 12px;	
				color: #666;		
				background: #EEE;			
			}
			ul.navigation ul a:hover {		
				background: #CCC;				
			}
			/* 第三層之後，上一層的選單觸發則顯示出來（皆為橫向拓展） */
			ul.navigation ul li:hover > ul{
				display: block;
				position: absolute;
				top: 0;				
				left: 100%;
			}
			/* 箭頭向下 */
			.arrow-bottom {
				display: inline-block;
				margin-left: 5px;
				border-top: 4px solid #a8d1ff;
				border-right: 4px solid transparent;				
				border-left: 4px solid transparent;		
				width: 1px;
				height: 1px;
			}

			/* 箭頭向右 */
			.arrow-right {
				display: inline-block;
				margin-left: 12px;	
				border-top: 3px solid transparent;
				border-bottom: 3px solid transparent;
				border-left: 3px solid #666;		
				width: 1px;
				height: 1px;
			}
		</style>		
</head>
<body>
<!-- 網頁上方的橫向導覽列 -->

<%-- <span style="background-color:#FFF0D4"> --%>
<div id="pageDiv" style="background-color:#FFF0D4;padding:20;height:40px;margin:0 auto">
		
		<ul class="navigation">
			<li><a href="<c:url value='/Welcome.jsp' />">　首頁　</a></li>
			<li><a href="<c:url value='/pages/basic/basicIndex.jsp'/>">基本概念</a>
				<ul>
					<li><a href="#">股票類型</a></li>
					<li><a href="#">術語介紹</a></li>
					<li><a href="#">投資指南</a></li>
					<li><a href="#">趨勢圖解析</a></li>
					<li><a href="#">自我測驗</a></li>
				</ul>
			</li>	
						<li>
				<a href="<c:url value='/pages/_03_stock_market/stockIndex.jsp'/>">台股資訊</a>
				<ul>
					<li><a href="<c:url value='/pages/_03_stock_market/instantStock.jsp'/>">即時股票資訊</a></li>
					<li><a href="<c:url value='/pages/_03_stock_market/legalPerson.jsp'/>">三大法人資訊</a></li>
					<li><a href="<c:url value='/secure/_04_stock/stockType.jsp'/>">股票分類</a>
						<ul>
								<li><a href="<c:url value='/secure/_04_stock/concept_Stock/conceptStockIndex.jsp' />">概念股</a>
								<ul>
									<li><a href="www.apple.com/tw">蘋果概念股</a></li>
									<li><a href="www.mi.com/tw/">小米概念股</a></li>
									<li><a href="www.uni-president.com.tw/">統一概念股</a></li>
									<li><a href="https://www.fubon.com/bank/home/">富邦金控概念股</a></li>
									<li><a href="http://www.osac.com.tw/zh-tw/">歐美加概念股</a></li>
									<li><a href="http://www.wordgod.com/">字神帝國概念股</a></li>
									<li><a href="http://www.ras.ru/">俄羅斯科學院概念股</a></li>	
								</ul>
							</li>	
							<li><a href="#">上市股</a></li>
							<li><a href="#">上櫃股</a></li>
							<li><a href="#">興櫃股</a></li> 
							<li><a href="#">成分股</a></li> <!-- 成分股不做 -->

						</ul>
					</li>
				</ul>
			</li>
			
			<li><a href="<c:url value='/view/article.controller' />">股市專欄</a></li>
			
			<li><a href="<c:url value='/news.do' />">股市新聞</a></li>
<!-- 			<li> -->
<%-- 				<form action="<c:url value="news.do"/>" method="get"> --%>
<!-- 					<input type="submit" name="prodaction" value="股市新聞"> -->
<!-- 				</form> -->
<!-- 			</li> -->
			<li><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp' />">風險評估</a></li>
						<li>
				<a href="<c:url value='/secure/_02_login/memberIndex.jsp' />">會員專區</a>
				<ul>
					<li><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp' />">風險評估</a></li>
					<li><a href="<c:url value='/secure/_02_login/personal_stock.jsp'/>">自選股</a></li>
					<li><a href="<c:url value='/secure/_02_login/recommend.jsp'/>">股票推薦</a></li>
					<li><a href="#">理財專員到府服務</a></li>
				</ul>
			</li>
<!-- 			<li><a href="#">與我聯絡</a></li> -->
<!-- 			<li> -->
<!-- 				<a href="#">(示範列)</a> -->
<!-- 				<ul> -->
<!-- 					<li><a href="#">選單內容 1 - 1</a></li> -->
<!-- 					<li><a href="#">選單內容 1 - 2</a> -->
<!-- 						<ul> -->
<!-- 							<li><a href="#">選單內容 2 - 1</a></li> -->
<!-- 							<li> -->
<!-- 								<a href="#">選單內容 2 - 2</a> -->
<!-- 								<ul> -->
<!-- 									<li><a href="#">選單內容 3 - 1</a> -->
<!-- 										<ul> -->
<!-- 											<li> -->
<!-- 												<a href="#">選單內容 4 - 1</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="#">選單內容 4 - 2</a> -->
<!-- 												<ul> -->
<!-- 													<li><a href="#">選單內容 5 - 1</a></li> -->
<!-- 													<li> -->
<!-- 														<a href="#">選單內容 5 - 2</a> -->
<!-- 													</li>	 -->
<!-- 												</ul> -->
<!-- 											</li>	 -->
<!-- 										</ul>	 -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<a href="#">選單內容 3 - 2</a> -->
<!-- 									</li>	 -->
<!-- 								</ul> -->
<!-- 							</li>	 -->
<!-- 						</ul> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</li> -->

<!-- 			<li><a href="#">7</a></li> -->
		</ul>
</div>
<%-- </span> --%>

</body>
</html>