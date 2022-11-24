<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/myPageTemplate.css">
    <link rel="stylesheet" href="/css/myPageTable.css">
    <link rel="stylesheet" href="/css/login.css">
    <title>Trader</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
    <jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <div id="wrap">
        <div id="container" class="container">
            <div class="content">
                <div class="join_wrap">
                    <form method="post" id="join_frm">
                        <input type="hidden" id="no" value="${sessionScope.no}">
                        <input type="hidden" id="user_no" value="${sessionScope.no}">
                        <div class="join_title">회원탈퇴</div>
                        <div class="deleteText">회원탈퇴 확인을 위해 비밀번호를 입력해주세요</div>
                        <div class="join_box">
                            <div class="password_check">
                                <input type="hidden" placeholder="비밀번호" value="${sessionScope.password}" id="pwCk"
                                       name="pwCk">
                                <input type="password" placeholder="비밀번호" name="password" id="password"
                                       autocomplete="off">
                                <button type="button" id="password_check_btn" class="password_check_btn">비밀번호 보기
                                </button>
                            </div>
                            <input type="button" id="join" class="join_btn" onclick="userDelete()" value="회원 탈퇴">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="script/myPage.js"></script>
<script src="script/userDeleteScript.js"></script>
</html>
