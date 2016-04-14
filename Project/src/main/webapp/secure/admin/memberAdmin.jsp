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
	<h4 align="center">會員權限管理</h4>
<br>

<center>
<div style="width:1000px;height:600px">
  <table id="table1">
      <thead>
          <tr>
              <th>會員編號(id)</th>
              <th>登入帳號(account)</th>
              <th>會員姓名(name)</th>
              <th>會員權限(account_role)</th>
          </tr>
      </thead>
      <tbody>
          <tr>
              <td>1</td>
              <td>root</td>
              <td>張秀維</td>
              <td>admin</td>
          </tr>
          <tr>
              <td>2</td>
              <td>sa</td>
              <td>陳姵吟</td>
              <td>admin</td>
          </tr>
          <tr>
              <td>3</td>
              <td>lara</td>
              <td>廖千慧</td>
              <td>author</td>
          </tr>
          <tr>
              <td>4</td>
              <td>kevin</td>
              <td>黃胤凱</td>
              <td>customer</td>
          </tr>
          <tr>
              <td>5</td>
              <td>joyce</td>
              <td>陳昱華</td>
              <td>customer</td>
          </tr>
          <tr>
              <td>6</td>
              <td>peterpig</td>
              <td>張碩文</td>
              <td>admin</td>
          </tr>
          <tr>
              <td>7</td>
              <td>Irina</td>
              <td>趙育伸</td>
              <td>customer</td>
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
      $("#table1").dataTable(opt);
      });
  </script>
</body>
</html>