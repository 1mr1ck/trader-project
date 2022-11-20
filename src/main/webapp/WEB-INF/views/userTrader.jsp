<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Trader</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/myPageTemplate.css">
</head>
<body onload="content();">
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
<jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <form method="post">
        <input type="hidden" value="${sessionScope.no}" id="user_no" name="user_no">
    </form>
    <table>
        <thead>
            <tr>
                <th>카테고리</th>
                <th>제목</th>
                <th>내용</th>
                <th>진행 확인</th>
                <th>판매/구매</th>
            </tr>
        </thead>
        <tbody class="userProductTBody">
        </tbody>
    </table>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="script/userProductScript.js"></script>
</html>
