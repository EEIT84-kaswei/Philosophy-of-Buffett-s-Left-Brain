<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巴菲特的左腦哲學</title>

<style type="text/css">
input {
	width: 12em;
}

#abgne-block-20120327 {
	max-width: 30em;
	margin:30px 10px;
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
#abgne-block-20120327 .tabs li.hover{
	background: #f5f5f5; 
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
	background: #fffddd;
	overflow: hidden;
	border-radius: 2px;
}
#abgne-block-20120327 .tab_container ul {
	position: relative;
	height: 450px;
	overflow: hidden;
}
#abgne-block-20120327 .tab_container .tab_content li {
	position: absolute;
	width: 100%;
	height: 100%;
	padding: 10px;
	margin-top: 0px;
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
/* 	margin: 10px auto; */
	text-align:center;
}

</style>
<script src="<%=request.getContextPath()%>/js/jquery-2.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){	
		$("#customer").click(function(){
			$( "input[name='j_username']" ).val( "sandy" );
			$( "input[name='j_password']" ).val( "sandy" );			
		});
		$("#writer").click(function(){
			$( "input[name='j_username']" ).val( "kitty" );
			$( "input[name='j_password']" ).val( "123" );			
		});
		$("#admin").click(function(){
			$( "input[name='j_username']" ).val( "peterpig" );
			$( "input[name='j_password']" ).val( "peterpig" );			
		});

	});


</script>
<script type="text/javascript">
$(function(){
	// 預設顯示第一個頁籤
	// 並先把 .tabs, .tabs li 及 .tab_content, .tab_content li 等元素取出
	// 同時也要取得 .tab_content 的寬
	var _default = 0, 
		$block = $('#abgne-block-20120327'), 
		$tabs = $block.find('.tabs'), 
		$tabsLi = $tabs.find('li'), 
		$tab_content = $block.find('.tab_content'), 
		$tab_contentLi = $tab_content.find('li'), 
		_width = $tab_content.width();
 
	// 當滑鼠移到 .tabs li 上時要套用 .hover 樣式
	// 移出時要移除 .hover 樣式
	$tabsLi.hover(function(){
		var $this = $(this);
 
		// 若被滑鼠移上去的 li 是目前顯示的頁籤就不做任何動作
		if($this.hasClass('active')) return;
 
		$this.toggleClass('hover');
	}).click(function(){	// 當滑鼠點擊 .tabs li 時
		// 先取出被點擊及目前顯示的頁籤與索引
		var $active = $tabsLi.filter('.active').removeClass('active'), 
			_activeIndex = $active.index(),  
			$this = $(this).addClass('active').removeClass('hover'), 
			_index = $this.index(), 
			isNext = _index > _activeIndex;
 
		// 如果被點擊的頁籤就是目前已顯示的頁籤, 則不做任何動作
		if(_activeIndex == _index) return;
 
		// 依索引大或小來決定移動的位置
		$tab_contentLi.eq(_activeIndex).stop().animate({
			left: isNext ? -_width : _width
		}).end().eq(_index).css('left', isNext ? _width : -_width).stop().animate({
			left: 0
		});
	});
 
	// 先把預設要顯示的頁籤加上 .active 樣式及顯示相對應的內容
	$tabsLi.eq(_default).addClass('active');
	$tab_contentLi.eq(_default).siblings().css({
		left: _width
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
		<div>
			<div id="abgne-block-20120327">
		<ul class="tabs">
			<li style="background-color:rgb(133, 133, 173);font-family:'微軟正黑體'"><span>登入</span></li>
			<li style="background-color:rgb(0, 153, 153);font-family:'微軟正黑體'"><span>忘記密碼</span></li>
		</ul>
		<div class="tab_container">
			<ul class="tab_content">
				<li style="background-color:rgb(133, 133, 173)">
					<font style="text-align:center;font-family:'微軟正黑體';color:#ffffff"><h1>登入</h1></font>
						<form action="j_security_check" method="post" class="form-horizontal" role="form">
							<div style="text-align: center; margin: 10px auto" class="control-label">
								<label style="font-family:'微軟正黑體';color:#ffffff; font-size: medium;">輸入帳號  </label><br> 
								<div class="col-sm-15">
									<input type="text" name="j_username" placeholder="請輸入帳號" class="form-control" style="margin:5px;">
								</div>
							</div>
							<br>
							<div style="text-align: center; margin: 10px auto" class="control-label">
								<label style="font-family:'微軟正黑體';color:#ffffff; font-size: medium;">輸入密碼  </label><br>
								<div class="col-sm-15" style="0 auto">
									<input type="password" placeholder="請輸入密碼" name="j_password" class="form-control" style="margin:5px;">
								</div>
							</div>
							<span>
								<font color="#ff9999" style="font-weight: bold">${changePassword}</font>
							</span>
							<br>
							<button type="submit" class="btn btn-primary" style="margin:2px 10px;">送出</button>
							<button type="button" class="btn btn-primary" style="margin:2px 10px;" id="customer">一般會員</button>
							<button type="button" class="btn btn-primary" style="margin:2px 10px;" id="writer">作家</button>
							<button type="button" class="btn btn-primary" style="margin:2px 10px;" id="admin">管理員</button>
							
						</form>
				</li>
				<li style="background-color:rgb(0, 153, 153)">
					<font style="text-align:center;font-family:'微軟正黑體';color:#ffffff"><h1>忘記密碼</h1></font>
						<form action="<c:url value='/pages/_02_login/password.do'/>" method="post" class="form-horizontal" role="form">

								<div style="text-align: center; margin: 0 auto" class="control-label">
									<label style="font-family:'微軟正黑體';color:#ffffff; font-size: medium;">請輸入帳號</label>
									<br>
										<span>
											<font color="#cceeff" style="font-weight: bold">${error.fp}</font>
										</span>
								</div>
								<div class="col-sm-15">
									<input type="text" placeholder="請輸入帳號" name="user" value="${param.user}" class="form-control" style="margin:5px;">
								</div>		
								<div style="margin:10px; color: #ffffff; font-size: medium;">
									系統將寄送新的密碼至您註冊時的e-mail地址，</br>請以新密碼重新登入。</br>登入後，請務必即時修改您的密碼，</br>以維護個人隱私及權益。謝謝！
								</div>	
						
								<br>
								<button type="submit" class="btn btn-primary">送出</button>

						</form>
					</li>

			</ul>
		</div>
	</div>
		</div>
	</center>
</body>

</body>
</html>