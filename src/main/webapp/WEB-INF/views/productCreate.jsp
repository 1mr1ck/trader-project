<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품등록</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
    <h1>상품등록</h1>
    <form>
        <div>
            <input type="text" id="nickname" name="nickname" value="${sessionScope.nickname}" readonly>
        </div>
        <div>
            <input type="text" id="p_title" name="p_title" placeholder="p_title" required>
        </div>
        <div>
            <input type="text" id="p_content" name="p_content" placeholder="p_content" required>
        </div>
        <div>
            <input type="text" id="price" name="price" placeholder="price" required>
        </div>
        <div>
            <select id="category" name="category" required>
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
            <input type="text" id="img_url" name="img_url" placeholder="img_url" required>
        </div>
        <div>
            <select id="p_type" name="p_type" required>
                <option value="팝니다">팝니다</option>
                <option value="삽니다">삽니다</option>
            </select>
        </div>
        <input type="hidden" id="user_no" name="user_no" value="${sessionScope.no}">
        <input type="hidden" id="other_no" name="other_no" value="1">
        <input type="hidden" id="p_check" name="p_check" value="진행중">
        <div>
            <input type="button" onclick="productCreate()" value="submit" style="cursor: pointer">
            <input type="button" onclick="location.href='/'" value="home" style="cursor: pointer">
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="script/productCreate.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>