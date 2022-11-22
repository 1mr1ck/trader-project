<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <title>상품목록</title>
    <style>
        table {
            text-align: center;
            vertical-align: middle;
            border-collapse: separate;
            border-spacing: 1px;
            line-height: 1.5;
            border-top: 1px solid #ccc;
            margin: 20px 10px;
            width: 95%;
        }

        table.type04 th {
            vertical-align: middle;
            padding: 10px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
            background-color: #ffc9f6;
            color: #fff;
        }

        table.type04 td {
            vertical-align: middle;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }

        select {
            margin: 10px;
            width: 120px; /* 원하는 너비설정 */
            padding: .8em .5em; /* 여백으로 높이 설정 */
            font-family: inherit;  /* 폰트 상속 */
            background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */
            border: 1px solid #ffc9f6;
            border-radius: 0px; /* iOS 둥근모서리 제거 */
            -webkit-appearance: none; /* 네이티브 외형 감추기 */
            -moz-appearance: none;
            appearance: none;
        }

        input {
            width: 350px; height: 40px; border: 1px solid #ffc9f6;padding: 17px; border-radius: 5px; margin-top: 20px;
        }

        input[type=button] {
            padding : 0;
            background-color: #ffc9f6;
            border: none;
            color: white;
            border-radius: 5px;
            width: 60px;
            height: 40px;
            font-size: 10pt;
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body onload="productSearch()">
    <h1>상품목록</h1>
    <div>
        <form>
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
            <select id="p_type" name="p_type" required>
                <option value="전체">전체</option>
                <option value="팝니다">팝니다</option>
                <option value="삽니다">삽니다</option>
            </select>
            <input type="text" id="keyword" name="keyword" placeholder="전체">
            <input type="button" onclick="productSearch()" value="검색" style="cursor: pointer">
            <input type="button" onclick="location.href='/'" value="home" style="cursor: pointer">
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
    </div><script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="script/productSearch.js"></script>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
