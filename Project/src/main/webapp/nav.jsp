<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

  
<title>導覽列</title>

<style type="text/css">
/* 	 用getContextPath()找到根目錄  */

body { 
	background-image:url("<%=request.getContextPath() %>/img/dye_st_0117.gif"); 
	background-attachment: fixed;
	
 }
 
 #thisone{
	font-size:20px;
	
 }
 
 
 a{
 	text-decoration: none;
 }
 a:hover{
 text-decoration: none;
 }
</style>



    
<nav class="nav navbar-inverse navbar-static-top" id="thisone" align="center"> <!-- 如果要黑色底，請把nav後面的那一串文字改成navbar-inverse -->
        <div class="container-fluid" style="">
            <div class="navbar-header">
            
            <!-- 成為按鈕 -->
            
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                
                
            <!-- 成為按鈕 -->
            
                
                <a class="navbar-brand" href="<c:url value='/index.jsp'/>">Buffett</a>
            </div>
            
            <!-- 底下放要縮放的內容 -->
            
            
            <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">基礎概念<span class="caret"></span></a>
                    <ul class="dropdown-menu">
						<li><a href="<c:url value='/pages/_03_stock_market/basicTermList.jsp' />">重要術語</a></li> 
      					<li><a href="<c:url value='/pages/_03_stock_market/basicTerms.jsp' />">重要指標</a></li> 
               		</ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">股票分類<span class="caret"></span></a>
            		<ul class="dropdown-menu">
						<li><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s1"/></c:url>">上市股</a></li> 
      					<li><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s2"/></c:url>">上櫃股</a></li> 
               			<li><a href="<c:url value='/secure/conceptStock.view'/>">概念股</a></li>
               		</ul>
        		</li>
                <li><a href="<c:url value='/pages/article.controller' />">股市專欄</a></li>
                <li><a href="<c:url value='/pages/_05_newsArticle/news.do' />">股市新聞</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">會員專區<span class="caret"></span></a>
            		<ul class="dropdown-menu">
              			 <li><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp' />">風險評估</a></li>
               			 <li><a href="<c:url value='/secure/custFavorite.view'/>">自選股</a></li>
               			 <li><a href="<c:url value='/secure/_02_login.controller/QuestionServlet'/>">股票推薦</a></li>
						 <li><a href="<c:url value='/secure/_02_login/member.do' />">會員資料管理</a></li>
               		</ul>
        		</li>
                <li><a href="mailto:eeit84kaswei@gmail.com" title="So Call Me Maybe">與我聯絡</a></li>
            </ul>
<%--             <c:url value='/SoCallMeMaybe.jsp'/> --%>
            
        <!-- 到右邊開始 -->
            
             <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<c:if test="${pageContext.request.remoteUser != null}">
	                    	<a href="<c:url value='/secure/_02_login/member.do' />">
	                    		<span class="glyphicon glyphicon-user"></span> 
	                    		您好，${pageContext.request.remoteUser}
	                    	</a>
                    	</c:if>
                    </li>
                    
                    <li>
                    	<c:if test="${pageContext.request.remoteUser == null}">
	                    	<a href="<c:url value='/secure/_02_login/loginSuccess.jsp'/>">
	                    		<span class="glyphicon glyphicon-log-in"></span> 
	                    		登入
	                    	</a>
                    	</c:if>
                    </li>
                    
                    <li>                  
                    	<c:if test="${pageContext.request.remoteUser != null}">
		                    <a href="<c:url value='/pages/_02_login/logout.jsp'/>">
		                    	<span class="glyphicon glyphicon-log-out"></span>
								登出
		                    </a>
						</c:if>
					</li>

        		<c:if test='<%=request.isUserInRole("admin")%>'>
	                <li class="dropdown">
	                	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                		<span class="glyphicon glyphicon-wrench"></span> 
	                			管理員
	                		<span class="caret"/>
	                	</a>
	            		<ul class="dropdown-menu">
              				<li><a href="<c:url value='/member.do' />">會員管理</a></li>
               				<li><a href="<c:url value='/secure/StockCodeServlet'/>">股票管理</a></li>	
	               		</ul>
	        		</li>
        		</c:if>

                </ul>
            </div>
        </div>
        <!-- 到右邊結束 -->
        
        
    </nav>


