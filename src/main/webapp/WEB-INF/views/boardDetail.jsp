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
</head>

<%
    HttpSession sessionCheck = request.getSession();
    String id = (String)sessionCheck.getAttribute("log");

%>
<body>
<button onclick="location.href='/'" style="cursor: pointer">home</button>
<table>
    <thead>
    <tr>
        <th>제목</th>
        <th>내용</th>
        <th>유저번호</th>
        <th>작성자</th>
        <th>작성날짜</th>
        <th>수정날짜</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="board" value="${response}"/>
    <input type="hidden" value="${board.b_no}" class="boardNo" id="boardNo" name="boardNo">
    <tr>
        <td>${board.b_title}</td>
        <td>${board.b_content}</td>
        <td>${board.user_no}</td>
        <td>${sessionScope.nickname}</td>
        <c:set var="regDate" value="${(String.valueOf(board.regDate)).substring(0, 10)}"/>
        <td>${regDate}</td>
        <c:set var="modDate" value="${(String.valueOf(board.modDate)).substring(0, 10)}"/>
        <td>${modDate}</td>
    </tr>
    </tbody>
</table>
<input type="button" value="글목록" onclick="location.href='/boardView'">
<input type="button" value="글수정" onclick="location.href='/boardUpdate'">
<input type="button" value="글삭제" onclick="location.href='/boardDelete'">
</body>
</html>
