<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-21
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이미지 넘김</title>
  <style>
    input[type="radio"]{
      display: none;
    }
    .conbox {
      width: 100%;
      height: 600px;
      background: #ffc9f6;
      display: none;
    }
    img{
      width: 200px;
      height: 300px;
      margin-left: 400px;
    }
    .btn{
      padding: 10px;
      text-align: center;
    }
    label[for*="tab"]{
      display: inline-block;
      padding: 10px;
      background: #ccc;
      cursor: pointer;
      margin: 5px;
      border-radius: 100%;
    }
    input[id="tab01"]:checked ~.con1{
      display: block;
    }
    input[id="tab02"]:checked ~.con2{
      display: block;
    }
    input[id="tab03"]:checked ~.con3{
      display: block;
    }
    input[id="tab01"]:checked~.btn > label[for="tab01"]{
      background: yellow;
    }
    input[id="tab02"]:checked~.btn > label[for="tab02"]{
      background: blue;
    }
    input[id="tab03"]:checked~.btn > label[for="tab03"]{
      background: red;
    }
  </style>
</head>
<body>
  <div class="tab_content">
    <input type="radio" name="tabmenu" id="tab01" checked>
    <input type="radio" name="tabmenu" id="tab02">
    <input type="radio" name="tabmenu" id="tab03">

    <div class="conbox con1">

    </div>
    <div class="conbox con2">
      <h3>당신의 근처</h3>
      <img src="/css/3333.png">
    </div>
    <div class="conbox con3">
      <h3>여기는 어디?</h3>
    </div>

    <div class="btn">
      <label for="tab01"></label>
      <label for="tab02"></label>
      <label for="tab03"></label>
    </div>
  </div>
</body>
</html>
