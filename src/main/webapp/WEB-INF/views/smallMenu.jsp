<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/25
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공주마켓</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <style>
        .out{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .in{
            width: 80%;
            height: 300px;
        }
        .up{
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 50%;
            width: 100%;
        }
        .down{
            height: 50%;
            width: 100%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .upIn{
            width: 100%;
            display: flex;
            justify-content: space-around;
        }

        .downIn{
            width: 100%;
            display: flex;
            justify-content: space-around;
        }
        input[type=button]{
            text-align: center;
            width: 130px;
            height: 75px;
            border: none;
            font-size: 15px;
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            text-decoration: none;
            font-weight: 600;
            transition: 0.25s;
            background-color: #ffc9f6;;
            color: #fff;
        }
        input[type=button]:hover{
            letter-spacing: 2px;
            transform: scale(1.2);
            cursor: pointer;
        }
    </style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div class="wrap">
    <div class="out">
        <div class="in">
            <div class="up">
                <div class="upIn">
                    <input type="button" value="홈" onclick="location.href='/'">
                    <input type="button" value="중고장터" onclick="location.href='/productSearch'">
                    <input type="button" value="커뮤니티" onclick="location.href='/boardView'">
                    <c:if test="${sessionScope.id != null}">
                        <input type="button" value="중고물품등록" onclick="location.href='/productCreate'">
                    </c:if>
                </div>
            </div>
            <div class="down">
                <div class="downIn">
                    <c:if test="${sessionScope.id == null}">
                        <input type="button" value="로그인" onclick="location.href='/login'">
                        <input type="button" value="회원가입" onclick="location.href='/join'">
                    </c:if>
                    <c:if test="${sessionScope.id != null}">
                        <input type="button" value="쪽지함" onclick="window.open('/myLetter/${sessionScope.no}', '쪽지보내기', 'width=600, height=500, top=300px, left=550px');" style="cursor: pointer">
                        <input type="button" value="마이페이지" onclick="location.href='/myPage'">
                        <input type="button" value="로그아웃" onclick="location.href='/logout'">
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
