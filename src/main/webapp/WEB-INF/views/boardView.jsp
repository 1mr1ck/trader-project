<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
  <table class="table table-hover">
    <thead>
    <th>글번호</th>
    <th>작성자</th>
    <th>제목</th>
    </thead>
    <tr th:each="list :${list}"> // 타임리프를 이용해 리스트 형식의 데이터를 가공할 수 있도록 함.
      <td>[[${list.user_no}]]</td>
      <td>[[${list.b_title}]]</td>
      <td>[[${list.b_content}]]</td>
    </tr>
  </table>
</div>
</body>
</html>
