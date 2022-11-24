<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-15
  Time: 오후 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품수정</title>
    <link rel="stylesheet" href="/css/productCreate.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<c:set var="product" value="${response}"/>
<form class="create">
    <div class="product_wrap">
        <div class="product_title">
            <strong>상품수정</strong>
        </div>
        <div class="product_write_wrap" >
            <div class="product_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  id="p_title" placeholder="제목을 입력해주세요."  value="${product.p_title}" name="p_title" required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <input type="text" id="nickname" name="nickname" value="${sessionScope.nickname}" readonly>
                    </dl>
                </div>
                <div class="title">
                    <dl>
                        <dt>가격</dt>
                        <dd><input type="text"  id="price" placeholder="가격을 입력해주세요." name="price" value="${product.price}" required></dd>
                    </dl>
                </div>
                <div class="title">
                    <dl>
                        <dt>이미지등록</dt>
                        <dd><input type="text" id="img_url" name="img_url" value="${product.img_url}" required></dd>
                        <input type="hidden" id="p_no" name="p_no" value="${product.p_no}">
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>거래상태</dt>
                        <dd><input type="hidden" value="${product.p_type}" readonly>
                            <select id="p_type" name="p_type" required>
                                <option value="팝니다">팝니다</option>
                                <option value="삽니다">삽니다</option>
                            </select> <c:if test="${!product.p_check.equals('거래완')}">
                                <input type="text" value="${product.p_check}인 상품입니다." readonly>
                            </c:if>
                        </dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>카테고리</dt>
                        <dd><select id="category" name="category" required>
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
                        </select></dd>
                    </dl>
                </div>
                <input type="hidden" id="other_no" name="other_no" value="1">
                <input type="hidden" id="p_check" name="p_check" value="진행중">

                <div class="cont">
                    <input type="text" id="p_content" placeholder="내용을 입력해주세요." value="${product.p_content}" class="text" name="p_content" required>
                </div>
            </div>
            <div class="bt_wrap">
                <input class="buttons" type="button" onclick="productUpdate()" value="수정" >
            </div>
        </div>
    </div>
</form>
<script src="/script/productUpdate.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
