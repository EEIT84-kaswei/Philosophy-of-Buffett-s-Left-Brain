<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巴菲特的左腦哲學</title>

<style type="text/css">

input {
	width: 12em;
}

#myblock {
/* 	width: 640px; */
/* 	max-width: 640px; */
	margin: 0em;
	font-size: large;
	font-family: wt011;
}

#myblock ul, #myblock li {
	list-style: none;
	margin: 0;
	padding: 0;
}

#myblock .tabs li {
	float: left;
	color: white;
	margin: 0 0 -1px 5px;
	border: 1px solid #ddd;
	background: #fafafa;
	height: 32px;
	cursor: pointer;
	border-radius: 5px 5px 0 0;
}

#myblock .tabs li.active {
	background: #fff;
	padding-bottom: 1px;
	border-bottom: none;
}

#myblock .tabs li.hover {
	background: #f5f5f5;
}

#myblock .tabs span {
	display: block;
	float: left;
	overflow: hidden;
	padding: 2px 15px 5px 15px;
}

#myblock .tab_container {
	clear: both;
	border: 1px solid #DDD;
	background: #fff;
	overflow: hidden;
	border-radius: 5px;
}

#myblock .tab_container ul {
	position: relative;
	height: 26em;
	overflow: hidden;
}

#myblock .tab_container .tab_content li {
	position: absolute;
/* 	width: 640px; */
	height: 100%;
	/* 	padding: 15px; */
	/* 	margin-top: 10px; */
	background: #fff;
}

#myblock .tab_container .tab_content li h3 {
	color: white;
	font-size: 30px;
	line-height: 22px;
	margin: 50px 5px 40px;
}

.table4_2 tr{
	height:3em;
}
.table4_2 th{
	text-align:right;
	padding-right:8px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 預設顯示第一個頁籤
		// 並先把 .tabs, .tabs li 及 .tab_content, .tab_content li 等元素取出
		// 同時也要取得 .tab_content 的寬
		var _default = 1, $block = $('#myblock'), $tabs = $block.find('.tabs'), $tabsLi = $tabs
				.find('li'), $tab_content = $block.find('.tab_content'), $tab_contentLi = $tab_content
				.find('li'), _width = $tab_content.width();

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
	<center>
	<div style="margin:2em auto" class="container">
		<div id="myblock">
			<ul class="tabs">
				<li><span style="background-color: #000000">登入</span></li>
				<li><span style="background-color: #007799">忘記密碼</span></li>
			</ul>
			<div class="tab_container">
				<ul class="tab_content">
					<li>
						<div style="height: 26em; overflow: auto; background-color: #888888">
						<h3>登入</h3>
						<form action="j_security_check" method="post">
							<div style="align: center; margin: 0">
								<label for="exampleInputName2">輸入帳號  </label> 
								<input type="text" name="j_username" placeholder="請輸入帳號">
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail2">輸入密碼  </label>
								<input type="password" placeholder="請輸入密碼" name="j_password">
							</div>
							<br>
							<span>
								<font color="#ff0000" style="font-weight: bold">${changePassword}</font>
							</span>
							<br>
							<button type="submit" class="btn btn-primary">送出</button>
							
						</form>
						</div>
					</li>
					<li>
						<div style="max-height: 26em; overflow: auto; background-color: #009FCC">
						<h3>忘記密碼</h3>
						<form action="<c:url value='/pages/_02_login/password.do'/>" method="post">
							<div>
								<div>
									<label for="exampleInputName2">請輸入帳號</label>
									<input type="text" placeholder="請輸入帳號"
										name="user" value="${param.user}">
								</div>
								<br>
								<span>
									<font color="#003399" style="font-weight: bold">${error.fp}</font>
								</span>
								<br><br>
								<table>
									<tr>
										<td>
											<p style="color: white; font-size:x-large;">
												系統將寄送新的密碼至您註冊時的<br>
												e-mail地址，請以新密碼重新登入。<br>
												登入後，請務必即時修改您的密碼，<br>
												以維護個人隱私及權益。謝謝！<br>
												<br>
												<br>
											</p>
										</td>
									</tr>
								</table>								
								<button type="submit" class="btn btn-primary">送出</button>
									
								
							</div>
						</form>
						</div>
				</ul>
			</div>
		</div>
		</div>
	</center>
</body>

</body>
</html>