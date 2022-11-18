<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-17
  Time: 오후 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<form c:action="@{/v1/update/board?b_no=${board.b_no}}" method="post">
  <input type="hidden" name="_method" value="put"/>
  <input type="hidden" name="user_no" th:value="${board.user_no}"/>

  제목 : <input type="text" name="b_title"c:value="${board.b_title}"> <br>
<%--  작성자 : <input type="text" name="writer" c:value="${boardDto.writer}"> <br>--%>
  <textarea name="b_content" c:text="${board.b_content}"></textarea><br>

  <input type="submit" value="수정">
</form>
</body>
</html>
