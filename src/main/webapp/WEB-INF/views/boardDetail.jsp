<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-17
  Time: 오전 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<br>
   <h3>${list.b_title}</h3>
<div>${list.b_content}</div>
<div>
   <span id="id"><i>${board.b_no}</i></span>
   <span><i>${board.user_no}</i></span>
</div>
   <br>
   <button onclick="history.back()">돌아가기</button>
   <button id="btn-update">수정</button>
   <button id="btn-delete">삭제</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="script/boardDetail.js"></script>
</body>
</html>
