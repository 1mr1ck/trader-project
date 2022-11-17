<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>

<div>
    <form method="post">
        <input type="hidden" id="no" autocomplete="off" value="${sessionScope.log}">
        <input type="text" id="id" name="id" autocomplete="off" value="${sessionScope.}" placeholder="id" readonly>
        <input type="text" id="password" name="password" autocomplete="off" placeholder="pw">
        <input type="text" id="email" name="email" autocomplete="off" value="${sessionScope.email}" placeholder="email" readonly>
        <input type="text" id="phone" name="phone" autocomplete="off" value="${sessionScope.phone}" onblur="phoneNullCheck('${sessionScope.phone}')" placeholder="phone">
        <input type="text" id="address" name="address" autocomplete="off" value="${sessionScope.address}" onblur="addressNullCheck('${sessionScope.address}')" placeholder="address">
        <input type="text" id="nickname" name="nickname" autocomplete="off" value="${sessionScope.nickname}" onblur="nicknameNullCheck('${sessionScope.nickname}')" placeholder="nickname">
        <input type="button" value="정보수정" onclick="update()">
    </form>
</div>
<script>

    function nicknameNullCheck(nameCheck){
        name1 = document.getElementById('name').value;

        if(name1 === ''){
            document.getElementById('name').value = nameCheck;
        }
    }

    function phoneNullCheck(phoneCheck){
        phone1 = document.getElementById('phone').value;

        if(phone1 === ''){
            document.getElementById('phone').value = phoneCheck;
        }
    }

    function addressNullCheck(addressCheck){
        address1 = document.getElementById('address').value;

        if(address1 === ''){
            document.getElementById('address').value = addressCheck;
        }
    }

    function update(){

        let no = document.getElementById("no").value;
        let id = document.getElementById("id").value;
        let password = document.getElementById("password").value;
        let email = document.getElementById("email").value;
        let phone = document.getElementById("phone").value;
        let address = document.getElementById("address").value;
        let nickname = document.getElementById("nickname").value;


    var settings = {
        "url": "userUpdate/UpdateProc",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "no": no,
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

        location.href="/myPage";
    }
</script>
</body>
</html>
