<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="5;url=/Project/Welcome.jsp">
<title>index.html</title>
<link rel="stylesheet" href="css/bootstrap.min.css" >
<script src="js/bootstrap.min.js" ></script>

<style type="text/css">
/*
#div img { 
max-width:200px; 
myimg:expression(onload=function(){ 
this.style.width=(this.offsetWidth > 200)?"200px":"auto"});
} 
*/
	body {
    margin:0;
    padding:0;
/*     background: #E0E0FF;  */
/*     -moz-background-size: cover; */
/*     background-size: cover; */
}/*
	.main{
	margin:0;
    padding:0;
    background: #E0E0FF ;
    -moz-background-size: cover;
    background-size: cover;
	}
	*/
/* center center fixed no-repeat */
/* 	.main{ */
/* 	float:center; */
/* 	text-align:center; */
/*  	background-color:#E0E0FF; */
/* 	} */
	
	.footer{
 	background-color:#77FFEE; 
	}
	
	table{
	margin:auto;
	}
	
	tt{
	font-size:20;
	}
	
	td{
	text-align:left;
	}

#full_screen {
    height: 100%;
}
#container {
    width: 100%;
} 



</style>
<script type="text/javascript">
$('document').ready(function(){
    $('#container').height($(window).height());    
}); 
</script>
</head>
<body onload="resizeImage()">

<div class="container" id="container" align="center">
<!-- <center><img src="img/logo.png" onload="resizeImage()" margin="0" border="0"></center> -->
	<div class="main" style="background-image: url('<%=request.getContextPath() %>/img/BG2.jpg')">
		<a href="<%=request.getContextPath() %>/Welcome.jsp">
    <img src="<%=request.getContextPath() %>/img/logo.png" id="full_screen"  title="Philosophy of Buffett's Left Brain" style="max-width:700"/></a>
	</div>
<!-- 	圖片自適應畫面大小：1.設定圖片最大尺寸。2. 設定JS如下面兩行。 -->
<!-- 	$('document').ready(function(){ -->
<!--    $('#container').height($(window).height());});  -->
	<h2>${logoutMessage}</h2>
	<div class="footer">
	<br>
		<table>
		<tr>
			<td><tt>廖千慧&nbsp;</tt></td>
			<td><tt>Liao, Chien-huei</tt></td>
		</tr>
		<tr>
			<td><tt>張秀維&nbsp;</tt></td>
			<td><tt>Chang, Hsiu-wei</tt></td>
		</tr>
		<tr>
			<td><tt>張碩文&nbsp;</tt></td>
			<td><tt>Chang, Shuo-wen</tt></td>
		</tr>
		<tr>
			<td><tt>陳姵吟&nbsp;</tt></td>
			<td><tt>Chen, Pei-yin</tt></td>
		</tr>
		<tr>
			<td><tt>陳昱華&nbsp;</tt></td>
			<td><tt>Chen, Yu-hua</tt></td>
		</tr>
		<tr>
			<td><tt>黃胤凱&nbsp;</tt></td>
			<td><tt>Huang, In-kai</tt></td>
		</tr>
		<tr>
			<td><tt>趙育伸&nbsp;</tt></td>
			<td><tt>Chao, Yu-shen</tt></td>
		</tr>
		</table>
	<br>
	</div>
</div>
</body>

</html>
