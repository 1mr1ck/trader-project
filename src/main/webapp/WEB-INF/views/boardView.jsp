<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>게시판 목록</title>
    <link rel="stylesheet" href="/css/boardView.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="wrap">

    <form action="/board/search" method="GET">
        <div class="search">
            <input name="keyword" type="text" placeholder="검색어를 입력해주세요">
        </div>

        <button>검색하기</button>
    </form>
    <h1>커뮤니티</h1>
    <table class="board-table">
        <thead>
        <tr>
            <th class="th-num">번호</th>
            <th class="th-title">글제목</th>
<%--            <th>글내용</th>--%>
            <th class="th-nickname">작성자</th>
            <th class="th-date">등록일</th>
<%--            <th>수정일</th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${response}" var="list">
            <tr>
                <td>${list.b_no}</td>
                <td><a href="/boardDetail/${list.b_no}">${list.b_title}</a></td>
<%--                <td><a href="/boardDetail/${list.b_no}">${list.b_content}</a></td>--%>
                <td>${list.nickname}</td>
                <c:set var="regDate" value="${(String.valueOf(list.regDate)).substring(0, 10)}"/>
                <td>${regDate}</td>
<%--                <c:set var="modDate" value="${(String.valueOf(list.modDate)).substring(0, 10)}"/>--%>
<%--                <td>${modDate}</td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="button" value="글쓰기" onclick="location.href='/boardCreate'">
    <input type="button" value="home" onclick="location.href='/'">


<%--    <div>--%>
<%--    <span th:each="pageNum : ${pageList}" th:inline="text">--%>
<%--        <a th:href="@{'/?page=' + ${pageNum}}">[[${pageNum}]]</a>--%>
<%--    </span>--%>
<%--    </div>--%>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>