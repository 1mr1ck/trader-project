const product_no = document.getElementById('p_no').value;
const product_title = document.getElementById('p_title').value;
console.log(product_title);
let log_no = document.getElementById('no').value;
if(log_no === "") {
    log_no = 0;
}
const wish_box = document.getElementById('wish-box');

// 처음에 페이지 이동할 때 onload
function wishOnload() {
    let settings = {
        "url": "/wish/" + product_no + "/" + log_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no" : product_no,
            "user_no": log_no,
        }),
    }

    $.ajax(settings).done(function (result) {
        const wish_img = result;


        var output = "";
        const w_no = wish_img.w_no;

        if(wish_img === "") {
            output += '<button onclick="wishGo(' + product_no + ',' + log_no + ')" style="background-color: transparent;"><img src="/img/Nowish.png" style="width: 50px; height: 50px;"></button>';
        } else {
            output += '<button onclick="wishCancel(' + w_no + ')" style="background-color: transparent;"><img src="/img/wish.png" style="width: 50px; height: 50px;"></button>';
            output += '<input type="hidden" value="' + w_no + '" name="w_no" id="w_no">';
        }

        wish_box.innerHTML = output;
    })
}

function wishGo(p_no, user_no) {
    if(log_no == 0) {
        alert("로그인을 해주세요");
        return;
    }

    let settings = {
        "url": "/product/wish/" + p_no + "/" + user_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no" : p_no,
            "user_no": user_no,
            "p_title" : product_title
        }),
    }

    $.ajax(settings).done(e=> {
        wishOnload();
    })
}

function wishCancel(w_no) {

    let settings = {
        "url": "/product/wish/" + w_no + "/delete",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "w_no" : w_no
        }),
    }

    $.ajax(settings).done(e=> {
        wishOnload();
    })
}

