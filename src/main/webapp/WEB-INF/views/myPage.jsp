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
    <title>Trader myPage</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
마이페이지
<li><a href="userTrader">거래내역</a></li>
<li><a href="userBoard">게시글목록</a></li>
<li><a href="userComment">댓글목록</a></li>
<li><a href="userUpdate">정보수정</a></li>
<li><a href="userDelete">회원탈퇴</a></li>
<jsp:include page="sidebar.jsp"></jsp:include>

    마이페이지
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
