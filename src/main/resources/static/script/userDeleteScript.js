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


function userDelete(){
    let no = document.getElementById("no").value;
    let pwCk = document.getElementById("pwCk").value;
    let pw = document.getElementById("password").value;

    if(pwCk === pw){
        var settings = {
            "url": "userDelete/userDeleteProc",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json"
            },
            "data": JSON.stringify({
                "no": no
            }),
        };

        $.ajax(settings).done(function (response) {
            console.log(response);
        });

        location.href="/logout";
    } else{
        alert('비밀번호를 확인해 주세요.')
        return false;
    }
}