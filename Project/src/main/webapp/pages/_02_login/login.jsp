<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登入</title>
<style>

#forget_id{
	margin:3em;
	padding:1em;
	border:0.2px;
	border-color:green;
	border-radius:8px;
	color:purple;
	height:2em
}

#login_id{
	margin:3em;
	padding:1em;
	border:0.2px;
	border-color:green;
	border-radius:8px;
	color:purple;
	height:2em
}

</style>
<script type="text/javascript">
function change_div(id){
  if (id == 'forget_id' )
  {
     document.getElementById("login_id").style.display = 'none' ;
     document.getElementById("forget_id").style.display = 'block' ;
  }
  else
  {
     document.getElementById("forget_id").style.display = 'none' ;
     document.getElementById("login_id").style.display = 'block' ;
  }
}
</script>

<style type="text/css">
  #forget_id {
     display:none;
          }
</style>
</head>
<body>
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


<!-- 網頁主要導覽列 -->

<jsp:include page="/nav.jsp" />




<!-- 登入的區塊 -->
<div align="center" id="login_id">

	<form action="j_security_check" method="post">
	<table id="logtable" style="border:5px #FFD382 groove;" cellpadding="10" border='0'>
		<tr>
			<td>帳號</td>
			<td>
				<input type="text" size="20" name="j_username" placeholder="請輸入帳號">
			</td>
		</tr>
		<tr>
			<td>密碼</td>
			<td>
				<input type="password" size="20" name="j_password">
			</td>
		</tr>	

	</table>
	<p><br>
			<input type="submit" value="登入">
			<input type="button" value="申請會員" onclick="location.href='<c:url value="/pages/_01_register/accept.jsp"/>'">
			<input type="button" value="忘記密碼" onclick="change_div('forget_id')">
	
	</p>

	</form>
	</div>


<!-- 忘記密碼的區塊 -->
<div align="center" id="forget_id">
請輸入您的帳號：<input type="text" name="account" size="30"><br>
<br>
本站將寄送新的密碼至您的e-mail地址，請使用新密碼重新登入。<br>
登入後，請即時修改您的密碼，以維護個人隱私權益。<br>
<input type="submit" value="送出" onclick="change_div('login_id')">
</div>





<!-- 

<hr>
  <!-- add special effect -->
  <input type="hidden" id="btn4" value="switchslowBtn"/>  
  <!-- detailed description about the special effect -->
  <input type="hidden" id="btn5" value="showBtnEff"/>
  <!-- Block -->
   <div id="showBlock" style="display:none;height:60px;width:80px"></div>  
<hr>







<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
//add special effect
$("#btn4").click(function () {
  $("#showBlock").toggle("slow");
});

//add more details effect
$("#btn5").click(function () {
  $("#showBlock").show(1000, function() {
    alert('Good Job!');
  });
});
</script> 
</body>
</html>