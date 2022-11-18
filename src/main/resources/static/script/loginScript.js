$(document).ready(function(){

    // Click event of the showPassword button
    $('#password_check_btn').on('click', function(){

        // Get the password field
        var passwordField = $('#password');

        // Get the current type of the password field will be password or text
        var passwordFieldType = passwordField.attr('type');

        // Check to see if the type is a password field
        if(passwordFieldType == 'password')
        {
            // Change the password field to text
            passwordField.attr('type', 'text');

            // Change the Text on the show password button to Hide
            $(this).val('비밀번호 숨기기');
        } else {
            // If the password field type is not a password field then set it to password
            passwordField.attr('type', 'password');

            // Change the value of the show password button to Show
            $(this).val('비밀번호 보기');
        }
    });
});

const naverLogin = new naver.LoginWithNaverId(
    {
        clientId: "_eG3Srmo1S4KO2pKeddu",
        callbackUrl: "http://localhost:8080/",
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
        location.replace("http://localhost:8080/");
    })
}