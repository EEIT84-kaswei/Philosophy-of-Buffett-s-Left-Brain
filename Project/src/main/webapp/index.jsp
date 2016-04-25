<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <meta http-equiv="refresh" content="5;url=${pageContext.request.contextPath}/Welcome.jsp"> --%>
<title>巴菲特的左腦哲學</title>
<link href='https://fonts.googleapis.com/css?family=Montserrat'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Asap:400' rel='stylesheet'
	type='text/css'>
<script type="text/javascript">
	var _jf = _jf || [];
	_jf.push([ 'p', '41723' ]);
	_jf.push([ '_setFont', 'wt011', 'css', '.wt011' ]);
	_jf.push([ '_setFont', 'wt011', 'alias', 'wt011' ]);
	_jf.push([ '_setFont', 'wt011', 'english', 'Asap' ]);
	_jf.push([ '_setFont', 'wt011', 'weight', 400 ]);
	(function(f, q, c, h, e, i, r, d) {
		var k = f._jf;
		if (k.constructor === Object) {
			return
		}
		var l, t = q.getElementsByTagName("html")[0], a = function(u) {
			for ( var v in k) {
				if (k[v][0] == u) {
					if (false === k[v][1].call(k)) {
						break
					}
				}
			}
		}, j = /\S+/g, o = /[\t\r\n\f]/g, b = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, g = "".trim, s = g
				&& !g.call("\uFEFF\xA0") ? function(u) {
			return u == null ? "" : g.call(u)
		} : function(u) {
			return u == null ? "" : (u + "").replace(b, "")
		}, m = function(y) {
			var w, z, v, u, x = typeof y === "string" && y;
			if (x) {
				w = (y || "").match(j) || [];
				z = t[c] ? (" " + t[c] + " ").replace(o, " ") : " ";
				if (z) {
					u = 0;
					while ((v = w[u++])) {
						if (z.indexOf(" " + v + " ") < 0) {
							z += v + " "
						}
					}
					t[c] = s(z)
				}
			}
		}, p = function(y) {
			var w, z, v, u, x = arguments.length === 0 || typeof y === "string"
					&& y;
			if (x) {
				w = (y || "").match(j) || [];
				z = t[c] ? (" " + t[c] + " ").replace(o, " ") : "";
				if (z) {
					u = 0;
					while ((v = w[u++])) {
						while (z.indexOf(" " + v + " ") >= 0) {
							z = z.replace(" " + v + " ", " ")
						}
					}
					t[c] = y ? s(z) : ""
				}
			}
		}, n;
		k.push([ "_eventActived", function() {
			p(h);
			m(e)
		} ]);
		k.push([ "_eventInactived", function() {
			p(h);
			m(i)
		} ]);
		k.addScript = n = function(u, A, w, C, E, B) {
			E = E || function() {
			};
			B = B || function() {
			};
			var x = q.createElement("script"), z = q
					.getElementsByTagName("script")[0], v, y = false, D = function() {
				x.src = "";
				x.onerror = x.onload = x.onreadystatechange = null;
				x.parentNode.removeChild(x);
				x = null;
				a("_eventInactived");
				B()
			};
			if (C) {
				v = setTimeout(function() {
					D()
				}, C)
			}
			x.type = A || "text/javascript";
			x.async = w;
			x.onload = x.onreadystatechange = function(G, F) {
				if (!y
						&& (!x.readyState || /loaded|complete/
								.test(x.readyState))) {
					y = true;
					if (C) {
						clearTimeout(v)
					}
					x.src = "";
					x.onerror = x.onload = x.onreadystatechange = null;
					x.parentNode.removeChild(x);
					x = null;
					if (!F) {
						setTimeout(function() {
							E()
						}, 200)
					}
				}
			};
			x.onerror = function(H, G, F) {
				if (C) {
					clearTimeout(v)
				}
				D();
				return true
			};
			x.src = u;
			z.parentNode.insertBefore(x, z)
		};
		a("_eventPreload");
		m(h);
		n(r, "text/javascript", false, 3000)
	})(this, this.document, "className", "jf-loading", "jf-active",
			"jf-inactive",
			"//ds.justfont.com/js/stable/v/4.9.8/id/181412913145");
</script>
<style>
html {
	height: 100%;
}

body {
	/* 	font-family: 'Montserrat', sans-serif; */
	font-family: wt011;
	font-size: x-large;
	background-image: url("${pageContext.request.contextPath}/img/back.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}

#full_screen {
	margin: 5em 0 0 0;
	width: 70.5%;
	height: auto;
}
</style>

<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>

<script type="text/javascript">
<!-- 	圖片自適應畫面大小：1.設定圖片最大尺寸。2. 設定JS如下面兩行。 -->
	$('document').ready(function() {
		$('#container').height($(window).height());
	});
</script>

</head>
<body>
	<div class="container" id="container" align="center">
		<div class="main">
			<a href="<%=request.getContextPath()%>/Welcome.jsp"> <img
				src="<%=request.getContextPath()%>/img/logo.png" id="full_screen"
				title="Philosophy of Buffett's Left Brain" class="img-responsive" />
			</a>
		</div>
		<h4>${logoutMessage}</h4>
		<div class="footer">
			<table>
				<tr>
					<td>廖千慧&nbsp;</td>
					<td>Liao, Chien-huei</td>
				</tr>
				<tr>
					<td>張秀維&nbsp;</td>
					<td>Chang, Hsiu-wei</td>
				</tr>
				<tr>
					<td>張碩文&nbsp;</td>
					<td>Chang, Shuo-wen</td>
				</tr>
				<tr>
					<td>陳姵吟&nbsp;</td>
					<td>Chen, Pei-yin</td>
				</tr>
				<tr>
					<td>陳昱華&nbsp;</td>
					<td>Chen, Yu-hua</td>
				</tr>
				<tr>
					<td>黃胤凱&nbsp;</td>
					<td>Huang, In-kai</td>
				</tr>
				<tr>
					<td>趙育伸&nbsp;</td>
					<td>Chao, Yu-shen</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>