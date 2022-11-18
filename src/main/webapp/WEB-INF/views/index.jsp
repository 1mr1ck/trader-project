<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/14
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>게시판</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
    <button onclick="location.href='product'" style="cursor: pointer">상품</button>
    <button onclick="location.href='boardView'" style="cursor: pointer">커뮤니티</button>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
