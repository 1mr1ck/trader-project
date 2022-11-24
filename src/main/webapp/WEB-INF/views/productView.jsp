<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>공주마켓</title>
    <link rel="stylesheet" href="/css/productView.css">
</head>
<jsp:include page="header.jsp"></jsp:include>
<body onload="wishOnload()">
<div class="wrap">
    <div class="out">
        <div class="in">
            <form class="write">
                <div class="board_wrap">
                    <c:set var="product" value="${response}"/>
                    <input type="hidden" value="${product.p_title}" class="boardNo" id="p_title" name="boardNo">
                    <div class="board_write_wrap">
                        <div class="board_write">
                            <div class="title">
                                <dl>
                                    <dt>제목</dt>
                                    <dd><input type="text" value="${product.p_title}" id="title" name="title" readonly></dd>
                                    <c:if test="${sessionScope.id != null}">
                                        <button onclick="window.open('/letterWrite/${product.p_no}/${sessionScope.no}/${product.user_no}', '쪽지쓰기', 'width=500, height=500');">
                                            쪽지쓰기</button>
                                    </c:if>
                                </dl>
                            </div>
                            <div class="info">
                                <dl>
                                    <dt>닉네임</dt>
                                    <dd><input type="text" id="id" value="${product.nickname}" readonly></dd>
                                </dl>
                                <dl>
                                    <dt>작성/수정일자</dt>
                                    <c:set var="modDate" value="${(String.valueOf(product.modDate)).substring(0, 10)}"/>
                                    <dd><input type="text" id="mod_date" style="border: none; outline :none" value="${modDate}"></dd>
                                </dl>
                            </div>
                            <div class="info2">
                                <dl>
                                    <dt>카테고리</dt>
                                    <dd><input type="text" readonly value="${product.category}"></dd>
                                </dl>
                                <dl>
                                    <dt>판매/구매</dt>
                                    <dd><input type="text" readonly value="${product.p_type}"></dd>
                                </dl>
                                <dl>
                                    <dt>가격</dt>
                                    <dd><input type="text" readonly value="${product.price}"></dd>
                                </dl>
                            </div>
                            <div class="cont">
                                <div class="p_img">
                                    <img src="${product.img_url}"style="width: 400px; height: 400px;">
                                </div>
                                <div>
                                    <textarea class="p_content" readonly>${product.p_content}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- 댓글 -->
            <!-- 댓글 등록 div -->
            <div class="comment-create-box">
                <input type="hidden" value="${product.p_no}" id="p_no">
                <input type="hidden" value="${sessionScope.no}" id="no">
                <input type="hidden" value="${sessionScope.nickname}" id="nickname">
                <textarea id="createCmtContent" class="createCmtContent" placeholder="댓글 내용을 입력하세요."></textarea>
            </div>
            <div class="commentTotalBtn">
                <div class="wishBtn">
                    <div class="wish-box" id="wish-box">

                    </div>
                </div>
                <div class="commentBtn">
                    <button type="cmt-btn" onclick="saveComment(${product.p_no})" style="cursor: pointer">등록</button>
                </div>
            </div>

            <!-- 댓글 목록 -->
            <table class="commentListTable">
                <tbody class="cmt-list">
                <c:forEach items="${comments}" var="comment">
                    <input type="hidden" value="${comment.user_no}" id="comment-user_no">
                    <input type="hidden" value="${comment.pc_no}" id="pc_no">
                    <tr>
                        <td class="cmt_nickname">${comment.user_nickname}</td>
                        <c:if test="${comment.modDate == null}">
                            <td class="cmt_date">${(String.valueOf(comment.regDate)).substring(0, 10)}</td>
                        </c:if>
                        <c:if test="${comment.modDate != null}">
                            <td class="cmt_date">${(String.valueOf(comment.modDate)).substring(0, 10)}</td>
                        </c:if>
                    </tr>
                    <tr class="content-box">
                        <td class="cmt_content">${comment.pc_content}</td>
                        <td class="cmtUpdateDeleteBtn">
                        <c:if test="${comment.user_no == sessionScope.no}">
                                <button onclick="updateComment(${product.p_no}, ${comment.pc_no})">수정</button>
                                <button onclick="deleteComment(${product.p_no}, ${comment.pc_no})">삭제</button>
                        </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        </div>
    </div>
</div>
<script src="/script/p_comment.js"></script>
<script src="/script/wish.js"></script>
<script src="/script/productUpdateP_check.js"></script>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>
