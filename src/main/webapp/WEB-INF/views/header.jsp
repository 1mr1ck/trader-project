<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-16
  Time: 오전 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/css/header.css">
</head>
<body>
<%
  HttpSession sessionCheck = request.getSession();
  String id = (String)sessionCheck.getAttribute("log");
%>
<header>
  <nav class="navbar">
    <div class="navbar_logo">
      <a><img src="/css/1111.png"></a>
      <a href="#">공주마켓</a>
    </div>
    <ul class="navbar_manu">
      <li><a href="#"></a>홈</li>
      <li><a href="#"></a>중고장터</li>
      <li><a href="#"></a>커뮤니티</li>
      <li><a href="#"></a>어디일카</li>
    </ul>
    <ul class="navbar_links">
      <%if(id == null){%>
      <li><a href="login">로그인</a></li>
      <li><a href="join">회원가입</a></li>
      <%} else {%>
      <li><a href="myPage">마이페이지</a></li>
      <li><a href="logout">로그아웃</a></li>
      <%}%>
    </ul>
    <a href="#" class="navbar_manubtn">메뉴</a>
  </nav>
</header>
</body>
</html>
