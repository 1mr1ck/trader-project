<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-16
  Time: 오전 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품목록</title>
</head>
<body>
    <h1>상품목록</h1>
    <div>
        <form>
            <select id="category" name="category" required>
                <option value="전체">전체</option>
                <option value="카테고리1">카테고리1</option>
                <option value="카테고리2">카테고리2</option>
                <option value="카테고리3">카테고리3</option>
                <option value="카테고리4">카테고리4</option>
                <option value="카테고리5">카테고리5</option>
            </select>
            <select id="p_type" name="p_type" required>
                <option value="전체">전체</option>
                <option value="팝니다">팝니다</option>
                <option value="삽니다">삽니다</option>
            </select>
            <input type="button" onclick="productSearch()" value="검색" style="cursor: pointer">
            <input type="button" onclick="location.href='/'" value="home" style="cursor: pointer">
        </form>
    </div>
    <hr>
    <div>
        <table>
            <thead class="title">
            </thead>
            <tbody class="container">
            </tbody>
        </table>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="script/productSearch.js"></script>
</body>
</html>
