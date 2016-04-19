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
#logtable {
	
	padding: 1em;
	/*border: 0.2px;*/
	/*border-color: green;*/
	/*border-radius: 8px;*/
	color: purple;

}

#abgne-block-20120327 {
	width: 640px;
	margin:3em 2em;
	background-color: #666666;
	border-radius:20px;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
}

#abgne-block-20120327 ul, #abgne-block-20120327 li {
	list-style: none;
	margin: 0;
	padding: 0;
}

#abgne-block-20120327 .tabs li {
	float: left;
	margin: 0 0 -1px 5px;
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
/* 	background: #f5f5f5; */
}

#abgne-block-20120327 .tabs span {
	display: block;
	float: left;
	overflow: hidden;
	padding: 7px 15px 5px 15px;
}

#abgne-block-20120327 .tab_container {
	clear: both;
	border: 1px solid #DDD;
/* 	background: #fff; */
	overflow: hidden;
	border-radius: 5px;
}

#abgne-block-20120327 .tab_container ul {
	position: relative;
	height: 19em;
	overflow: hidden;
}

#abgne-block-20120327 .tab_container .tab_content li {
	position: absolute;
	width: 610px;
	height: 100%;
	padding: 15px;
	margin-top: 10px;
/* 	background: #fff; */
}

#abgne-block-20120327 .tab_container .tab_content li img {
	display: block;
	float: left;
	margin-right: 15px;
}

#abgne-block-20120327 .tab_container .tab_content li h3 {
	font-size: 22px;
	line-height: 22px;
	margin: 5px 0 15px;
}
</style>
<script type="text/javascript">
	$(function() {
		// 預設顯示第一個頁籤
		// 並先把 .tabs, .tabs li 及 .tab_content, .tab_content li 等元素取出
		// 同時也要取得 .tab_content 的寬
		var _default = 0, $block = $('#abgne-block-20120327'), $tabs = $block
				.find('.tabs'), $tabsLi = $tabs.find('li'), $tab_content = $block
				.find('.tab_content'), $tab_contentLi = $tab_content.find('li'), _width = $tab_content
				.width();

		// 當滑鼠移到 .tabs li 上時要套用 .hover 樣式
		// 移出時要移除 .hover 樣式
		$tabsLi.hover(function() {
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
		<div id="abgne-block-20120327">
			
				<div class="tab_container">
					<ul class="tab_content">
						<li>

							<h2><font style="color:#ffffb3;font-weight:bold;">登入</font></h2>
							<div align="center">
								<form action="j_security_check" method="post">
								<table id="logtable" border='0'>
									<tr style="height:50px">
										<td><font style="color:#FFFFFF">帳號&nbsp;&nbsp;</font></td>
										<td><input type="text" size="20" name="j_username"
											placeholder="請輸入帳號"></td>
									</tr>
									<tr style="height:50px">
										<td><font style="color:#FFFFFF">密碼&nbsp;&nbsp;</font></td>
										<td><input type="password" size="20" name="j_password">
										</td>
									</tr>
									<tr>
								</table>
								<span><font color="#ff0000" style="font-weight: bold">${changePassword}</font></span>
								<br>
								
								<input type="submit" value="送出" style="margin:0.5em;font-size:100%" 
									class="btn btn-primary" >
								</form>
							</div>
						</li>
						<li>
							<h2><font style="color:#ffffb3;font-weight:bold;">忘記密碼</font></h2>
							<form action='<c:url value="/pages/_02_login/password.do"/>'
								method='POST'>
								<font style="color:#FFFFFF;margin:15px auto">請輸入您的帳號： </font>
								<input type="text" name="account" size="30" required> 
								<br>
								<p></p>
								<p></p>
								<font color="#ff0000" style="font-weight: bold;margin:10px auto">${error.account}</font>
								<p></p>
								<p></p>
								<font style="color:#FFFFFF;font-weight: bold;">本站將寄送新的密碼至您註冊時的e-mail地址，</font><br>
								<font style="color:#FFFFFF;font-weight: bold;">請使用新密碼重新登入。</font><br>
								<font style="color:#FFFFFF;font-weight: bold;">登入後，請即時修改您的密碼，以維護個人隱私權益。</font><br> <br>
								<input type="submit" value="送出" style="margin:0.5em;font-size:100%" 
									class="btn btn-primary" >
							</form>
						</li>

					</ul>
				</div>
				<ul class="tabs">
					<li><span>登入</span></li>
					<li><span>忘記密碼</span></li>

				</ul>
			
		</div>
	</center>


</body>
</html>
