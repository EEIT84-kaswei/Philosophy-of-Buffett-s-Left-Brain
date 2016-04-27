<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

  
<title>導覽列</title>

<style type="text/css">
/* 	 用getContextPath()找到根目錄  */

body { 
	background-image:url("<%=request.getContextPath() %>/img/carley1.jpg"); 
	background-attachment: fixed;
	background-size:cover;
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

<%--  <c:set var="loc" value="${param.locale}"/> --%>
<c:choose>
	<c:when test="${! empty (param.locale)}">
		<c:set var="loc" value="${param.locale}" scope="session"/>
	</c:when>
	<c:when test="${! empty (sessionScope.loc)}">
		<c:set var="loc" value="${sessionScope.loc}" scope="session"/>
	</c:when>
	<c:otherwise>
		<c:set var="loc" value="${pageContext.request.locale}" scope="session"/>
	</c:otherwise>
</c:choose>
<%--     <c:if test="${! empty (param.locale)}"> --%>
<%--        <c:set var="loc" value="${param.locale}"/> --%>
<%--     </c:if> --%>
   
 <fmt:setLocale value="${loc}"/>  

 <fmt:bundle basename="properties.message">   
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
            
                
                <a class="navbar-brand" href="<c:url value='/index.jsp'/>"><fmt:message key="home" /></a>
            </div>
            
            <!-- 底下放要縮放的內容 -->
            
            
            <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="basicConcept" /><span class="caret"></span></a>
                    <ul class="dropdown-menu">
						<li><a href="<c:url value='/pages/_03_stock_market/basicTermList.jsp' />"><fmt:message key="importantTerms"/></a></li> 
      					<li><a href="<c:url value='/pages/_03_stock_market/basicTerms.jsp' />"><fmt:message key="importantIndex" /></a></li> 
               		</ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="stockCategory"/><span class="caret"></span></a>
            		<ul class="dropdown-menu">
						<li><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s1"/></c:url>"><fmt:message key="listedStock"/></a></li> 
      					<li><a href="<c:url value='/secure/stockType.view'><c:param name="stockType" value="s2"/></c:url>"><fmt:message key="otcStock"/></a></li> 
               			<li><a href="<c:url value='/secure/conceptStock.view'/>"><fmt:message key="conceptStock"/></a></li>
               		</ul>
        		</li>
                <li><a href="<c:url value='/pages/article.controller' />"><fmt:message key="stockColumn" /></a></li>
                <li><a href="<c:url value='/pages/_05_newsArticle/news.do' />"><fmt:message key="stockNews" /></a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><fmt:message key="membersOnly" /><span class="caret"></span></a>
            		<ul class="dropdown-menu">
              			 <li><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp' />"><fmt:message key="riskAssessment" /></a></li>
               			 <li><a href="<c:url value='/secure/custFavorite.view'/>"><fmt:message key="optionalStock" /></a></li>
               			 <li><a href="<c:url value='/secure/_02_login.controller/QuestionServlet'/>"><fmt:message key="recommendedStocks"/></a></li>
               			 <li><a href="<c:url value='/secure/StockAnalysis'/>"><fmt:message key="stockAnalysis" /></a></li>
						 <li><a href="<c:url value='/secure/_02_login/member.do' />"><fmt:message key="memberInformationManagement" /></a></li>
               		</ul>
        		</li>
                <li><a href="mailto:eeit84kaswei@gmail.com" title="So Call Me Maybe"><fmt:message key="soCallMeMaybe"/></a></li>
            </ul>
<%--             <c:url value='/SoCallMeMaybe.jsp'/> --%>
            
        <!-- 到右邊開始 -->
            
             <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<c:if test="${pageContext.request.remoteUser != null}">
	                    	<a href="<c:url value='/secure/_02_login/member.do' />">
	                    		<span class="glyphicon glyphicon-user"></span> 
	                    		<fmt:message key="hello"/>${pageContext.request.remoteUser}
	                    	</a>
                    	</c:if>
                    </li>
                    
                    <li>
                    	<c:if test="${pageContext.request.remoteUser == null}">
	                    	<a href="<c:url value='/pages/_01_register/registerPage.jsp' />">
	                    		<span class="glyphicon glyphicon-plus"></span> 
	                    		<fmt:message key="registration"/>
	                    	</a>
                    	</c:if>
                    </li>
                    
                    <li>
                    	<c:if test="${pageContext.request.remoteUser == null}">
	                    	<a href="<c:url value='/secure/_02_login/loginSuccess.jsp'/>">
	                    		<span class="glyphicon glyphicon-log-in"></span> 
	                    		<fmt:message key="login"/>
	                    	</a>
                    	</c:if>
                    </li>
                    
                    <li>                  
                    	<c:if test="${pageContext.request.remoteUser != null}">
		                    <a href="<c:url value='/pages/_02_login/logout.jsp'/>">
		                    	<span class="glyphicon glyphicon-log-out"></span>
								<fmt:message key="logout"/>
		                    </a>
						</c:if>
					</li>

        		<c:if test='<%=request.isUserInRole("admin")%>'>
	                <li class="dropdown">
	                	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                		<span class="glyphicon glyphicon-wrench"></span> 
	                			<fmt:message key="admin"/>
	                		<span class="caret"/>
	                	</a>
	            		<ul class="dropdown-menu">
              				<li><a href="<c:url value='/member.do' />"><fmt:message key="memberManagement"/></a></li>
               				<li><a href="<c:url value='/secure/StockCodeServlet'/>"><fmt:message key="stockManagement" /></a></li>	
	               		</ul>
	        		</li>
        		</c:if>

                </ul>
            </div>
        </div>
        <!-- 到右邊結束 -->
        
        
    </nav>

</fmt:bundle>
