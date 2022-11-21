<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/myPageTemplate.css">
    <link rel="stylesheet" href="/css/myPageTable.css">
    <title>Trader</title>
</head>
<body onload="content();">
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
    <jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <div class="wrap">
        <div class="out">
            <div class="in">
                <form method="post">
                    <input type="hidden" value="${sessionScope.no}" id="user_no" name="user_no">
                </form>
                <table class="type04">
                    <thead>
                    <tr>
                        <th class="title">제목</th>
                        <th class="content">내용</th>
                        <th class="nickname">닉네임</th>
                        <th class="modDate">수정날짜</th>
                        <th class="regDate">작성날짜</th>
                    </tr>
                    </thead>
                    <tbody class="userBoardTBody">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="script/userBoardScript.js"></script>
</html>
