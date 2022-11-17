<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/15
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"charset="utf-8"></script>
    <title>Trader login</title>
</head>
<body>
    <form method="post" action="login/loginProc">
        <input type="text" name="id" placeholder="id">
        <input type="text" name="password" placeholder="pw">
        <input type="submit" value="로그인">
        <div id="naverIdLogin"></div>
    </form>
</body>
<script>
    const naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "_eG3Srmo1S4KO2pKeddu",
            callbackUrl: "http://127.0.0.1:5500",
            loginButton: {color: "green", type: 2, height: 40}
        }
    );


    naverLogin.init();
    naverLogin.getLoginStatus(function (status) {
        if (status) {
            const nickName=naverLogin.user.getNickName();
            const age=naverLogin.user.getAge();
            const birthday=naverLogin.user.getBirthday();

            if(nickName===null||nickName===undefined ){
                alert("별명이 필요합니다. 정보제공을 동의해주세요.");
                naverLogin.reprompt();
                return ;
            }else{
                setLoginStatus();
            }
        }
    });
    console.log(naverLogin);

    function setLoginStatus(){

        const message_area=document.getElementById('message');
        message_area.innerHTML=`
      <h3> Login 성공 </h3>
      <div>user Nickname : ${naverLogin.user.nickname}</div>
      <div>user Age(범위) : ${naverLogin.user.age}</div>
      <div>user Birthday : ${naverLogin.user.birthday}</div>
      `;

        const button_area=document.getElementById('button_area');
        button_area.innerHTML="<button id='btn_logout'>로그아웃</button>";

        const logout=document.getElementById('btn_logout');
        logout.addEventListener('click',(e)=>{
            naverLogin.logout();
            location.replace("http://127.0.0.1:5500");
        })
    }

</script>
</html>
