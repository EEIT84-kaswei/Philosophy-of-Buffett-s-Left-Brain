<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 9]>
<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>管理員主控台</title>

  <style>
    article,aside,figure,figcaption,footer,header,hgroup,menu,nav,section {display:block;}
    body {font: 62.5% "Trebuchet MS", sans-serif; margin: 50px;}
  </style>
</head>
<body>
<!-- 網頁最上方標題「巴菲特的左腦哲學」 -->



<!-- 網頁主要導覽列 -->

<jsp:include page="/nav.jsp" />

<br><br><br>
	<h2 align="center">管理員平台</h2>
	<h4 align="center">個股資料管理</h4>
<br>

<center>
<div style="width:1000px;height:600px">

  <table id="table2">
      <thead>
          <tr>
              <th>股票編號(stock_Code)</th>
              <th>股票名稱(stock_Name)</th>
              <th>股票分類(stock_TypeCode)</th>
              <th>概念股分類(cs_Code)</th>
              <th>風險等級(commend)</th>
              <th>修改(commend)</th>
 			 
          </tr>
      </thead>
      <tbody>

 
          <tr>
          	  <c:url value="/secure/SpecialFunctionServlet" var="path" scope="page">
          	  <c:param name="stock_Code" value="2330" /></c:url>
              <td>4</td>
              <td>kevin</td>
              <td>黃胤凱</td>
              <td>123</td>
              <td>A</td> 
              <td><input type="submit" value="修改"></td> 
          </tr>
          <tr>
          	  <c:url value="/secure/SpecialFunctionServlet" var="path" scope="page">
          	  <c:param name="stock_Code" value="2330" /></c:url>
              <td><input type="text" size="12" placeholder="股票編號"></td>
              <td><input type="text" size="12" placeholder="股票名稱"></td>
              <td><input type="text" size="12" placeholder="股票分類"></td>
              <td><input type="text" size="12" placeholder="概念股分類"></td>
              <td><input type="text" size="12" placeholder="風險等級"></td> 
              <td><input type="submit" value="新增"></td> 
              
          </tr>
       </tbody>
  </table>
  </div>
  </center>
  <script language="JavaScript">
    $(document).ready(function(){ 
      var opt={"oLanguage":{"sProcessing":"處理中...",
                            "sLengthMenu":"顯示 _MENU_ 項結果",
                            "sZeroRecords":"沒有匹配結果",
                            "sInfo":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                            "sInfoEmpty":"顯示第 0 至 0 項結果，共 0 項",
                            "sInfoFiltered":"(從 _MAX_ 項結果過濾)",
                            "sSearch":"搜索:",
                            "oPaginate":{"sFirst":"首頁",
                                         "sPrevious":"上頁",
                                         "sNext":"下頁",
                                         "sLast":"尾頁"}
		            }
	       };
      $("#table2").dataTable(opt);
      });
  </script>
</body>
</html>