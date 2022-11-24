<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>게시판 작성</title>
    <link rel="stylesheet" href="/css/boardWrite.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form class="write">
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티</strong>
            <p>회원님의 아름다움을 표현해주세요.</p>
        </div>
        <div class="board_write_wrap" >
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  id="b_title" placeholder="제목을 입력해주세요." name="b_title" required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <input type="text" id="nickname" name="nickname" value="${sessionScope.nickname}" readonly>
                        <input type="hidden" id="user_no" name="user_no" value="${sessionScope.no}" readonly>
                    </dl>

                </div>
                <div class="cont">
                    <input type="text" id="b_content" placeholder="내용을 입력해주세요." class="text" name="b_content" required>
                </div>
            </div>
            <div class="bt_wrap">
                <c:if test="${sessionScope.no == 1}">
                    <select id="notice" name="notice" required>
                        <option value="공지">공지 작성</option>
                        <option value="그냥 글쓰기">일반 게시글</option>
                    </select>
                </c:if>
                <c:if test="${sessionScope.no != 1}">
                    <select hidden id="notice" name="notice" required>
                        <option value="그냥 글쓰기">그냥 글쓰기</option>
                    </select>
                </c:if>
                <input type="button" id="create" value="글쓰기">
            </div>
        </div>
    </div>
</form>
<script src="script/createBoard.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
