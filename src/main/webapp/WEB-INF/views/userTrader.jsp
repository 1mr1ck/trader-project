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
                <button onclick="productPrint()">진행중</button>
                <button onclick="productPrint()">예약중</button>
                <button onclick="productPrint()">거래완료</button>
                <button onclick="productPrint()">팝니다</button>
                <button onclick="productPrint()">삽니다</button>
                <form method="post">
                    <input type="hidden" value="${sessionScope.no}" id="user_no" name="user_no">
                </form>
                <table class="type04">
                    <thead>
                    <tr>
                        <th class="category">카테고리</th>
                        <th class="title">제목</th>
                        <th class="content">내용</th>
                        <th class="check">진행 확인</th>
                        <th class="type">판매/구매</th>
                        <th class="type">수정/삭제</th>
                    </tr>
                    </thead>
                    <tbody class="userProductTBody">
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
<script src="script/userProductScript.js"></script>
</html>
