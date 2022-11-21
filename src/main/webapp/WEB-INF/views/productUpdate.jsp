<%--
  Created by IntelliJ IDEA.
  User: 1mr1ck
  Date: 2022-11-18
  Time: 오후 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품수정</title>
</head>
    <body>
    <h1>상품수정</h1>
    <c:set var="product" value="${response}"/>
    <form>
        <div>
            <input type="text" id="nickname" name="nickname" value="${sessionScope.nickname}" readonly>
        </div>
        <div>
            <input type="text" id="p_title" name="p_title" value="${product.p_title}" required>
        </div>
        <div>
            <input type="text" id="p_content" name="p_content" value="${product.p_content}" required>
        </div>
        <div>
            <input type="text" id="price" name="price" value="${product.price}" required>
        </div>
        <div>
            <select id="category" name="category" required>
                <option value="${product.category}" selected>===${product.category}===</option>
                <option value="전체">전체</option>
                <option value="전자기기">전자기기</option>
                <option value="가구/인테리어">가구/인테리어</option>
                <option value="유아동">유아동</option>
                <option value="의류">의류</option>
                <option value="스포츠">스포츠</option>
                <option value="취미/게임/음반">취미/게임/음반</option>
                <option value="도서">도서</option>
                <option value="중고차">중고차</option>
                <option value="티켓/교환권">티켓/교환권</option>
                <option value="식품">식품</option>
                <option value="반려동물용품">반려동물용품</option>
                <option value="식물">식물</option>
                <option value="기타 중고물품">기타 중고물품</option>
            </select>
        </div>
        <div>
            <input type="text" id="img_url" name="img_url" value="${product.img_url}" required>
        </div>
        <div>
            <input type="text" value="${product.p_type}" readonly>
        </div>
        <div>
            <c:if test="${!product.p_check.equals('거래완')}">
                <input type="text" value="${product.p_check}인 상품입니다." readonly>
            </c:if>
            <c:if test="${product.p_check.equals('거래완')}">
                <input type="text" value="${product.p_check}료된 상품입니다." readonly>
            </c:if>
        </div>
        <input type="hidden" id="p_no" name="p_no" value="${product.p_no}">
        <div>
            <input type="button" onclick="productUpdate()" value="submit" style="cursor: pointer">
            <input type="button" onclick="location.href='/'" value="home" style="cursor: pointer">
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="/script/productUpdate.js"></script>
</body>
</html>
