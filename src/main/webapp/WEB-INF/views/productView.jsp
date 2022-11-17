<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-16
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <button onclick="location.href='/'" style="cursor: pointer">home</button>
    <table>
        <thead>
        <tr>
            <th>이미지</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>판매/구매</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>수정날짜</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="product" value="${response}"/>
        <input type="hidden" value="${product.p_no}" class="productNo" id="productNo" name="productNo">
            <tr>
                <td>${product.img_url}</td>
                <td>${product.p_title}</td>
                <td>${product.category}</td>
                <td>${product.p_type}</td>
                <td>${product.user_no}</td>
                <c:set var="regDate" value="${(String.valueOf(product.regDate)).substring(0, 10)}"/>
                <td>${regDate}</td>
                <c:set var="modDate" value="${(String.valueOf(product.modDate)).substring(0, 10)}"/>
                <td>${modDate}</td>
            </tr>
        </tbody>
    </table>
    <!-- 댓글 -->
    <!-- 댓글 등록 div -->
    <div class="comment-create-box">
        <textarea class="commentContent" placeholder="댓글 내용을 입력하세요."></textarea>
        <button class="comment-create-btn">등록</button>
    </div>
    <!-- 댓글 목록 -->
    <table border="1">
        <tbody class="cmt-list">
            <c:forEach items="${comments}" var="comment">
                <input type="hidden" value="${comment.user_no}">
                <input type="hidden" value="${comment.pc_no}">
                <tr>
                    <td class="nickname">${comment.user_nickname}</td>
                    <c:if test="${comment.modDate == null}">
                        <td class="date">${(String.valueOf(comment.regDate)).substring(0, 10)}</td>
                    </c:if>
                    <c:if test="${comment.modDate != null}">
                        <td class="date">${(String.valueOf(comment.modDate)).substring(0, 10)}</td>
                    </c:if>
                </tr>
                <tr class="content-box">
                    <td class="content">${comment.pc_content}</td>
                    <!-- 현재 로그인한 세션값과 comment.user_no 이 같을 때만 출력 어케 해야할까 ? -->
                    <c:if test="${comment.user_no == sessionScope.no}">
                        <td><button>수정</button><button>삭제</button></td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
<script src="script/P_commentList.js"></script>
</body>
</html>
