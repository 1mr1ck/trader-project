<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <title>공주마켓</title>
    <link rel="stylesheet" href="/css/productSearch.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body onload="productSearch()">
<div class="wrap">
    <div class="out">
        <div class="in">
            <h1>상품목록</h1>
            <div>
                <form>
                    <select id="category" name="category" required>
                        <option value="전체">전체</option>
                        <option value="전자기기">전자기기</option>
                        <option value="가구,인테리어">가구,인테리어</option>
                        <option value="유아동">유아동</option>
                        <option value="의류">의류</option>
                        <option value="스포츠">스포츠</option>
                        <option value="취미,게임,음반">취미,게임,음반</option>
                        <option value="도서">도서</option>
                        <option value="중고차">중고차</option>
                        <option value="티켓,교환권">티켓,교환권</option>
                        <option value="식품">식품</option>
                        <option value="반려동물용품">반려동물용품</option>
                        <option value="식물">식물</option>
                        <option value="기타 중고물품">기타 중고물품</option>
                    </select>
                    <select id="p_type" name="p_type" required>
                        <option value="전체">전체</option>
                        <option value="팝니다">팝니다</option>
                        <option value="삽니다">삽니다</option>
                    </select>
                    <input type="text" id="keyword" name="keyword" placeholder="전체">
                    <input type="button" onclick="productSearch()" value="검색" style="cursor: pointer">
                </form>
            </div>
            <hr>
            <div>
                <table class="type04">
                    <thead class="title">
                    </thead>
                    <tbody class="container">
                    </tbody>
                </table>
            </div>
            <div class="page_btn_box">

            </div>
        </div>
    </div>
</div>


<script src="script/productSearch.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
