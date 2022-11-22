<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/board.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form class="write" method="post">
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티</strong>
            <p>회원님의 아름다움을 알고 싶습니다.</p>
        </div>
        <c:set var="board" value="${response}"/>
        <input type="hidden" value="${board.b_no}" class="boardNo" id="boardNo" name="boardNo">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" value="${board.b_title}" id="title" name="title" readonly></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>닉네임</dt>
                        <dd><input type="hidden" value="${board.user_no}" readonly></dd>
                        <dd><input type="text" id="id" value="${board.nickname}" readonly></dd>
                    </dl>
                    <dl>
                        <dt>작성일자</dt>
                        <c:set var="regDate" value="${(String.valueOf(board.regDate)).substring(0, 10)}"/>
                        <dd><input type="text" style="border: none; outline :none" value="${regDate}"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <input type="text" class="text" value="${board.b_content}" id="content" name="content" readonly>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="button" value="글목록" onclick="location.href='/boardView'">
                <c:if test="${board.user_no == sessionScope.no}">
                    <input type="button" value="글수정" onclick="location.href='/boardUpdate/${board.b_no}'">
                    <input type="button" value="글삭제" onclick="location.href='/v1/delete/board?b_no=${board.b_no}'">
                </c:if>
            </div>
        </div>
    </div>
</form>
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
<jsp:include page="footer.jsp"></jsp:include>
</html>
