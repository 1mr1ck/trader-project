<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-16
  Time: 오전 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
  <link rel="stylesheet" href="/css/header.css">
</head>
<body>
<%
    HttpSession sessionCheck = request.getSession();
    String id = (String)sessionCheck.getAttribute("log");
%>
<header class="header1">
    <div class="navbar_logo">
      <a href="#">공주마켓</a>
    </div>
    <ul class="navbar1_manu">
      <li><a href="index"></a>홈</li>
      <li><a href="product"></a>중고장터</li>
      <li><a href="boardView"></a>커뮤니티</li>
      <li><a href="#"></a>어디일카</li>
    </ul>
    <%if(id == null){%>
    <ul class="navbar1_links">
      <li><a href="login">로그인</a></li>
      <li><a href="join">회원가입</a></li>
    </ul>
    <%} else {%>
    <ul class="navbar1_links">
        <li><a onclick="window.open('myLetter/${sessionScope.no}', '쪽지보내기', 'width=500, height=500');">쪽지함</a></li>
        <li><a href="myPage">마이페이지</a></li>
        <li><a href="logout">로그아웃</a></li>
    </ul>
    <%}%>
    <a href="#" class="navbar1_manubtn">메뉴</a>
</header>
</body>
</html>
