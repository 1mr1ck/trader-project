const ltList = document.querySelector('.letterList');

function letterWrite() {
    let user_no = $('#user_no').val();
    let p_no = $('#p_no').val();
    let nickname = $('#nickname').val();
    let l_content = $('#l_content').val();

    let writeSettings = {
        "url": "http://localhost:8080/v1/write/letter",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": user_no,
            "p_no": p_no,
            "nickname": nickname,
            "l_content": l_content
        }),
    };

    let printSettings = {
        "url": "http://localhost:8080/v1/read/letter/user_no/" + user_no + "/p_no/" + p_no,
        "method": "GET",
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
                const nickname = e.nickname;
                const l_content = e.l_content;
                const regDate = e.regDate;

                output += '<tr><td>' + nickname + '</td><td>' + l_content + '</td><td>' + regDate + '</td></tr>';
            });

            ltList.innerHTML = output;
        });
    });

}