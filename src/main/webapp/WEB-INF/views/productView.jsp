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
    <title>Title</title>
</head>
<body>
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
        <c:set var="product" value="${response}"/>
            <tr>
                <td>${product.img_url}</td>
                <td>${product.p_title}</td>
                <td>${product.category}</td>
                <td>${product.p_type}</td>
                <td>${product.user_no}</td>
                <c:set var="regDate" value="${(String.valueOf(product.regDate)).substring(0, 10)}"/>
                <td>${regDate}</td>
                <c:set var="modDate" value="${(String.valueOf(product.modDate)).substring(0, 10)}"/>
                <td>${modDate}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
