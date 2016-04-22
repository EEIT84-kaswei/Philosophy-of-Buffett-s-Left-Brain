<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
.form-group{
	margin:10px;
}
#abgne-block-20120327 {
	width: 640px;
}

#abgne-block-20120327 ul, #abgne-block-20120327 li {
	list-style: none;
	margin: 0em 2em 0 2em;
	padding: 0;
}

#abgne-block-20120327 .tabs li {
	float: left;
	margin: 0;
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
	padding: 0px 15px 0px 15px;
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
	height: 29em;
/* 	overflow: hidden; */
/* 	overflow-y: scroll; */
	
}

#abgne-block-20120327 .tab_container .tab_content li {
	position: absolute;
	width: 80%;
/*  	height: 100%;  */
/* 	padding: 15px; */
/* 	margin-top: 10px; */
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
	margin: 1em 0 10px 0;
}
</style>
<script type="text/javascript">
	$(function() {
		// 預設顯示第一個頁籤
		// 並先把 .tabs, .tabs li 及 .tab_content, .tab_content li 等元素取出
		// 同時也要取得 .tab_content 的寬
		var _default = 1, $block = $('#abgne-block-20120327'), $tabs = $block
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
</head>
<body>
	<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
	<jsp:include page="/title.jsp" />


	<!-- 網頁主要導覽列 -->

	<jsp:include page="/nav.jsp" />
<script>	
	$(document).ready(function () {
       var obheight = 700;//超過容器高度自動捲軸
       var obname = '#out';//容器的ID
       var mc = $(obname).height();
       if(mc>obheight) $(obname).height(obheight+'px');
});
</script>
	<center>
		<div id="abgne-block-20120327">
			<ul class="tabs" style="margin:1em 0 0 0">
				<li style="background-color: #FFDEFF"><span>登入</span></li>
				<li style="background-color: #FFDEFF"><span>忘記密碼</span></li>
				<li style="background-color: #FFDEFF"><span>申請會員</span></li>
			</ul>
			<div class="tab_container" style="background-color: #DEFFFF">
				<ul class="tab_content" style="overflow-y:auto;overflow-x:auto">
					<li style="background-color: #DEFFFF">
						<h3>登入</h3>

						<form action="j_security_check" method="post" class="form-inline">
							<div class="form-group">
								<label for="exampleInputName2">輸入帳號</label>
								<input type="text" class="form-control" 
								name="j_username" placeholder="請輸入帳號">
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail2">輸入密碼</label> 
								<input type="password" class="form-control"
									placeholder="請輸入密碼" name="j_password">
							</div>
							<br> <span><font color="#ff0000"
								style="font-weight: bold">${changePassword}</font></span> <br>
							<button type="submit" class="btn btn-primary">送出</button>

						</form>


					</li>
					<li style="background-color: #DEFFFF">
						
						<h3><br><br><br><br>忘記密碼<br><br></h3>

						<form action="<c:url value='/pages/_02_login/password.do'/>" method="post" class="form-inline">
							<div class="form-group">
								<label for="exampleInputName2">輸入帳號</label> 
								<input type="text" class="form-control" name="account" placeholder="請輸入帳號">
							</div>
							<br>
							<span><font color="#00FF00"
								style="font-weight: bold">${error.fp}</font></span>
								<br>
								<table>
								<tr>
								<td>
							<p class="text-justify">	
							本站將寄送新的密碼至您註冊時的e-mail地址，<br>
							請使用新密碼重新登入。<br>
							登入後，請即時修改您的密碼，<br>
							以維護個人隱私權益。<br>
								<br><br>
							</p>	
								</td>
								</tr> 
								</table>
							<button type="submit" class="btn btn-primary">送出</button>
							<br><br><br>
						</form>


					</li>
					<li style="background-color: #DEFFFF;">

						<h3>註冊會員</h3>

						<form action='<c:url value="/pages/_01_register/account.do"/>'
							ENCTYPE='multipart/form-data' method='POST' class="form-inline">
							<div id="out">
							<div class="form-group">
								<label for="exampleInputName2">帳號　　　　</label> <input type="text"
									name="account" class="form-control" value="${param.account}"
									placeholder="請輸入帳號"> <font size="-1" color="#FF0000">${error.account}</font>
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword">密碼　　　　</label> <input
									type="password" class="form-control"
									placeholder="請輸入密碼" name="passw" value="${param.passw}">
								<font size="-1" color="#FF0000">${error.passw}</font>
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">密碼確認　　</label> 
								<input type="password"
									class="form-control" name="checkpassw"
									value="${param.checkpassw}"
									placeholder="請再輸入一次密碼">
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">姓名　　　　</label> <input type="text"
									class="form-control"
									placeholder="請輸入姓名" name="name" value="${param.name}">
								<font size="-1" color="#FF0000">${error.checkpassw}</font>
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">身分證字號　</label> <input type="text"
									class="form-control" name="idc" value="${param.idc}"
									placeholder="請輸入身分證字號"> <font
									size="-1" color="#FF0000">${error.idc}</font>
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">電子郵件信箱</label> <input
									type="email" class="form-control" name="email"
									value="${param.email}"
									placeholder="請輸入電子郵件信箱"> <font size="-1" color="#FF0000">${error.email}</font>
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">電話區碼　　</label> <input type=text
									class="form-control" name="area_phone"
									value="${param.area_phone}"
									placeholder="請輸入市內電話區碼">
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">電話號碼　　</label> <input type="text"
									class="form-control" name="phone" value="${param.phone}"
									 placeholder="請輸入手機或市內電話">
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">通訊地址　　</label> <input type="text"
									class="form-control" name="address" value="${param.address}"
									 placeholder="請輸入通訊地址">
							</div>
							
							<div class="form-group">
								<label for="exampleInputName2">認證碼　　　</label> <input type="text"
									class="form-control" name="auth" 
									placeholder="請輸入郵件中的認證碼"> <font size="-1" color="#FF0000">${error.auth}</font>
							</div>


							<div align="center" style="margin: 1em">
								<button type="submit" class="btn btn-default" name="prodaction" value="寄送認證信">寄送認證信</button>
								<button type="submit" class="btn btn-default" name="prodaction" value="送出">送出</button>
								<button class="btn btn-default"
									onclick="location.href='../../Welcome.jsp'">返回</button>
								<button type="reset" class="btn btn-default">清除表單</button>
								
							</div>
							</div>
						</form>



					</li>
				</ul>
			</div>

		</div>
	</center>

</body>
</html>
