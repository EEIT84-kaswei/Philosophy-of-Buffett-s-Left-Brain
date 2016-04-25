<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巴菲特的左腦哲學</title>

<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet' type='text/css'><script type="text/javascript">var _jf = _jf || [];_jf.push(['p','41723']);_jf.push(['_setFont','wt011','css','.wt011']);_jf.push(['_setFont','wt011','alias','wt011']);_jf.push(['_setFont','wt011','english','Asap']);_jf.push(['_setFont','wt011','weight',400]);(function(f,q,c,h,e,i,r,d){var k=f._jf;if(k.constructor===Object){return}var l,t=q.getElementsByTagName("html")[0],a=function(u){for(var v in k){if(k[v][0]==u){if(false===k[v][1].call(k)){break}}}},j=/\S+/g,o=/[\t\r\n\f]/g,b=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,g="".trim,s=g&&!g.call("\uFEFF\xA0")?function(u){return u==null?"":g.call(u)}:function(u){return u==null?"":(u+"").replace(b,"")},m=function(y){var w,z,v,u,x=typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):" ";if(z){u=0;while((v=w[u++])){if(z.indexOf(" "+v+" ")<0){z+=v+" "}}t[c]=s(z)}}},p=function(y){var w,z,v,u,x=arguments.length===0||typeof y==="string"&&y;if(x){w=(y||"").match(j)||[];z=t[c]?(" "+t[c]+" ").replace(o," "):"";if(z){u=0;while((v=w[u++])){while(z.indexOf(" "+v+" ")>=0){z=z.replace(" "+v+" "," ")}}t[c]=y?s(z):""}}},n;k.push(["_eventActived",function(){p(h);m(e)}]);k.push(["_eventInactived",function(){p(h);m(i)}]);k.addScript=n=function(u,A,w,C,E,B){E=E||function(){};B=B||function(){};var x=q.createElement("script"),z=q.getElementsByTagName("script")[0],v,y=false,D=function(){x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;a("_eventInactived");B()};if(C){v=setTimeout(function(){D()},C)}x.type=A||"text/javascript";x.async=w;x.onload=x.onreadystatechange=function(G,F){if(!y&&(!x.readyState||/loaded|complete/.test(x.readyState))){y=true;if(C){clearTimeout(v)}x.src="";x.onerror=x.onload=x.onreadystatechange=null;x.parentNode.removeChild(x);x=null;if(!F){setTimeout(function(){E()},200)}}};x.onerror=function(H,G,F){if(C){clearTimeout(v)}D();return true};x.src=u;z.parentNode.insertBefore(x,z)};a("_eventPreload");m(h);n(r,"text/javascript",false,3000)})(this,this.document,"className","jf-loading","jf-active","jf-inactive","//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");</script>

<style type="text/css">

input {
	width: 12em;
}

#myblock {
/* 	width: 640px; */
	max-width: 640px;
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
	width: 640px;
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
				<li><span style="background-color: #008888">註冊會員</span></li>
			</ul>
			<div class="tab_container">
				<ul class="tab_content">
					<li>
						<div style="max-width: 640px; height: 26em; overflow: auto; background-color: #888888">
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
							<h4 style="color: #888888">1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</h4>
						</form>
						</div>
					</li>
					<li>
						<div style="max-width: 640px; max-height: 26em; overflow: auto; background-color: #009FCC">
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
								<h4 style="color: #009FCC">1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</h4>	
								
							</div>
						</form>
						</div>
					<li>
						<div style="max-width: 640px; max-height: 26em; overflow: auto; background-color: #00AAAA">
							<h3>註冊會員</h3>
							
							<form id='myform' action='<c:url value="/pages/_01_register/account.do"/>' ENCTYPE='multipart/form-data' method='POST'>
								<table class="table4_2" style="padding: 1em; height: 3em">
									<tr>
										<th>帳號</th>
										<td><input type="text" name="account" value="${param.account}"></td>
										<td><font size="3" color="#ffffff" >&nbsp;${error.account}</font></td>
									</tr>
									<tr>
										<th>密碼</th>
										<td><input type="password" name="passw" value="${param.passw}"></td>
										<td><font size="3" color="#ffffff">&nbsp;${error.passw}</font></td>
									</tr>
									<tr>
										<th>密碼確認</th>
										<td><input type="password" name="checkpassw" value="${param.checkpassw}"></td>
										<td><font size="3" color="#ffffff">&nbsp;${error.checkpassw}</font></td>
									</tr>
									<tr>
										<th>姓名</th>
										<td><input type="text" name="name"
											value="${param.name}" placeholder="請填寫中文姓名"></td>
										<td><font size="3" color="#ffffff">&nbsp;${error.name}</font></td>
									</tr>
									<tr>
										<th>身分證字號</th>
										<td><input type="text" name="idc"
											value="${param.idc}" placeholder="請輸入身分證字號"></td>
										<td><font size="3" color="#ffffff">&nbsp;${error.idc}</font></td>
									</tr>
									<tr>
										<th>電子郵件信箱　</th>
										<td><input type="text" name="email" value="${param.email}"></td>
										<td><font size="3" color="#ffffff">&nbsp;${error.email}</font></td>
									</tr>
									<tr>
										<th>電話區碼</th>
										<td><input type="text" name="area_phone" value="${param.area_phone}"></td>
									</tr>
									<tr>
										<th>電話號碼</th>
										<td><input type="text" name="phone" value="${param.phone}"></td>
									</tr>
									<tr>
										<th>通訊地址</th>
										<td><input type="text" name="address" value="${param.address}"></td>
									</tr>
									<tr>
										<th>認證碼</th>
										<td><input type="text" name="auth"></td>
										<td><font size="3" color="#ffffff">&nbsp;${error.auth}</font></td>
									</tr>
								</table>
								<h4 style="color: #00AAAA">1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</h4>
		
								<div align="center" style="margin: 2em">									
									<input type="submit" name="prodaction" value="寄送認證信"  class="btn btn-primary" style="width: 8em"/> 
									<input type="submit" name="prodaction" value="送出"  class="btn btn-primary" style="width: 8em"/>
									<input type="button" value="返回" onclick="location.href='../../Welcome.jsp'" class="btn btn-primary" style="width: 8em"/> 
									<input type="reset" value="清除表單"  class="btn btn-primary" style="width: 8em">
								</div>		
							</form>
						</div>
					</li>
				</ul>
			</div>
		</div>
		</div>
	</center>
</body>

</body>
</html>