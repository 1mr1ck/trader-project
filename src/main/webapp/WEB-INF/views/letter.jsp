<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-17
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>쪽지함</title>
</head>
<body>
    <h1>쪽지함</h1>
    <table>
        <thead>
        <tr>
            <th>작성자</th>
            <th>메시지</th>
            <th>작성시간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${myLetterList}" var="letter">
            <tr>
                <td>${letter.user_nickname}</td>
                <td>${letter.l_content}</td>
                <c:set var="regDate" value="${(String.valueOf(letter.regDate)).substring(12, 16)}"/>
                <td>${regDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
