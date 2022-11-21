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
    let password = document.getElementById("password").value;
    let email = document.getElementById("email").value;
    let phone = document.getElementById("phone").value;
    let address = document.getElementById("address").value;
    let nickname = document.getElementById("nickname").value;


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
    });

    location.href="/myPage";
}

$(function() {

    var email_auth_cd = '';

    $('#join').click(function(){

        if($('#password3').val() == ""){
            alert("비밀번호를 입력해주세요.");
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

        if($('#password').val() != $('#password_ck').val()){
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }


        update();
    });

    if($('#nicknameCheckExisting').val() !== $('#nickname').val()){
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
    }


});