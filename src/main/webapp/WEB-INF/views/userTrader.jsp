<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Trader</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/myPageTemplate.css">
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
<jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <input type="hidden" value="${sessionScope.no}" id="no" name="no">
    <table>
        <thead>
            <tr>
                <th>카테고리</th>
                <th>제목</th>
                <th>내용</th>
                <th>진행 확인</th>
                <th>판매/구매</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script>

    let no = document.getElementById('no').value;

    var settings = {
        "url": "/myPage/productUser",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": no
        }),
    };

    $.ajax(settings).done(function (response) {
        let tableBody ='';
        const list = response;
        list.forEach(e => {
            let category = e.category;
            let title = e.p_title;
            let content = e.p_content;
            let check = e.p_check;
            let type = e.p_type;

            tableBody += '<tr>'
            tableBody += '<td>' + category + '</td>'
            tableBody += '<td>' + title + '</td>'
            tableBody += '<td>' + content + '</td>'
            tableBody += '<td>' + check + '</td>'
            tableBody += '<td>' + type + '</td>'
            tableBody += '</tr>'
        })

        console.log(response);
    });

</script>
</html>
