<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/board.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form class="write">
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티</strong>
            <p>회원님의 진심을 알고 싶습니다.</p>
        </div>
        <div class="board_write_wrap">
            <c:set var="board" value="${response}"/>
            <input type="hidden" value="${board.b_no}" class="boardNo" id="b_no" name="b_no">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  id="b_title" placeholder="제목을 입력해주세요." value="${board.b_title}" name="b_title" required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>닉네임</dt>
                        <dd><input type="text" id="nickname" name="nickname" value="${sessionScope.nickname}" readonly></dd>
                    </dl>

                </div>
                <div class="cont">
                    <input type="text" placeholder="내용을 입력해주세요." value="${board.b_content}" id="b_content" class="text" name="b_content" required>
                    <input type="hidden" name="user_no" value="${board.user_no}">
                </div>
            </div>
            <div class="bt_wrap">
                <c:if test="${board.user_no == sessionScope.no}">
                    <input type="button" value="글목록" onclick="location.href='/boardView'">
                    <input type="button" value="글수정" onclick="boardUpdate()">
                </c:if>
            </div>
        </div>
    </div>
</form>
<script src="/script/boardUpdate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
