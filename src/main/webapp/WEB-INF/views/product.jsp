<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-16
  Time: 오전 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>상품</title>
</head>
<body>
    <button onclick="location.href='productCreate'" style="cursor: pointer">상품등록</button>
    <button onclick="location.href='productSearch'" style="cursor: pointer">상품목록</button>
    <button onclick="location.href='/'" style="cursor: pointer">home</button>
    <table>
        <thead>
            <tr>
                <th>이미지</th>
                <th>제목</th>
                <th>카테고리</th>
                <th>판매/구매</th>
                <th>작성자</th>
                <th>작성날짜</th>
                <th>수정날짜</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${response}" var="list">
            <tr>
                <td>${list.img_url}</td>
                <td>${list.p_title}</td>
                <td>${list.category}</td>
                <td>${list.p_type}</td>
                <td>${list.nickname}</td>
                <c:set var="regDate" value="${(String.valueOf(list.regDate)).substring(0, 10)}"/>
                <td>${regDate}</td>
                <c:set var="modDate" value="${(String.valueOf(list.modDate)).substring(0, 10)}"/>
                <td>${modDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
