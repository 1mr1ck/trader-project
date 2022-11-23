<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>쪽지함</title>
    <link rel="stylesheet" href="/css/letter.css">
</head>
<body>
    <h1>쪽지함</h1>
    <table>
        <thead>
        <tr>
            <th>상대방</th>
            <th>상품명</th>
            <th>메시지</th>
            <th>작성시간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${myLetterList}" var="letter">
            <tr>
                <c:if test="${sessionScope.no == letter.user_no}">
                    <td><a href="/letterWrite/${letter.p_no}/${sessionScope.no}/${letter.other_no}">${letter.other_nickname}</a></td>
                </c:if>
                <c:if test="${sessionScope.no != letter.user_no}">
                    <td><a href="/letterWrite/${letter.p_no}/${letter.user_no}/${letter.other_no}">${letter.user_nickname}</a></td>
                </c:if>
                <td>${letter.p_title}</td>
                <td>${letter.l_content}</td>
                <c:set var="regDate" value="${(String.valueOf(letter.regDate)).substring(12, 16)}"/>
                <td>${regDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
