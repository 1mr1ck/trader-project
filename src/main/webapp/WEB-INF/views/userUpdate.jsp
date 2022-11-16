<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>

<%
    HttpSession sessionCheck = request.getSession();
    String id = (String)sessionCheck.getAttribute("log");
    int no = (Integer)sessionCheck.getAttribute("no");
    String nickname = (String)sessionCheck.getAttribute("nickname");
%>

<div>
    <form method="post">
        <input type="hidden" id="no" value="<%=no%>">
        <input type="text" id="id" name="id" value="<%=id %>" placeholder="id" readonly>
        <input type="text" id="password" name="password" placeholder="pw">
        <input type="text" id="email" name="email" placeholder="email">
        <input type="text" id="phone" name="phone" placeholder="phone">
        <input type="text" id="address" name="address" placeholder="address">
        <input type="text" id="nickname" name="nickname" placeholder="nickname" value="<%=nickname%>">
        <input type="button" value="정보수정" onclick="update()">
    </form>
</div>
<script>
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
