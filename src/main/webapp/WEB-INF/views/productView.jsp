<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-16
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
        <td>${product.nickname}</td>
        <c:set var="regDate" value="${(String.valueOf(product.regDate)).substring(0, 10)}"/>
        <td>${regDate}</td>
        <c:set var="modDate" value="${(String.valueOf(product.modDate)).substring(0, 10)}"/>
        <td>${modDate}</td>
    </tr>
    </tbody>
</table>
<form class="wish-box" id="wish-box">

</form>
<!-- 댓글 -->
<!-- 댓글 등록 div -->
<div class="comment-create-box">
    <input type="hidden" value="${product.p_no}" id="p_no">
    <input type="hidden" value="${sessionScope.no}" id="no">
    <input type="hidden" value="${sessionScope.nickname}" id="nickname">
    <textarea id="cmt-content" class="cmt-content" placeholder="댓글 내용을 입력하세요."></textarea>
    <input type="button" onclick="saveComment(${product.p_no})" value="등록" style="cursor: pointer">
</div>
<!-- 댓글 목록 -->
<table border="1">
    <tbody class="cmt-list">
    <c:forEach items="${comments}" var="comment">
        <input type="hidden" value="${comment.user_no}" id="comment-user_no">
        <input type="hidden" value="${comment.pc_no}" id="pc_no">
        <tr>
            <td class="nickname">${comment.user_nickname}</td>
            <c:if test="${comment.modDate == null}">
                <td class="date">${(String.valueOf(comment.regDate)).substring(0, 10)}</td>
            </c:if>
            <c:if test="${comment.modDate != null}">
                <td class="date">${(String.valueOf(comment.modDate)).substring(0, 10)}</td>
            </c:if>
        </tr>
        <tr class="content-box">
            <td class="content">${comment.pc_content}</td>
            <c:if test="${comment.user_no == sessionScope.no}">
                <td>
                    <button onclick="updateComment(${product.p_no}, ${comment.pc_no})">수정</button>
                    <button onclick="deleteComment(${product.p_no}, ${comment.pc_no})">삭제</button>
                </td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div>
    <button onclick="window.open('/letterWrite/${product.p_no}/${sessionScope.no}/${product.user_no}', '쪽지쓰기', 'width=500, height=500');">
        쪽지쓰기
    </button>
</div>
<script src="/script/p_comment.js"></script>
<script src="/script/wish.js"></script>
<script>
    window.onload = wishOnload();
</script>
</body>
</html>
