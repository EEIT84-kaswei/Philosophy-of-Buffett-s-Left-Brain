<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>申請加入會員</title>
<link rel="stylesheet" href="<c:url value='/css/carley.css' />">
<script type="text/javascript" src="<c:url value='/js/jquery-2.2.1.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/strength.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/account.js' />"></script>

<script>
 $(document).ready(function($) {

  $('#myPassword').strength({
   strengthClass : 'strength',
   strengthMeterClass : 'strength_meter',
   strengthButtonClass : 'button_strength',
   strengthButtonText : 'Show Password',
   strengthButtonTextToggle : 'Hide Password'
  });
  
  var path = "${pageContext.request.contextPath}";
  $('input[name="account"]').blur(function() {
     var url = path+"/pages/_01_register/account.view";
    var account = $('input[name="account"]').val();
    sendRequest("GET", url, account, "textText");
  });
 });
</script>
<script src="js/bootstrap.min.js"></script>

</head>
<style>
/* .table4_2 table { */
/*  width: 100%; */
/*  margin: 15px 0; */
/*  border: 0; */
/* } */

/* #table4_2 th { */
/*  background-color: rgba(0, 153, 204, 0.7); */
/*  color: #000000; */
/* } */

/* .table4_2, .table4_2 th, .table4_2 td { */
/*  font-size: 0.95em; */
/*  text-align: center; */
/*  padding: 4px; */
/*  border-collapse: collapse; */
/* } */

/* .table4_2 th, .table4_2 td { */
/*  border: 1px solid #dfe8fe; */
/*  border-width: 1px 0 1px 0 */
/* } */

/* .table4_2 tr { */
/*  border: 1px solid #dfe8fe; */
/* } */

/* .table4_2 tr:nth-child(odd) { */
/*  background-color: #ecf1fe; */
/* } */

/* .table4_2 tr:nth-child(even) { */
/*  background-color: #fdfdfd; */
/* } */

.mid {
 width: 50%;
 align: center;
 margin: 2em auto;
 padding: 10px;
 border-radius: 10px;
}

#table4_2 {
 width: 38em;
 margin: 15px 0;
 border: 0;
}

#table4_2 th {
 background-color: rgba(0, 153, 204, 0.7);
 color: #000000;
}

#table4_2, #table4_2 th, #table4_2 td {
 font-size: 1em;
 text-align: center;
 padding: 10px;
 margin:10px;
 border-collapse: collapse;
}

#table4_2 th, #table4_2 td {
 border: 1px solid #dfe8fe;
 border-width: 1px 0 1px 0;
 font-weight: bold;
 font-size: 120%;
}

#table4_2 tr {
 border: 1px solid #dfe8fe;
}

#table4_2 tr:nth-child(odd) {
 background-color: rgba(255,255,255,0.7);
}

#table4_2 tr:nth-child(even) {
 background-color: rgba(255,255,255,0.7);
}

</style>
<body>

  <!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
<jsp:include page="/title.jsp" />


  <!-- 網頁主要導覽列 -->
  <div>
   <jsp:include page="/nav.jsp" />
  </div>
  
  <h2 style="text-align: center;color:#ccffff;font-weight:bold">會員註冊</h2>

<!--   <div align="center" style="margin: 3em;" class="table-responsive"> -->
  <div id="mid" align="center" class="table-responsive">
   <form id='myform'
    action='<c:url value="/pages/_01_register/account.do"/>'
    ENCTYPE='multipart/form-data' method='POST'>
    <table id="table4_2" style="padding: 1em; height: 3em">
     <tr>
      <th>帳號</th>
      <td><input type="text" name="account" size="35"
       value="${param.account}" ><br>
       <font id="myfont" size="-1" color="#008080">${error.account}</font><br>
      </td>
     </tr>
     <tr>
      <th>密碼</th>
      <td><input id="myPassword" type="password" name="passw" value="${param.passw}" size="35"><br>
       <font size="-1" color="#008080">${error.passw}</font>
      </td>
     </tr>
     <tr>
      <th>密碼確認</th>
      <td><input type="password" name="checkpassw" value="${param.checkpassw}" size="35"><br>
       <font size="-1" color="#008080">${error.checkpassw}</font>
      </td>
     </tr>
     <tr>
      <th>姓名</th>
      <td><input type="text" name="name" size="35" value="${param.name}" ><br>
       <font size="-1" color="#008080">${error.name}</font>
      </td>
     </tr>
     <tr>
      <th>身分證字號</th>
      <td><input type="text" name="idc" size="35" value="${param.idc}" ><br>
       <font size="-1" color="#008080">${error.idc}</font>
      </td>
     </tr>
     <tr>
      <th>電子郵件信箱</th>
      <td><input type="text" name="email" value="${param.email}" size="35"><br>
       <font size="-1" color="#008080">${error.email}</font>
      </td>
     </tr>
     <tr>
      <th>電話區碼</th>
      <td><input type="text" name="area_phone" value="${param.area_phone}" size="35"></td>
     </tr>
     <tr>
      <th>電話號碼</th>
      <td><input type="text" name="phone" value="${param.phone}" size="35"></td>
     </tr>
     <tr>
      <th>通訊地址</th>
      <td><input type="text" name="address" value="${param.address}" size="35"></td>
     </tr>
     <tr>
      <th>認證碼</th>
      <td><input type="text" name="auth" size="35"><font size="-1" color="#008080">${error.auth}</font>
      </td>
     </tr>
    </table>


    <div align="center" style="margin: 2em">
     <input type="submit" name="prodaction" value="寄送認證信" class="btn btn-default"/> 
     <input type="submit" name="prodaction" value="送出"  class="btn btn-default" />
     <input type="button" value="返回" onclick="location.href='../../Welcome.jsp'"  class="btn btn-default"/> 
     <input type="reset" value="清除表單" class="btn btn-default">
    </div>

   </form>



  </div>



</body>
</html>