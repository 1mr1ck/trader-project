<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"charset="utf-8"></script>
    <link rel="stylesheet" href="/css/login.css">
    <title>Trader login</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="container" class="container">
    <div class="content">
        <div class="join_wrap">
            <form method="post" id="join_frm" action="login/loginProc">
                <div class="join_title">로그인</div>
                <div class="join_box">
                    <input type="text" name="id" autocomplete="off" placeholder="아이디">
                    <div class="password_check">
                        <input type="password" placeholder="비밀번호" name="password" id="password" autocomplete="off">
                        <button type="button" id="password_check_btn" class="password_check_btn">비밀번호 보기</button>
                    </div>
                    <input type="submit" id="join" class="join_btn" value="로그인">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
<script src="script/loginScript.js"></script>
</html>
