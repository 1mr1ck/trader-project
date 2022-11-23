function nicknameNullCheck(nameCheck){
    name1 = document.getElementById('nickname').value;

    if(name1 === ''){
        document.getElementById('nickname').value = nameCheck;
    }
}

function phoneNullCheck(phoneCheck){
    phone1 = document.getElementById('phone').value;

    if(phone1 === ''){
        document.getElementById('phone').value = phoneCheck;
    }
}

function addressNullCheck(addressCheck){
    address1 = document.getElementById('address').value;

    if(address1 === ''){
        document.getElementById('address').value = addressCheck;
    }
}

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

$(document).ready(function(){

    // Click event of the showPassword button
    $('#password_check_btn').on('click', function(){
        console.log('비밀번호 확인1');
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
        console.log('비밀번호 확인2');
        // Get the password field
        var passwordField = $('#password2');

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
    $('#password_check_btn3').on('click', function(){
        console.log('비밀번호 확인3');
        // Get the password field
        var passwordField = $('#password3');

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

function update(){

    let no = document.getElementById("no").value;
    let id = document.getElementById("id").value;
    let passwordChange = document.getElementById("password").value;
    let passwordExisting = document.getElementById("passwordCheckExisting").value
    let email = document.getElementById("email").value;
    let phone = document.getElementById("phone").value;
    let address = document.getElementById("address").value;
    let nickname = document.getElementById("nickname").value;
    let password = '';

    if(passwordChange === ''){
        password = passwordExisting;
    } else {
        password = passwordChange;
    }


    var settings = {
        "url": "userUpdate/UpdateProc",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "no": no,
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
        alert('회원정보 수정 완료');
        window.location.reload();
    });
}

$(function() {

    var email_auth_cd = '';

    $('#join').click(function(){

        if($('#password3').val() == ""){
            alert("기존 비밀번호를 입력해주세요.");
            return false;
        }

        if($('#passwordCheckExisting').val() !== $('#password3').val()){
            alert("기존 비밀번호를 확인해주세요.")
            return false;
        }

        if($('#nicknameCheckExisting').val() !== $('#nickname').val()){
            if($('#nickname').val() == ""){
                alert("닉네임을 입력해주세요.");
                return false;
            }

            if($('#nicknameCheck').val() == "Y"){
                return false;
            }
        }
        if($('#password').val() !== ''){
            if($('#password').val() != $('#password2').val()){
                alert("변경할 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }
        }

        update();
    });

        $('#nickname').focusout(function () {
            var nickname = $('#nickname').val();

            $.ajax({
                type: "POST",
                url: "/nicknameCheck",
                data: {nickname: nickname},
                success: function (data) {
                    if($('#nicknameCheckExisting').val() !== $('#nickname').val()) {
                        if (data == "Y") {
                            $('#nickname_ck').removeClass("dpn");
                            document.getElementById('nicknameCheck').value = "Y"
                        } else {
                            $('#nickname_ck').addClass("dpn");
                            document.getElementById('nicknameCheck').value = "N"
                        }
                    } else {
                        $('#nickname_ck').addClass("dpn");
                        document.getElementById('nicknameCheck').value = "N"
                    }

                },
                error: function (data) {
                }
            });
        });

});