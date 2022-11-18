const ltList = document.querySelector('.letterList');

let content = document.getElementById('l_content');

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

    if(l_content === "") {
        alert("tlqkf?");
        return;
    }

    let writeSettings = {
        "url": "http://localhost:8080/v1/write/letter",
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
            "l_content": l_content
        }),
    };

    let printSettings = {
        "url": "http://localhost:8080/v1/read/letter/" + p_no + "/" + user_no + "/" + other_no,
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
                const user_nickname = e.user_nickname;
                const l_content = e.l_content;
                const regStr = e.regDate;
                const regDate = regStr.substring(0, 10) + " " + regStr.substring(12, 19);

                output += '<tr><td>' + user_nickname + '</td><td>' + l_content + '</td><td>' + regDate + '</td></tr>';
            });

            ltList.innerHTML = output;
            content.value = null;
            content.autofocus;
        });
    });

}