<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- **************************************** CSS開始   ***************************************************** -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
<style type="text/css">

/*分類股  按鈕設定*/
#menu {
	overflow: auto !important;
	overflow /**/: hidden;
}

#menu td {
	float: left;
	list-style-type: none;
	width: 4em;
	font-size: 115%
}

#menu td a {
	display: block;
	width: 100%;
	line-height: 2.5em;
	color: #7E3D76;
	text-decoration: none;
	text-align: center
}

#menu td a:hover {
	background-color: #DDD;
	color: #666
}

/*分類股表格設定*/
#stockTypeTable {
	width: 100%;
	border: 0px solid #E0E0E0; /*測完要改顏色*/
	border-collapse: collapse; /*把內外框的距離清掉*/
	margin: 0 auto;
}

#stockTypeTable th {
	border: 1px solid black;
	text-align: center;
	height: 25px;
}

#stockTypeTable td {
	border: 1px solid black;
	text-align: center;
	height: 25px;
}

#stockTypeTable tbody tr:HOVER {
	background-color: #FFE6D9;
	color: #666
}

td.favorL:hovor {
	background-color: #DDD;
	color: #666;
}
</style>
<!-- **************************************** 網頁抬頭  開始***************************************************** -->
<title>${conceptStockName}</title>
<!-- **************************************** 網頁抬頭  結束 ***************************************************** -->
</head>

<body style="margin: 0em 3em">
	<!-- ************************************** 最外框DIV開始  ***************************************************** -->

	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />

	<!-- 網頁主要導覽列 -->
	<div><jsp:include page="/nav.jsp" /></div>



	<!-- ************************************** 內文DIV開始  ***************************************************** -->
	<div align="center" style="width: 90%; margin: 0 auto;">

		<!-- ******************************** 各種分類按鈕   ************************************************ -->
		<div style="float: left; width: 100%; margin: 0 auto;">
			<table id="menu">
				<tr style="border-bottom: 2px solid black;">
					<td><a href="<c:url value='/secure/conceptStock.view'/>"><b>概念股</b></a></td>
					<td><a
						href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s1"/></c:url>"><b>上市股</b></a></td>
					<td><a
						href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s2"/></c:url>"><b>上櫃股</b></a></td>
					<td><a
						href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s3"/></c:url>"><b>興櫃股</b></a></td>
					<td><a
						href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="chengFenv"/></c:url>"><b>成分股</b></a></td>
				</tr>
			</table>
		</div>


		<div style="float: left;">
			<form action="<c:url value='/secure/conceptStock.view'/>"
				method="get">
				<select id="conceptbotton" name="concept_Stock" style="align: left"
					onchange="">
					<option>---請選擇---</option>
					<option value="c1">生技醫療</option>
					<option value="c2">定存股</option>
					<option value="c3">物聯網</option>
					<option value="c4">雲端運算</option>
					<option value="c5">頻果供應鏈</option>
					<option value="c6">紡織</option>
					<option value="c7">航運</option>
					<option value="c8">VR虛擬實境</option>
					<option value="c9">自行車</option>
					<option value="c10">營建</option>
					<option value="c11">生質能源</option>
					<option value="c12">電信</option>
					<option value="c13">電子3C</option>
					<option value="c14">能源</option>
					<option value="c15">保健食品</option>
					<option value="c16">觀光事業</option>
					<option value="c17">食品工業</option>
				</select> <input type="submit" name="send" value="送出" height="16px">
			</form>
		</div>
		<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
		<div style="float: right;">
			網頁最後更新時間：
			<fmt:formatDate value="${date}" pattern="yyyy-MM-dd hh:mm:ss" />
		</div>

		<!-- **************************************表格開始*********************************************** -->
		<table id="stockTypeTable">
			<thead>
				<tr>
					<td colspan="9"
						style="background: #642100; height: 28px; border: none;"><b
						style="color: white">${conceptStockName}</b></td>
				</tr>
				<tr>
					<td colspan="9" style="height: 20px; border: none"></td>
				</tr>
				<tr style="height: 30px; background: #FFDCB9">
					<th>加入自選股</th>
					<th>股票代碼</th>
					<th>&nbsp;&nbsp;股票名稱&nbsp;&nbsp;</th>
					<th>買進價格</th>
					<th>賣出價格</th>
					<th>成交價格</th>
					<th>漲跌金額</th>
					<th>漲跌幅度</th>
					<th>累積成交量</th>
				</tr>
			</thead>

			<tbody id="tbody">
				<!-- 點一下會從空心變成實心星星，送出加入最愛請求，但如果已加入，要秀出實心星星 ;不管加入取消都送一個ajax回去-->
				<c:forEach var="data" items="${conceptStock}">
					<tr>
						<td><img alt="加入自選股" onclick="getValue('${data.stock_Code}')"
							id="${data.stock_Code}"
							src="<%=request.getContextPath() %>/img/star.gif" height=20></td>
						<td><a
							href="<c:url value='/secure/SpecialFunctionServlet'><c:param name='stock_Code' value='${data.stock_Code}'/></c:url>">${data.stock_Code}</a></td>
						<td>${data.stock_Name}</td>
						<td>${data.purchase_Price}</td>
						<td>${data.selling_Price}</td>
						<td>${data.final_price}</td>
						<td>${data.change_Amount}</td>
						<td>${data.change_extent}</td>
						<td>${data.acc_Trade_Volume}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<!-- ************************************** 表格結束   *************************************************** -->
	</div>


	<!-- ************************************** 內文DIV結束  ***************************************************** -->


	<!-- ************************************** 最外框DIV結束  ***************************************************** -->
</body>

<!-- ************************************** JavaScript ***************************************************** -->
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	 var path = "${pageContext.request.contextPath}";
     var conceptUrl = path + "/secure/custFavorite.view" ;

     var account = "lara";  //要改成程式自動抓

     function getValue(value){
			var stock_Code = value; //value是股票代號
			console.log("stock_Code : " + stock_Code); 
			var starPath = $("img[id='"+value+"']").attr("src") //取出這個點下去的星星路徑
			console.log("starPath :　" + starPath)
			var starIndex = starPath.lastIndexOf("chng");  //確認圖片路徑有沒有 chng
		    console.log("starIndex : " + starIndex );
		      if(starIndex == -1){
		    	  $("img[id='"+value+"']").attr("src" , "<%=request.getContextPath()%>/img/chngstar.gif");  //如果沒有chng，是空心，就加最愛，送Ajax
		    	  doConnect(conceptUrl , account , stock_Code , "insert");
			  }else{
				  $("img[id='"+value+"']").attr("src" , "<%=request.getContextPath()%>
	/img/star.gif"); //如果有chng，是實心，就移除最愛，送Ajax
			doConnect(conceptUrl, account, stock_Code, "delete");
		}

	}
	function doConnect(conceptUrl, account, stock_Code, action) {
		$.ajax({
			url : conceptUrl,
			data : "stock_Code=" + stock_Code + "&account=" + account
					+ "&action=" + action,
			type : "GET",
			cache : false, //IE不要cache （預設是true）
			async : true, //是否採用非同步（預設是true）
			contentType : "application/x-www-form-urlencoded",
			success : function(msg) {
				console.log(msg);
			},
		//		         beforeSend:function(){
		//		             $('#loadingIMG').show();
		//		         },
		//		         complete:function(){
		//		             $('#loadingIMG').hide();
		//		         },
		//		         error:function(xhr, ajaxOptions, thrownError){ 
		//		             alert(xhr.status); 
		//		             alert(thrownError); 
		//		         }
		});

	}

	$(document).ready(function() {
		$("#stockTypeTable").DataTable({
			"pageLength" : 10,
			"lengthMenu" : [ 5, 10, 15, 20 ]
		});
	});

	// 	 function changelist() {
	//		var concept_Stock = $("#conceptbotton").val()
	//			console.log("concept_Stock - " + concept_Stock);
	//		var conceptUrl = path + "/secure/conceptStock.view" ;
	//	 	 $.ajax({
	//	         url: conceptUrl ,
	//	         data: "concept_Stock="+concept_Stock ,
	//	         type:"GET",
	//			 cache:false, //IE不要cache （預設是true）
	//			 async:false, //是否採用非同步（預設是true）
	//	         dataType:"text" ,
	//	         success: function(msg){
	//	             alert(msg);
	//	         },
	//	         beforeSend:function(){
	//	             $('#loadingIMG').show();
	//	         },
	//	         complete:function(){
	//	             $('#loadingIMG').hide();
	//	         },
	//	         error:function(xhr, ajaxOptions, thrownError){ 
	//	             alert(xhr.status); 
	//	             alert(thrownError); 
	//	         }
	//	     });

	//	 }
</script>
</html>
