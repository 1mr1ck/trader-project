<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-17
  Time: 오후 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>쪽지쓰기</title>
</head>
<body>
    <c:set var="product" value="${productOfLetter}"/>
    <h1>${product.p_title}에 쪽지쓰기</h1>
    <table>
        <tbody class="letterList">
            <c:forEach items="${myLetterChattingList}" var="letter">
                <tr>
                    <td>${letter.user_nickname}</td>
                    <td>${letter.l_content}</td>
                    <c:set var="regDate" value="${(String.valueOf(letter.regDate)).substring(0, 10)} ${(String.valueOf(letter.regDate)).substring(12, 19)}"/>
                    <td>${regDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form>
        <input type="hidden" value="${product.p_no}" id="p_no" name="p_no">
        <input type="hidden" value="${product.p_title}" id="p_title" name="p_title">
        <input type="hidden" value="${product.user_no}" id="other_no" name="other_no">
        <input type="hidden" value="${product.nickname}" id="other_nickname" name="other_nickname">
        <input type="hidden" value="${sessionScope.no}" id="user_no" name="user_no">
        <input type="hidden" value="${sessionScope.nickname}" id="user_nickname" name="user_nickname">
        <div>
            <input type="text" id="l_content" name="l_content" onkeypress="inputEnter(event)" required autofocus>
        </div>
        <div>
            <input type="button" onclick="letterWrite()" value="submit" id="btnInput" style="cursor: pointer">
            <input type="button" onclick="location.href='/'" value="home" style="cursor: pointer">
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="/script/letterWrite.js"></script>
</body>
</html>
