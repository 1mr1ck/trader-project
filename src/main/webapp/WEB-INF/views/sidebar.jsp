<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-16
  Time: 오전 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>반응형 사이드바 메뉴</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="/css/sidebar.css">
</head>
<body>
<div class="menu">
  <label for="expand-menu"><div>메뉴</div></label>
  <input type="checkbox" id="expand-menu" name="expand-menu">
  <ul>
    <li><a href="myPageForm" class="item"><div>프로필</div></a></li>
    <li><a href="myBoard" class="item"><div>My Board</div></a></li>
    <li><a href="myReview" class="item"><div>My Review</div></a></li>
    <li><a href="myLike" class="item"><div>My Like</div></a></li>
    <!--         <li><a href="#" class="item"><div>설정</div></a></li> -->
    <li><a href="myDeleteForm" class="item"><div>회원탈퇴</div></a></li>
  </ul>
</div>

</body>
</html>
