<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-20
  Time: 오후 7:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>탭 메뉴</title>
  <style>
    *{ padding: 0; margin: 0; list-style: none;}
    body{ padding: 30px;}
    .tab_type1 ul{ display: flex; height: 60px; border-bottom: 1px solid #5da62b;}
    .tab_type1 ul li { flex: 1;}
    .tab_type1 ul li:first-child a { border-left: 1px solid #ddd;}
    .tab_type1 ul li a { display: block; height: 59px; border: 1px solid #ddd; border-left: none; border-bottom: none; font-size:14px;
      color:#505050; text-align: center; line-height: 59px; text-decoration: none;}
    .tab_type1 ul li a.on { position: relative; height: 58px; border-color: #5da62b; border-top-width: 2px; line-height: 57px; border-bottom: 1px solid #fff;}
    .tab_type1 ul li a.on:before { content: ""; position: absolute; left:-1px; top: -2px; width: 1px; height: 100%; background: #5da62b; border-top: 2px solid #5da62b;}
  </style>
</head>
<body>
    <nav class="tab_type1">
      <ul>
        <li><a href="#" class="on">커뮤니티</a></li>
        <li><a href="#">홈</a></li>
        <li><a href="#">중고거래</a></li>
        <li><a href="#" >쪽지?</a></li>
      </ul>
    </nav>
</body>
</html>