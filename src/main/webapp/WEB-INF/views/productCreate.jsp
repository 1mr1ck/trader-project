<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-15
  Time: 오후 6:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글작성</title>
</head>
<body>
    <h1>게시글작성</h1>
    <form>
        <div>
            <input type="text" id="user_no" name="user_no" placeholder="user_no" required>
        </div>
        <div>
            <input type="text" id="p_title" name="p_title" placeholder="p_title" required>
        </div>
        <div>
            <input type="text" id="p_content" name="p_content" placeholder="p_content" required>
        </div>
        <div>
            <select id="category" name="category" required>
                <option value="카테고리1">카테고리1</option>
                <option value="카테고리2">카테고리2</option>
                <option value="카테고리3">카테고리3</option>
                <option value="카테고리4">카테고리4</option>
                <option value="카테고리5">카테고리5</option>
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
</html>