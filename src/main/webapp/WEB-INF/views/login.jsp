<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/15
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trader login</title>
</head>
<body>
    <form method="post" action="login/loginProc">
        <input type="text" name="id" placeholder="id">
        <input type="text" name="password" placeholder="pw">
        <input type="submit" value="로그인">
    </form>
</body>
</html>
