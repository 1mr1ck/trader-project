<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <link rel="daangn icon" href="css/assets/web/logo.ico" />
  <link rel="stylesheet" href="css/style/css/style.css" />
  <title>당신 근처의 당근마켓</title>
</head>
<body>
<header>
  <div class="header__inner">
    <img src="/css/assets/web/logo-basic.svg" alt="daangn-logo" />
    <div class="search">
      <input
              type="text"
              name="header-search-input"
              class="search__input"
              placeholder="동네 이름, 물품명 등을 검색해보세요!"
      />
      <button class="search__button">
        <img src="/css/assets/web/search-icon.svg" alt="daangn-search" />
      </button>
    </div>
    <div class="buttons">
      <div class="buttons-download">
        <input
                type="checkbox"
                class="buttons-download__button"
                id="toggle"
        />
        <ul class="download-list">
          <li class="download-list__item">
            <img
                    src="/css/assets/web/apple-store.svg"
                    alt="apple-store"
                    class="download-list__img"
            />
            <span class="download-list__text bold-text">App store</span>
          </li>
          <li class="download-list__item">
            <img
                    src="/css/assets/web/google-play.svg"
                    alt="google-play"
                    class="download-list__img"
            />
            <span class="download-list__text bold-text">Google-play</span>
          </li>
        </ul>
        <label for="toggle" class="bold-text">
          다운로드 <span class="toggle-yes">﹀</span>
          <span class="toggle-no">︿</span>
        </label>
      </div>
      <div class="buttons-chat">
        <button class="buttons-chat__button">
          당근채팅<span class="buttons-chat__text--beta">Beta</span>
        </button>
      </div>
    </div>
    <div class="tablet-buttons">
      <img
              src="/css/assets/web/search-icon-orange.svg"
              alt="daangn-search-orange"
      />
    </div>
  </div>
</header>
<section class="home-main">
  <div class="home-main__item background-beige">
    <div class="item-box top--box">
      <article class="item-box__text">
        <h1>당신 근처의 <br />당근마켓</h1>
        <p>중고 거래부터 동네 정보까지, 이웃과 함께해요.</p>
        <p>가깝고 따뜻한 당신의 근처를 만들어요.</p>
      </article>
      <div class="item-box__img top--img">
        <img
                src="/css/assets/web/phono-image-1.png"
                alt="phone-image-1"
                class="desktop"
        />
        <img
                src="/css/assets/mobile/phone_image_1.png"
                alt="phone-image-1"
                class="mobile"
        />
      </div>
    </div>
  </div>
  <div class="home-main__item">
    <div class="item-box">
      <div class="item-box__img">
        <img src="/css/assets/web/phono-image-2.png" alt="phono-image-2" />
      </div>
      <div class="item-box__container">
        <article class="item-box__text">
          <h2>우리 동네<br />중고 직거래 마켓</h2>
          <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>
        </article>
        <div class="item-box__button">
          <button>인기매물 보기</button>
          <button>믿을 수 있는 중고거래</button>
        </div>
      </div>
    </div>
  </div>
  <div class="home-main__item background-green">
    <div class="item-box">
      <div>
        <article class="item-box__text">
          <h2>이웃과 함께 하는<br />동네 생활</h2>
          <p>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>
        </article>
        <div class="item-box__list">
          <div class="item-box__item">
            <img
                    src="/css/assets/web/icon-story-1.svg"
                    alt="icon-story-1"
            />
            <h3>우리동네질문</h3>
            <p>궁금한 게 있을 땐 이웃<br />에게 물어보세요.</p>
          </div>
          <div class="item-box__item">
            <img
                    src="/css/assets/web/icon-story-2.svg"
                    alt="icon-story-2"
            />
            <h3>동네분실센터</h3>
            <p>무언가를 잃어버렸을 때,<br />함께 찾을 수 있어요.</p>
          </div>
          <div class="item-box__item">
            <img
                    src="/css/assets/web/icon-story-3.svg"
                    alt="icon-story-3"
            />
            <h3>우리동네질문</h3>
            <p>관심사가 비슷한 이웃과<br />온오프라인으로 만나요.</p>
          </div>
        </div>
      </div>
      <div class="item-box__img">
        <img src="/css/assets/web/phono-image-3.png" alt="phono-image-3" />
      </div>
    </div>
  </div>
</section>
</body>
</html>