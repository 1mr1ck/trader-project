<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>공주마켓</title>
    <link rel="stylesheet" href="/css/boardView.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="wrap">
    <div class="out">
        <div class="in">
            <h1>커뮤니티</h1>
            <form action="/board/search" method="GET">
                <div class="boardBtn">
                    <div class="writeBtn">
                        <c:if test="${sessionScope.id != null}">
                            <input type="button" value="글쓰기" onclick="location.href='/boardCreate'">
                        </c:if>
                    </div>
                </div>
            </form>
            <table class="board-table">
                <thead>
                <tr>
                    <th class="th-num">번호</th>
                    <th class="th-title">글제목</th>
                    <th class="th-nickname">작성자</th>
                    <th class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody class="boardList">
                <c:forEach items="${response}" var="list">
                    <tr>
                        <td>${list.b_no}</td>
                        <td><a href="/boardDetail/${list.b_no}">${list.b_title}</a></td>
                        <td>${list.nickname}</td>
                        <c:set var="regDate" value="${(String.valueOf(list.regDate)).substring(0, 10)}"/>
                        <td>${regDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:set value="${totalPage}" var="totalPage"/>
            <div class="page_btn_box">
                <c:forEach var="i" begin="0" end="${Integer.parseInt(totalPage)-1}">
                    <c:choose>
                        <c:when test="${i == 0}">
                            <button onclick=x_page(${i}) style="background-color: #ffc9f6" class="page_btn">${i+1}</button>
                        </c:when>
                        <c:otherwise>
                            <button onclick=x_page(${i}) style="background-color: #ffffff" class="page_btn">${i+1}</button>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
<script src="script/boardListPage.js"></script>
</html>