<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/14
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trader Join</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div>
    <form method="post">
        <input type="text" id="id" name="id" placeholder="id">
        <input type="text" id="password" name="password" placeholder="pw">
        <input type="text" id="email" name="email" placeholder="email">
        <input type="text" id="phone" name="phone" placeholder="phone">
        <input type="text" id="address" name="address" placeholder="address">
        <input type="text" id="nickname" name="nickname" placeholder="nickname">
        <input type="button" value="회원가입" onclick="join()">
    </form>
</div>
<script>
    function join(){
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

        location.href="/";
    }
</script>
</body>
</html>
