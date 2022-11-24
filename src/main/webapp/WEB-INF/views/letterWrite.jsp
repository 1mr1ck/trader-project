<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>쪽지쓰기</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/letterWrite.css">
</head>
<body>
<div class="wrap">
    <div class="out">
        <div class="in">
            <c:set var="product" value="${productOfLetter}"/>
            <h1>${product.p_title}에 쪽지쓰기</h1>
            <table class="letter-table">
                <tbody class="letterList">
                <c:forEach items="${myLetterChattingList}" var="letter">
                    <tr>
                        <c:if test="${letter.make}">
                            <td>${letter.user_nickname}</td>
                        </c:if>
                        <c:if test="${!letter.make}">
                            <td>${letter.other_nickname}</td>
                        </c:if>
                        <td>${letter.l_content}</td>
                        <c:set var="regDate" value="${(String.valueOf(letter.regDate)).substring(11, 16)}"/>
                        <td>${regDate}</td>
                    </tr>
                    <c:set var="user_no" value="${letter.user_no}"/>
                    <c:set var="user_nickname" value="${letter.user_nickname}"/>
                </c:forEach>
                </tbody>
            </table>
            <div class="letterBtnTotal">
                <div class="letterDiv">
                    <form>
                        <input type="hidden" value="${sessionScope.no}" id="login_user" name="login_user">
                        <input type="hidden" value="${product.p_no}" id="p_no" name="p_no">
                        <input type="hidden" value="${product.p_title}" id="p_title" name="p_title">
                        <input type="hidden" value="${product.user_no}" id="other_no" name="other_no">
                        <input type="hidden" value="${product.nickname}" id="other_nickname" name="other_nickname">
                        <c:if test="${product.user_no == sessionScope.no}">
                            <input type="hidden" value="${user_no}" id="user_no" name="user_no">
                            <input type="hidden" value="${user_nickname}" id="user_nickname" name="user_nickname">
                        </c:if>
                        <c:if test="${product.user_no != sessionScope.no}">
                            <input type="hidden" value="${sessionScope.no}" id="user_no" name="user_no">
                            <input type="hidden" value="${sessionScope.nickname}" id="user_nickname" name="user_nickname">
                        </c:if>
                        <div class="letterWriteInputDiv">
                            <input class="letterWriteInput" type="text" id="l_content" name="l_content" onkeypress="inputEnter(event)" required autofocus>
                        </div>
                        <div class="letterBtn">
                            <input type="button" onclick="letterWrite()" value="쪽지전송" id="btnInput" style="cursor: pointer">
                            <input type="button" onclick="location.href='/myLetter/${sessionScope.no}'" value="쪽지함" style="cursor: pointer">
                        </div>
                    </form>
                </div>
                <div class="tradingCheck">
                    <form>
                        <c:if test="${product.user_no == sessionScope.no}">
                            <select id="p_check" name="p_check" required>
                                <c:if test="${product.p_check.equals('진행중')}">
                                    <option value="진행중" selected>진행중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="거래완">거래완료</option>
                                </c:if>
                                <c:if test="${product.p_check.equals('예약중')}">
                                    <option value="진행중">진행중</option>
                                    <option value="예약중" selected>예약중</option>
                                    <option value="거래완">거래완료</option>
                                </c:if>
                                <c:if test="${product.p_check.equals('거래완')}">
                                    <option value="진행중">진행중</option>
                                    <option value="예약중">예약중</option>
                                    <option value="거래완" selected>거래완료</option>
                                </c:if>
                            </select>
                            <input type="button" onclick="updateP_check()" value="적용" style="cursor: pointer">
                        </c:if>
                        <c:if test="${product.user_no != sessionScope.no}">
                            <select disabled>
                                <option value="${product.p_check}" selected>${product.p_check}</option>
                            </select>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="/script/letterWrite.js"></script>
    <script src="/script/productUpdateP_check.js"></script>
</body>
</html>
