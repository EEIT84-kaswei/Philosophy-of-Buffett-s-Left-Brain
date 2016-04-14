<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 匯入bootstrap -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- 匯入jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 匯入bootstrap javascript -->
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
  <link href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css" rel="stylesheet">
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.0.min.js"></script>
<!--   <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/jquery-ui.min.js"></script> -->
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>  
  
  
<title>Insert title here</title>

<style type="text/css">
/* 	 用getContextPath()找到根目錄  */

body { padding-top: 80px;
	background-image:url("<%=request.getContextPath() %>/img/dye_st_0117.gif"); 
	background-attachment: fixed;
	font-size:20px;

 }
 
 #thisone li{
 	font-size:20px
 }
 
 a{
 	text-decoration: none;
 }
 a:hover{
 text-decoration: none;
 }
</style>



    
<nav class="nav navbar-inverse navbar-fixed-top" id="thisone" align=center> <!-- 如果要黑色底，請把nav後面的那一串文字改成navbar-inverse -->
        <div class="container-fluid">
            <div class="navbar-header">
            
            <!-- 成為按鈕 -->
            
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                
                
            <!-- 成為按鈕 -->
            
                
                <a class="navbar-brand" href="#"><img src="<%=request.getContextPath() %>/img/logo2.png" style="height:50px">Buffett</a>
            </div>
            
            <!-- 底下放要縮放的內容 -->
            
            
            <div class="collapse navbar-collapse" id="myNavbar" style="font-size:15px">
            <ul class="nav navbar-nav" align=center>
                <li><a href="<c:url value='/Welcome.jsp' />">首頁</a></li>
                <li><a href="<c:url value='/pages/_03_stock_market/instantStock.jsp'/>">即時股票資訊</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">股票分類<span class="caret"></span></a>
            		<ul class="dropdown-menu">
              			 <li><a href="<c:url value='/secure/shanShi.view'/>">上市股</a></li>
               			 <li><a href="<c:url value='/secure/shanQui.view'/>">上櫃股</a></li>
               			 <li><a href="<c:url value='/secure/xinQui.view'/>">興櫃股</a></li>
               			 <li><a href="<c:url value='/secure/chengFenv.view'/>">成分股</a></li>
               			 <li><a href="">概念股</a></li>
               		</ul>
        		</li>
                <li><a href="<c:url value='/pages/article.controller' />">股市專欄</a></li>
                <li><a href="<c:url value='/news.do' />">股市新聞</a></li>
                <li><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp' />">風險評估</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">會員專區<span class="caret"></span></a>
            		<ul class="dropdown-menu">
              			 <li><a href="<c:url value='/secure/_01_register/questionnaire/question.jsp' />">風險評估</a></li>
               			 <li><a href="<c:url value='/secure/_02_login/personal_stock.jsp'/>">自選股</a></li>
               			 <li><a href="<c:url value='/secure/_02_login/recommend.jsp'/>">股票推薦</a></li>
               		</ul>
        		</li>
                <li><a href="">與我聯絡</a></li>
            </ul>
            
            
        <!-- 到右邊開始 -->
            
             <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<c:if test="${empty user}">
                    	<a href="<c:url value='/pages/_02_login/login.jsp' />">
                    		<span class="glyphicon glyphicon-log-in"></span> 
                    		登入
                    	</a>
                    	</c:if>
                    </li>
                    
                    <li>
                    	<c:if test="${!empty user}">
                    <a href="<c:url value='/pages/_02_login/logout.jsp' />">
                    		登出
                    </a>
						</c:if>
					</li>
		                <li><a href="<c:url value='/secure/_02_login/test.jsp'/>"><span class="glyphicon glyphicon-user"></span> 管理員</a></li>
                </ul>
            </div>
        </div>
        <!-- 到右邊結束 -->
        
        
    </nav>


