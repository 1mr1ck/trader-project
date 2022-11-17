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
</head>
<body>

<div id="container" class="container">
    <div class="content">
        <div class="join_wrap">
            <form id="join_frm">
                <div class="join_title">회원가입</div>
                <div class="join_box">
                    <input type="text" placeholder="아이디" name="id" id="id" autocomplete="off" style="margin: 0;">
                    <span id="id_ck" class="dpn">이미 사용중인 아이디입니다.</span>
                    <input type="text" placeholder="닉네임" name="nickname" id="nickname" autocomplete="off">
                    <span id="nickname_ck" class="dpn">이미 사용중인 닉네임입니다.</span>
                    <input type="password" placeholder="비밀번호" name="password" id="password" autocomplete="off">
                    <input type="password" placeholder="비밀번호  확인" id="password_ck" autocomplete="off">
                    <div class="email_auth">
                        <input type="text" placeholder="이메일" name="email" id="email" class="email" autocomplete="off">
                        <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
                    </div>
                    <input type="text" placeholder="인증번호 입력" id="email_auth_key" autocomplete="off">
                    <input type="text" name="phone" id="phone" placeholder="phone" autocomplete="off">
                    <input type="text" name="address" id="address" placeholder="address" autocomplete="off">
                </div>
                <button type="button" id="join" class="join_btn">가입하기</button>
            </form>
        </div>
    </div>
</div>
<script>

    function fn_join(){
        var f = $('#join_frm');
        var formData = f.serialize();

        let id = document.getElementById("id").value;
        let password = document.getElementById("password").value;
        let email = document.getElementById("email").value;
        let phone = document.getElementById("phone").value;
        let address = document.getElementById("address").value;
        let nickname = document.getElementById("nickname").value;

        var settings = {
            "url": "join/joinUser",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json"
            },
            "data": JSON.stringify({
                "no": 0,
                "id": id,
                "password": password,
                "email": email,
                "phone": phone,
                "address": address,
                "nickname": nickname
            }),
        };

        $.ajax(settings).done(function (response) {
            console.log(response);
        });

        alert("회원가입이 완료되었습니다.");
        location.href="/"
    }

    $(function() {

        var email_auth_cd = '';

        $('#join').click(function(){

            if($('#id').val() == ""){
                alert("아이디를 입력해주세요.");
                return false;
            }

            if($('#nickname').val() == ""){
                alert("닉네임을 입력해주세요.");
                return false;
            }

            if($('#password').val() == ""){
                alert("비밀번호를 입력해주세요.");
                return false;
            }

            if($('#password').val() != $('#password_ck').val()){
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }

            if($('#email_auth_key').val() != email_auth_cd){
                alert("인증번호가 일치하지 않습니다.");
                return false;
            }

            fn_join();
        });

        $(".email_auth_btn").click(function(){
            var email = $('#email').val();

            if(email == ''){
                alert("이메일을 입력해주세요.");
                return false;
            }

            $.ajax({
                type : "POST",
                url : "/emailAuth",
                data : {email : email},
                success: function(data){
                    alert("인증번호가 발송되었습니다.");
                    email_auth_cd = data;
                },
                error: function(data){
                    alert("메일 발송에 실패했습니다.");
                }
            });
        });

    });
</script>
</body>
</html>
