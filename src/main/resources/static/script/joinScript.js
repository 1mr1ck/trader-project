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

$(document).ready(function(){

    // Click event of the showPassword button
    $('#password_check_btn2').on('click', function(){

        // Get the password field
        var passwordField = $('#password_ck');

        // Get the current type of the password field will be password or text
        var passwordFieldType = passwordField.attr('type');

        // Check to see if the type is a password field
        if(passwordFieldType == 'password')
        {
            // Change the password field to text
            passwordField.attr('type', 'text');

            // Change the Text on the show password button to Hide
            $(this).val('비밀번호숨기기');
        } else {
            // If the password field type is not a password field then set it to password
            passwordField.attr('type', 'password');

            // Change the value of the show password button to Show
            $(this).val('비밀번호 보기');
        }
    });
});

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

let cellPhone = document.getElementById('phone');
cellPhone.onkeyup = function(event){
    event = event || window.event;
    let _val = this.value.trim();
    this.value = autoHypenPhone(_val);
    console.log(this.value.length);
    console.log(this.value);
}

function fn_join(){
    var f = $('#join_frm');
    var formData = f.serialize();

    let id = document.getElementById("id").value;
    let password = document.getElementById("password").value;
    let email = document.getElementById("email").value;
    let phone = document.getElementById("phone").value;
    let address = document.getElementById("address").value;
    let nickname = document.getElementById("nickname").value;

    var settings = {
        "url": "join/joinUser",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "no": 0,
            "id": id,
            "password": password,
            "email": email,
            "phone": phone,
            "address": address,
            "nickname": nickname
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });

    alert("회원가입이 완료되었습니다.");
    location.href="/"
}

$(function() {

    var email_auth_cd = '';

    $('#join').click(function(){

        if($('#id').val() == ""){
            alert("아이디를 입력해주세요.");
            return false;
        }

        if($('#nickname').val() == ""){
            alert("닉네임을 입력해주세요.");
            return false;
        }

        if($('#password').val() == ""){
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        if($('#password').val() != $('#password_ck').val()){
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        if($('#email_auth_key').val() != email_auth_cd){
            alert("인증번호가 일치하지 않습니다.");
            return false;
        }
        if($('#email_auth_key').val() == ""){
            alert("인증번호를 입력해주세요.");
            return false;
        }
        if($('#idCheck').val() == "Y"){
            return false;
        }
        if($('#nicknameCheck').val() == "Y"){
            return false;
        }
        if($('#emailCheck').val() == "Y") {
            return false;
        }

        fn_join();
    });

    $(".email_auth_btn").click(function(){
        var email = $('#email').val();

        if(email == ''){
            alert("이메일을 입력해주세요.");
            return false;
        }

        var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if(exptext.test(email)==false) {
            //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
            alert("이 메일형식이 올바르지 않습니다.");
            document.getElementById('email').focus();
            document.getElementById('email').value = null;
            return false;
        }

        $.ajax({
            type : "POST",
            url : "/emailAuth",
            data : {email : email},
            success: function(data){
                alert("인증번호가 발송되었습니다.");
                email_auth_cd = data;
            },
            error: function(data){
                alert("메일 발송에 실패했습니다.");
            }
        });
    });
    $('#id').focusout(function(){
        var id = $('#id').val();

        $.ajax({
            type : "POST",
            url : "/idCheck",
            data : {id : id},
            success: function(data){
                console.log(data);
                if(data == "Y"){
                    $('#id_ck').removeClass("dpn");
                    document.getElementById('idCheck').value = 'Y'
                }else{
                    $('#id_ck').addClass("dpn");
                    document.getElementById('idCheck').value = 'N'
                }
            },
            error: function(data){
            }
        });
    });

    $('#nickname').focusout(function(){
        var nickname = $('#nickname').val();

        $.ajax({
            type : "POST",
            url : "/nicknameCheck",
            data : {nickname : nickname},
            success: function(data){
                if(data == "Y"){
                    $('#nickname_ck').removeClass("dpn");
                    document.getElementById('nicknameCheck').value = "Y"
                }else{
                    $('#nickname_ck').addClass("dpn");
                    document.getElementById('nicknameCheck').value = "N"
                }
            },
            error: function(data){
            }
        });
    });

    $('#email').focusout(function(){
        var email = $('#email').val();

        $.ajax({
            type : "POST",
            url : "/emailCheck",
            data : {email : email},
            success: function(data){
                if(data == "Y"){
                    $('#email_ck').removeClass("dpn");
                    document.getElementById('emailCheck').value = "Y";
                }else{
                    $('#email_ck').addClass("dpn");
                    document.getElementById('emailCheck').value = "N";
                }
            },
            error: function(data){
            }
        });
    });

});