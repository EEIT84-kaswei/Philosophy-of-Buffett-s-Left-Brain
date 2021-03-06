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
	border: 0px solid #BEBEBE; /*測完要改顏色*/
	border-collapse: collapse; /*把內外框的距離清掉*/
	margin: 0 auto;
}
#stockTypeTable a {
	color:#538cc6;
}
#stockTypeTable th {
	border: 1px solid #BEBEBE;
	text-align: center;
	height: 35px;
}

#stockTypeTable td {
	border: 1px solid #BEBEBE;
	text-align: center;
	height: 35px;
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

<!-- **************************************** 網頁抬頭   ******************************************************* -->
<title>${stockTypeName}</title>
<!-- **************************************** 網頁抬頭  結束 ***************************************************** -->
</head>
<body>
	<!-- ************************************** 最外框DIV開始  ***************************************************** -->

		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />

		<!-- 網頁主要導覽列 -->
		<div><jsp:include page="/nav.jsp" /></div>


			<!-- ************************************** 內文DIV開始  ***************************************************** -->
			<div align="center" style="width: 90%; margin: 0 auto;">

				
				<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
				<div style="float: right">
					網頁最後更新時間：
					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd hh:mm:ss" />
				</div>

				<!-- **************************************表格開始*********************************************** -->
				<table id="stockTypeTable">
					<thead>
						<tr>
							<td colspan="9"
								style="background: #003366; height: 28px; border: none;">
								<font style="color: white;font-size:20px">自選股</font></td>
						</tr>
						<tr>
							<td colspan="9" style="height: 20px; border: none"></td>
						</tr>
						<tr style="height: 30px; background: #79a6d2">
							<th>股票代碼</th>
							<th>&nbsp;&nbsp;股票名稱&nbsp;&nbsp;</th>
							<th>買進價格</th>
							<th>賣出價格</th>
							<th>成交價格</th>
							<th>漲跌金額</th>
							<th>漲跌幅度</th>
							<th>累積成交量</th>
							<th>刪除自選股</th>
						</tr>
					</thead>

					<tbody id="tbody">
						<!-- 點一下會從空心變成實心星星，送出加入最愛請求，但如果已加入，要秀出實心星星 ;不管加入取消都送一個ajax回去-->
						<c:forEach var="data" items="${sltAccountCF}">
							<tr style="background-color: #d9e6f2">
							
								<form action="<c:url value="/secure/custFavorite.view">">
									<c:param name="stock_Code" value="${data.stock_Code}" /></c:url>" method="post">
								<td><a
									href="<c:url value='/secure/SpecialFunctionServlet'><c:param name='stock_Code' value='${data.stock_Code}'/></c:url>">${data.stock_Code}</a></td>
								<td>${data.stock_Name}</td>
								<td>${data.purchase_Price}</td>
								<td>${data.selling_Price}</td>
								<td>${data.final_price}</td>
								<c:choose>
									<c:when test="${data.change_Amount eq null}">
										<td>-</td>
									</c:when>
									<c:when test="${data.change_Amount > 0}">
										<td style="color:red;">${data.change_Amount}</td>
									</c:when>
									<c:when test="${data.change_Amount < 0}">
										<td style="color:green;">${data.change_Amount}</td>
									</c:when>
									<c:otherwise>
										<td>${data.change_Amount}</td>
									</c:otherwise>
								</c:choose>								
								<c:choose>
									<c:when test="${data.change_extent eq null}">
										<td>-</td>
									</c:when>
									<c:when test="${data.change_extent > 0}">
										<td style="color:red;">${data.change_extent}</td>
									</c:when>
									<c:when test="${data.change_extent < 0}">
										<td style="color:green;">${data.change_extent}</td>
									</c:when>
									<c:otherwise>
										<td>${data.change_extent}</td>
									</c:otherwise>
								</c:choose>
								<td>${data.acc_Trade_Volume}</td>
								<td><input type="submit" name="action" value="delete"></td>
								</form>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<!-- ************************************** 表格結束   *************************************************** -->

			</div>
			<!-- ************************************** 內文DIV結束  ***************************************************** -->


		</div>
		<!-- ************************************** 最外框DIV結束  ***************************************************** -->
</body>

<!-- ************************************** JavaScript ***************************************************** -->

<script type="text/javascript"
	src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">

var path = "${pageContext.request.contextPath}";
var conceptUrl = path + "/secure/custFavorite.view" ;

var account = "${pageContext.request.remoteUser}";  //要改成程式自動抓
console.log("account: " +account)

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
			  $("img[id='"+value+"']").attr("src" , "<%=request.getContextPath()%>/img/star.gif"); //如果有chng，是實心，就移除最愛，送Ajax
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
		});

	}
	$(document).ready(function() {
		$("#stockTypeTable").DataTable({
			"pageLength" : 10,
			"lengthMenu" : [ 5, 10, 15, 20 ]
		});
	});
</script>
</html>
