<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 1:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/myPageTemplate.css">
    <link rel="stylesheet" href="/css/myPageTable.css">
    <link rel="stylesheet" href="/css/join.css">
    <title>Trader myPage</title>
</head>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
    <jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <div class="wrap" id="wrap">
        <form method="post">
            <input type="hidden" id="no" autocomplete="off" value="${sessionScope.no}">
            <input type="text" id="id" name="id" autocomplete="off" value="${sessionScope.id}" placeholder="id" readonly>
            <input type="text" id="password" name="password" autocomplete="off" placeholder="pw">
            <input type="text" id="email" name="email" autocomplete="off" value="${sessionScope.email}" placeholder="email" readonly>
            <input type="text" id="phone" name="phone" autocomplete="off" value="${sessionScope.phone}" onfocus="this.value=''" onblur="phoneNullCheck('${sessionScope.phone}')" placeholder="phone">
            <input type="text" id="address" name="address" autocomplete="off" value="${sessionScope.address}" onfocus="this.value=''" onblur="addressNullCheck('${sessionScope.address}')" placeholder="address">
            <input type="text" id="nickname" name="nickname" autocomplete="off" value="${sessionScope.nickname}" onfocus="this.value=''" onblur="nicknameNullCheck('${sessionScope.nickname}')" placeholder="nickname">
            <input type="button" value="정보수정" onclick="update()">
        </form>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="script/myPage.js"></script>
<script src="script/userUpdateScript.js"></script>
</html>
