function join(){
    let id = document.getElementById("id").value;
    let password = document.getElementById("password").value;
    let email = document.getElementById("email").value;
    let phone = document.getElementById("phone").value;
    let address = document.getElementById("address").value;
    let nickname = document.getElementById("nickname").value;

    var settings = {
        "url": "localhost:8080/join/joinUser",
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

    location.href="../../webapp"
}

