<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-16
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>게시판상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<button onclick="location.href='/'" style="cursor: pointer">home</button>
<table>
    <thead>
    <tr>
        <th>제목</th>
        <th>내용</th>
        <th>유저번호</th>
        <th>작성자</th>
<%--        <th>작성날짜</th>--%>
<%--        <th>수정날짜</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:set var="board" value="${response}"/>
    <input type="hidden" value="${board.b_no}" class="boardNo" id="b_no" name="b_no">
    <tr>
        <td><input type="text"  id="b_title" value="${board.b_title}" placeholder="제목을 입력해주세요." name="b_title" required></td>
        <td><input type="text"  id="b_content" value="${board.b_content}" placeholder="내용을 입력해주세요." name="b_content" required></td>
        <td><input type="text"  id="user_no" value="${board.user_no}" name="user_no" required></td>
        <td><input type="text"  id="nickname" value="${sessionScope.nickname}" name="nickname" required></td>
<%--        <c:set var="regDate" value="${(String.valueOf(board.regDate)).substring(0, 10)}"/>--%>
<%--        <td>${regDate}</td>--%>
<%--        <c:set var="modDate" value="${(String.valueOf(board.modDate)).substring(0, 10)}"/>--%>
<%--        <td>${modDate}</td>--%>
    </tr>
    </tbody>
</table>
<c:if test="${board.user_no == sessionScope.no}">
    <input type="button" value="글목록" onclick="location.href='/boardView'">
    <input type="button" value="submit" onclick="boardUpdate()">
</c:if>
<script src="/script/boardUpdate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
