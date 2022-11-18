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