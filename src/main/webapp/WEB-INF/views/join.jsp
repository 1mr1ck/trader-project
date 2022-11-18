<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/14
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Trader Join</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/join.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="container" class="container">
    <div class="content">
        <div class="join_wrap">
            <form id="join_frm">
                <div class="join_title">회원가입</div>
                <div class="join_box">
                    <input type="hidden" name="idCheck" id="idCheck">
                    <input type="text" placeholder="아이디" name="id" id="id" autocomplete="off" style="margin: 0;">
                    <span id="id_ck" class="dpn" id="dpn">이미 사용중인 아이디입니다.</span>

                    <input type="hidden" name="nicknameCheck" id="nicknameCheck">
                    <input type="text" placeholder="닉네임" name="nickname" id="nickname" autocomplete="off">
                    <span id="nickname_ck" class="dpn">이미 사용중인 닉네임입니다.</span>

                    <div class="password_check">
                        <input type="password" placeholder="비밀번호" name="password" id="password" autocomplete="off">
                        <button type="button" id="password_check_btn" class="password_check_btn">비밀번호 보기</button>
                    </div>

                    <div class="password_check">
                        <input type="password" placeholder="비밀번호 확인" id="password_ck" name="password_ck" autocomplete="off">
                        <button type="button" id="password_check_btn2" class="password_check_btn">비밀번호 보기</button>
                    </div>

                    <div class="email_auth">
                        <input type="hidden" name="emailCheck" id="emailCheck">
                        <input type="text" placeholder="이메일" name="email" id="email" class="email" autocomplete="off">
                        <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
                        <span id="email_ck" class="dpn">이미 사용중인 이메일입니다.</span>
                    </div>
                    <input type="text" placeholder="인증번호 입력" id="email_auth_key" autocomplete="off">
                    <input type="text" name="phone" id="phone" placeholder="핸드폰번호" autocomplete="off">
                    <input type="text" name="address" id="address" placeholder="주소" autocomplete="off">
                </div>
                <button type="button" id="join" class="join_btn">가입하기</button>
            </form>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
<script src="script/joinScript.js"></script>
</html>
