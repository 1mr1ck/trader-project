const ltList = document.querySelector('.letterList');
let content = document.getElementById('l_content');
let login_user = document.getElementById('login_user').value;

function inputEnter(e) {
    const code = e.code;
    if(code == "Enter")
        letterWrite();
}

function letterWrite() {
    let p_no = $('#p_no').val();
    let p_title = $('#p_title').val();
    let user_no = $('#user_no').val();
    let user_nickname = $('#user_nickname').val();
    let other_no = $('#other_no').val();
    let other_nickname = $('#other_nickname').val();
    let l_content = $('#l_content').val();
    let make_code = true;
    if(login_user !== user_no) {
        make_code = false;
    }
    console.log(make_code);

    if(l_content === "") {
        alert("입력!");
        return;
    }

    let writeSettings = {
        "url": "/v1/write/letter",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no,
            "p_title": p_title,
            "user_no": user_no,
            "user_nickname": user_nickname,
            "other_no": other_no,
            "other_nickname": other_nickname,
            "l_content": l_content,
            "make": make_code
        }),
    };

    let printSettings = {
        "url": "/v1/read/letter/" + p_no + "/" + user_no + "/" + other_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        }
    };

    $.ajax(writeSettings).done(function (response) {
        console.log(response);

        $.ajax(printSettings).done(function (response) {
            const list = response;
            let output = "";

            list.forEach(e => {
                let nickname = "";
                if(e.make) {
                    nickname = e.other_nickname;
                } else {
                    nickname = e.user_nickname;
                }
                console.log(e.make);
                const l_content = e.l_content;
                const regStr = e.regDate;
                const regDate = regStr.substring(11, 16);
                console.log(regDate);

                output += '<tr><td>' + nickname + '</td><td>' + l_content + '</td><td>' + regDate + '</td></tr>';
            });

            ltList.innerHTML = output;
            content.value = null;
            content.autofocus;
        });
    });

}