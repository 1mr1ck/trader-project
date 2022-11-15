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
    <title>Title</title>
</head>
<body>
<div>
    <form method="post" action="/join/joinUser">
        <input type="text" name="id" placeholder="id">
        <input type="text" name="password" placeholder="pw">
        <input type="text" name="email" placeholder="email">
        <input type="text" name="phone" placeholder="phone">
        <input type="text" name="address" placeholder="address">
        <input type="text" name="nickname" placeholder="nickname">
        <input type="submit" value="회원가입">
    </form>
</div>

</body>
</html>
