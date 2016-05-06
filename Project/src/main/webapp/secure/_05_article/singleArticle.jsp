<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>專欄文章</title>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
		$("#write").click(function(){
			CKEDITOR.instances["content"].setData("<p>今年風險這麼高，投資商品市場的貴金屬比A股有吸引力多了，債信違約這種事太危險，不如不碰。</p>")
		});
	});
</script>
</head>
<body>	
		<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->
		<jsp:include page="/title.jsp" />


		<!-- 網頁主要導覽列 -->
		<div>
			<jsp:include page="/nav.jsp" />
		</div>

		<div style="margin: 2em auto 0 auto; padding: 2em 0 0 0;background-color: rgba(204, 204, 204, 0.99);max-width:60em">

			<!-- 表格開始 -->
			
				<form action="
					<c:url value="/pages/article.controller">
					    <c:param name="sano" value="${singleArticle.ano}" />
					</c:url>" method="post">
				
				<h2 style="text-align:center;color:#008080;font-weight:bold">${singleArticle.atitle}</h2>
				<p style="text-align:center">${singleArticle.aname}</p>
				<fmt:formatDate var="time" value="${singleArticle.atime}" type="both" dateStyle="long" /> 
				<p style="text-align:center;color:#999999">${time}</p>
				<br>
				<div style="max-width:58em;margin:0 auto;padding:0 10px">
					<p>${singleArticle.acontext}</p>
				</div>
				<div align=center>

					<c:if test='<%=request.isUserInRole("admin")%>'>
						<input type="submit" name="prodaction" value="修改" class="btn btn-default">
						<input type="submit" name="prodaction" value="刪除" class="btn btn-default" onclick="if(confirm('您確定刪除此篇文章嗎?')) return true;else return false">								
					</c:if>
					
				<%--
 					<h1><%=request.getRemoteUser()%></h1>
					<h1>${singleArticle.account}</h1> 
				--%>
					<c:set var="user" value="<%=request.getRemoteUser()%>" />		
					<c:if test='<%=request.isUserInRole("writer")%>'>
						<c:if test='${singleArticle.account == user }'>
							<input type="submit" name="prodaction" value="修改" class="btn btn-default">
							<input type="submit" name="prodaction" value="刪除" class="btn btn-default" onclick="if(confirm('您確定刪除此篇文章嗎?')) return true;else return false">								
						</c:if>
					</c:if>				
					
				</div>
				</form>
				
				<!-- ------------------------------- 楚河漢界 ------------------------------- -->
				
				<div>
				<div style="margin:2em;border-top:3px dotted #000000;"></div>
				<h3 style="text-align:center;color:#006600;font-family: wt011;">讀者回應</h3>

				<div style="max-width:50em;margin:1em auto">
				
				<table style="border: 2px solid #006600;" id="msgTable">
				<c:if test="${not empty msg}">
				<c:forEach var="row" items="${msg}">				
					
						<tr style="border-top: 2px solid #006600;">
							<td style="margin:20px 0 0 10px;padding:20px 0 0 10px;">回應者：${row.account}</td>
						</tr>
						<tr>
							<td style="margin:20px 0 0 10px;padding:0 0 0 10px;">回應時間：<fmt:formatDate value="${row.mtime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<td style="margin:20px 0 0 10px;padding:0 0 0 10px;">回應內容：<br>${row.mcontext}</td>
						</tr>
						<c:if test='<%=request.isUserInRole("admin")%>'>				
							<tr style="border-botton: 2px solid #006600;">
								<td style="margin:20px 0 20px 10px;padding:20px 0 20px 10px;">
										<form action="<c:url value="/pages/article.controller"/>" method="get">
											<input type="hidden" name="mno" value="${row.mno}">
											<input type="hidden" name="updm" value="${singleArticle.ano}">
											<input type="submit" name="revise" value="編輯" class="btn btn-default">
											&nbsp;
											<input type="submit" name="revise" value="刪除" class="btn btn-default"
												onclick="if(confirm('您確定刪除此留言嗎?')) return true;else return false">
										</form>									
								</td>
							</tr>
						</c:if>
						<c:if test='${row.account == user }'>
							<c:if test='<%=!request.isUserInRole("admin")%>'>											
								<tr style="border-botton: 2px solid #006600;">
									<td style="margin:20px 0 20px 10px;padding:20px 0 20px 10px;">
									<form action="<c:url value="/pages/article.controller"/>" method="get">
										<input type="hidden" name="mno" value="${row.mno}">
										<input type="hidden" name="updm" value="${singleArticle.ano}">
										<input type="submit" name="revise" value="編輯" class="btn btn-default">
										&nbsp;
										<input type="submit" name="revise" value="刪除" class="btn btn-default"
											onclick="if(confirm('您確定刪除此留言嗎?')) return true;else return false">
									</form>																		
									</td>
								</tr>
							</c:if>
						</c:if>
				</c:forEach>
				
			</c:if>
				<tr>
				<td>
			<form action="<c:url value="/pages/article.controller"/>" method="post">
				<input type="hidden" name="account" value="<%=request.getRemoteUser()%>"> 
				<input type="hidden" name="sano" value="${singleArticle.ano}">
				<textarea  rows="20" cols="40" name="content" required></textarea>
				<script>
					CKEDITOR.replace('content', {
// 						width:880,
					});
				</script>
				<br /> 
				<span><font style="font-size: medium; color: red">${error.content}</font></span>
				<center>
				<div style="margin:5px 0 30px 0">
				<input type="submit" name="revise" value="留言" class="btn btn-default">
				<input type="button" id="write" value="一鍵輸入留言" class="btn btn-default">
				</div>
				</center>
			</form>
			
			</td>
			</tr>
			</table>
				</div>

		</div>
</div>


</body>
</html>
