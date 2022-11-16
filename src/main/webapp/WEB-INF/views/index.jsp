<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/14
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
    <button onclick="location.href='join'">회원가입</button>
    <button onclick="location.href='login'">로그인</button>
    <button onclick="location.href='createProduct'">게시글작성</button>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
