<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- **************************************** CSS開始   ***************************************************** -->
<style type="text/css">
			
			/*分類股  按鈕設定*/
			#menu{overflow:auto !important;
				  overflow /**/:hidden;}
			
			#menu td{float:left;list-style-type:none;width:4em;font-size:115%}
			
			#menu td a{display:block;width:100%;line-height:2.5em;color:#7E3D76;text-decoration:none;text-align:center}
			
			#menu td a:hover{background-color:#DDD;color:#666}
			
			/*分類股表格設定*/
			#stockTypeTable{
				width: 100%;
 				border: 0px solid #E0E0E0; /*測完要改顏色*/ 
				border-collapse:collapse;  /*把內外框的距離清掉*/
				margin: 0 auto;} 
 			#stockTypeTable th{
 				border: 1px solid black;
 				text-align: center; 
 				height: 25px; }
 			#stockTypeTable td{
 				border: 1px solid black;
 				text-align: center; 
 				height: 25px; }
 			#stockTypeTable tbody tr:HOVER {background-color:#FFE6D9;color:#666}
 			td.favorL:hovor{background-color:#DDD;color:#666;}
</style>
<!-- **************************************** 引用jQuery   ***************************************************** -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.1.min.js"></script>
<!-- **************************************** 網頁抬頭   ******************************************************* -->
<title>${stockTypeName}</title>    
<!-- ************************************** 最外框DIV開始  ***************************************************** -->
</head>
<body>



<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />

<!-- 網頁主要導覽列 -->

<div>
<jsp:include page="/nav.jsp" />
</div>

<!-- ************************************** 最外框DIV開始  ***************************************************** -->
<div style="border: 1px solid red;width:70%;margin:2em auto">



<!-- ************************************** 內文DIV開始  ***************************************************** -->
<div align="center" style="width:90%;margin: 0 auto;border: 1px solid red;">

	<!-- ******************************** 各種分類按鈕   ************************************************ -->
	<div style="width:100%;margin: 0 auto;border: 1px solid black;">
	<table id="menu">
	<tr>
		<td><a href="<c:url value='/secure/conceptStock.view'/>">概念股</a></td>

		<td><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s1"/></c:url>">上市股</a></td> 
 		<td><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s2"/></c:url>">上櫃股</a></td> 
  		<td><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s3"/></c:url>">興櫃股</a></td>
		<td><a href="<c:url value='/secure/chengFenv.view'/>">成分股</a></td>
	</tr>
	</table>
	</div>
	<br>

	<!-- **************************************表格開始*********************************************** -->	
	<table id="stockTypeTable">
		<thead>
			<tr ><td colspan="9"><b>${stockTypeName}</b></td></tr>          <!-- 要修改成EL取值 -->   
			<tr style="height: 30px;background:#C7C7E2">
			<th>加入自選股</th>
			<th>股票代碼</th>
			<th>股票名稱</th>
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
		<c:forEach var="data" items="${stockType}">
			<tr>
			<td><img onclick="getValue(${data.stock_Code})" alt="加入自選股" src="<%=request.getContextPath() %>/img/star.gif" height=20 name="star"></td>
			<td><a href="<c:url value='/secure/SpecialFunctionServlet'><c:param name='stock_Code' value='${data.stock_Code}'/></c:url>">${data.stock_Code}</a></td>
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


</div>
<!-- ************************************** 最外框DIV結束  ***************************************************** -->
</body>

<!-- ************************************** JavaScript ***************************************************** -->
<script type="text/javascript">

	
	
$(document).ready(function() {
	var trs=$("tbody#tbody tr");  //先找出tbody中有幾個'tr'
	$("img[name='star']").click(function(){  //當<img>被按下去時，最靠近它的tr是第幾個？（從0起跳）
      //var index=trs.index($(this).closest("tr"));
      //console.log("index : " + index);
	  //var stockCode = $(this).parent().next().css({"color": "red", "border": "2px solid red"});
	  var codeString = $(this).parent().next().text(); //字串形態
	  var codeInt = parseInt(codeString); //改成int
	  console.log("股票代號 : " + codeInt);  
	  var starPath = $(this).attr("src");  //取出這個點下去的星星路徑
      //console.log("starPath : " + starPath );
      var starIndex = starPath.lastIndexOf("chng");  //確認圖片路徑有沒有 chng
      //console.log("starIndex : " + starIndex );
      if(starIndex == -1){
		  $(this).attr("src" , "<%=request.getContextPath() %>/img/chngstar.gif");  //如果沒有chng，是空心，就加最愛，送Ajax
	  }else{
		  $(this).attr("src" , "<%=request.getContextPath() %>/img/star.gif");  //如果有chng，是實心，就移除最愛，送Ajax
	  }
    });
});
function getValue(value){
	console.log(value);
// 	 var URLs = '';
// 	 $.ajax({
//         url: URLs,
//         data: datatype ,
//         type:"POST",
//         //dataType:'text',
//         success: function(msg){
//             alert(msg);
//         },
//         beforeSend:function(){
//             $('#loadingIMG').show();
//         },
//         complete:function(){
//             $('#loadingIMG').hide();
//         },
//         error:function(xhr, ajaxOptions, thrownError){ 
//             alert(xhr.status); 
//             alert(thrownError); 
//         }
//     });
}


//取位置失敗寫法，待改良
// window.onload = function () {
//     var areas = document.getElementsByName("star");
//     var alen = areas.length;
//     console.log("有幾顆星星：" + areas.length);
//     for (var n = 0 ; n < areas.length ; n++) {
//         areas[n].onclick = function () { doClick(n) };
//         console.log("doClick(n)" + doClick(n));
//     }
// }



</script>
</html>
