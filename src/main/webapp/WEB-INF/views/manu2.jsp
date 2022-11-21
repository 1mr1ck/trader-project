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
      display: none;
    }
    .photo{
      width: 100%;
      height: 600px;
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
    .home-main__item .item-box {
      position: relative;
      gap: 20px;
      max-width: 1024px;
      height: 100%;
      margin: 0 auto;
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;
    }

    .home-main__item .item-box__text {
      padding: 30px 0;
    }

    .home-main__item .item-box__button button {
      margin-right: 10px;
      padding: 15px 20px;
      background-color: #ecedee;
      border-radius: 4px;
    }

    .home-main__item .item-box__button button:hover {
      background-color: #e2e5e7;
    }

    @media all and (max-width: 992px) {
      .home-main__item .item-box__button {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
      }
      .home-main__item .item-box__button button {
        width: 200px;
        margin: 5px;
      }
    }

    .home-main__item .item-box__img img {
      max-width: 532px;
      max-height: 80%;
    }

    @media all and (max-width: 992px) {
      .home-main__item .item-box__img img {
        max-width: 80%;
      }
    }

    .home-main__item .item-box__list {
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;
    }

    .home-main__item .item-box__list p {
      font-size: 0.8rem;
    }

    @media all and (max-width: 992px) {
      .home-main__item .item-box__list {
        display: none;
      }
    }

    .home-main__item .item-box__item {
      padding: 30px 10px;
    }

    .home-main__item .item-box__item h3 {
      padding-top: 5px;
    }

    @media all and (max-width: 992px) {
      .home-main__item .item-box {
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        justify-items: center;
        height: -webkit-fit-content;
        height: -moz-fit-content;
        height: fit-content;
        text-align: center;
      }
    }

    @media all and (max-width: 992px) {
      .home-main__item .item-box__container {
        -webkit-box-ordinal-group: 0;
        -ms-flex-order: -1;
        order: -1;
      }
    }

    .home-main__item .top--img {
      -ms-flex-item-align: end;
      align-self: flex-end;
    }

    .home-main__item .top--img .desktop {
      width: 100%;
      position: absolute;
      right: -5%;
      bottom: 0;
      max-width: 800px;
    }

    .home-main__item .top--img .mobile {
      display: none;
    }

    @media all and (max-width: 992px) {
      .home-main__item .top--img {
        -ms-flex-item-align: center;
        -ms-grid-row-align: center;
        align-self: center;
      }
      .home-main__item .top--img .desktop {
        display: none;
      }
      .home-main__item .top--img .mobile {
        display: block;
        max-width: 100%;
      }
    }

    @media all and (max-width: 992px) {
      .home-main__item {
        height: -webkit-fit-content;
        height: -moz-fit-content;
        height: fit-content;
        padding-top: 50px;
      }
    }
  </style>
</head>
<body>
  <div class="tab_content">
    <input type="radio" name="tabmenu" id="tab01" checked>
    <input type="radio" name="tabmenu" id="tab02">
    <input type="radio" name="tabmenu" id="tab03">

    <div class="conbox con1">
      <div class="home-main__item background-beige">
        <div class="item-box top--box">
          <article class="item-box__text">
            <h1>공손하게 <br/>주거니받거니 <br/>공주마켓</h1>
            <p>중고 거래부터 동네 정보까지, 이웃과 함께해요.</p>
            <p>가깝고 따뜻한 당신의 근처를 만들어요.</p>
          </article>
          <div class="item-box__img top--img">
            <img
                    src="css/phono-image-1.png"
                    alt="phone-image-1"
                    class="desktop"
            />
            <img
                    src="css/phono-image-1.png"
                    alt="phone-image-1"
                    class="mobile"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="conbox con2">
    </div>
    <div class="conbox con3">
    </div>

    <div class="btn">
      <label for="tab01"></label>
      <label for="tab02"></label>
      <label for="tab03"></label>
    </div>
  </div>
</body>
</html>
