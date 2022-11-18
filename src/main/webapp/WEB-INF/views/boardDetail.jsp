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
    <title>게시판상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
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
<!-- 댓글 등록 박스 -->
<div class="comment-create-box">
    <input type="hidden" value="${board.b_no}" id="b_no">
    <input type="hidden" value="${sessionScope.no}" id="no">
    <input type="hidden" value="${sessionScope.nickname}" id="nickname">
    <textarea id="cmt-content" class="cmt-content" placeholder="댓글 내용을 입력하세요."></textarea>
    <input type="button" onclick="saveComment(${board.b_no})" value="등록" style="cursor: pointer">
</div>
<!-- 댓글 리스트 -->
<table border="1">
    <tbody class="cmt-list">
    <c:forEach items="${comments}" var="comment">
        <input type="hidden" value="${comment.user_no}" id="comment-user_no">
        <input type="hidden" value="${comment.bc_no}" id="bc_no">
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
            <td class="content">${comment.bc_content}</td>
            <c:if test="${comment.user_no == sessionScope.no}">
                <td>
                    <button onclick="updateComment(${board.b_no}, ${comment.bc_no})">수정</button>
                    <button onclick="deleteComment(${board.b_no}, ${comment.bc_no})">삭제</button>
                </td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="/script/b_comment.js"></script>
</body>
</html>
