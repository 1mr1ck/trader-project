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
    <link rel="stylesheet" href="/css/myPageTemplate.css">
    <title>Trader</title>
</head>
<body>
<%
    HttpSession sessionCheck = request.getSession();
    String id = (String)sessionCheck.getAttribute("log");
    int no = (Integer)sessionCheck.getAttribute("no");
    String nickname = (String)sessionCheck.getAttribute("nickname");
    String password = (String)sessionCheck.getAttribute("password");
%>

<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
    <jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <h1>회원탈퇴</h1>
    <form method="post">
        <input type="hidden" id="no" value="<%=no%>">
        <input type="text" id="password" placeholder="pw">
        <input type="button" onclick="userDelete()" value="회원탈퇴">
    </form>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="script/userDeleteScript.js"></script>
</html>
