<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:23 AM
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
    String password = (String)sessionCheck.getAttribute("password");
%>
    <h1>회원탈퇴</h1>
    <form method="post">
        <input type="hidden" id="no" value="<%=no%>">
        <input type="text" id="password" placeholder="pw">
        <input type="button" onclick="userDelete()">
    </form>
<script>
    function userDelete(){
        let no = document.getElementById("no").value;
        var settings = {
            "url": "userDelete/userDeleteProc",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json"
            },
            "data": JSON.stringify({
                "no": no
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
