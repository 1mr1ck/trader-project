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
<div class="wrap">
  <div class="out">
    <div class="in">
      <div class="menu">
        <label for="expand-menu"><div>메뉴</div></label>
        <input type="checkbox" id="expand-menu" name="expand-menu">
        <ul>
          <li><a href="#" onclick="my_product()" class="item"><div>거래내역</div></a></li>
          <input type="hidden" id="p_type" name="p_type" value="전체">
          <input type="hidden" id="p_check" name="p_check" value="전체">
          <li><a href="#" onclick="my_board()" class="item"><div>나의 게시글</div></a></li>
          <li><a href="#" onclick="my_boardCmt()" class="item"><div>나의 커뮤니티 댓글</div></a></li>
          <li><a href="#" onclick="my_productCmt()" class="item"><div>나의 중고장터 댓글</div></a></li>
          <li><a href="#" onclick="my_wish()" class="item"><div>좋아요</div></a></li>
          <li><a href="userUpdate" class="item"><div>정보수정</div></a></li>
          <li><a href="userDelete" class="item"><div>회원탈퇴</div></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>

</body>
</html>
