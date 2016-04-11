<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="<c:url value="/servlet/_06_message.controller.MessageServlet" />" method="get">
<table>
	<tr>
		<td>留言編號(mno) : </td>
		<td><input type="text" name="mno" value="${param.mno}"></td>
		<td><span class="error">${error.id}</span></td>
	</tr>
	<tr>
		<td>會員編號(id) : </td>
		<td><input type="text" name="id" value="${param.id}"></td>
		<td></td>
	</tr>

	<tr>
		<td>文章編號(ano) : </td>
		<td><input type="text" name="ano" value="${param.ano}"></td>
		<td><span class="error">${error.price}</span></td>
	</tr>
	<tr>
		<td>發布時間(mtime) : </td>
		<td><input type="text" name="mtime" value="${param.mtime}"></td>
		<td><span class="error">${error.make}</span></td>
	</tr>
	<tr>
		<td>發布內容(mcontext) : </td>
		<td><input type="text" name="mcontext" value="${param.mcontext}"></td>
		<td><span class="error">${error.expire}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Insert">
			<input type="submit" name="prodaction" value="Update">
		</td>
		<td>
			<input type="submit" name="prodaction" value="Delete">
			<input type="submit" name="prodaction" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>





<!-- <form method="get" action="showMessage.jsp"> -->

<!-- <br>姓名：    -->
<!-- <input name=username size=15value=""> -->
<!-- <br>留言： -->
<!-- <br> -->
<!-- <textarea name="mcontext" rows="5" cols="40"> -->
<!-- </textarea> -->
<!-- <br> -->
<!-- <input type="submit" value="送出"> -->
<!-- <input type="reset" value="重填"> -->
<!-- </form>  -->


<!-- <br>信箱：    -->
<!-- <input name="email" size=15value=""> -->

</body>
</html>