const cmtList = document.querySelector('.cmt-list');
const login_no = document.getElementById('no').value;
const login_nickname = document.getElementById('nickname').value;

// 생성
function saveComment(b_no) {
    if(login_nickname === "") {
        alert("로그인을 해주세요.");
        return;
    }
    const bc_content = document.getElementById('cmt-content').value;

    let settings = {
        "url": "http://localhost:8080/b_comment/board/" + b_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "b_no": b_no,
            "user_no": login_no,
            "user_nickname": login_nickname,
            "bc_content": bc_content
        }),
    };

    $.ajax(settings).done(function (result) {
        var output = '<tr>';
        const list = result;
        console.log(result);

        list.forEach(e => {
            console.log(login_no);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.bc_content;
            const bc_no = e.bc_no;
            const cmt_user_no = e.user_no;
            console.log(cmt_user_no);
            const cmt_nickname = e.user_nickname;

            output += '<td class="nickname">' + cmt_nickname + '</td>';
            output += '<td class="date">' + modDate + '</td>'
            output += '</tr>';
            output += '<tr claass="content-box">';
            output += '<td class="content">' + content + '</td>';
            if(login_no == cmt_user_no) {
                output += '<td><button onclick="updateComment(' + b_no + ','  + bc_no + ')">수정</button>' +
                    '<button onclick="deleteComment(' + b_no + ',' +  bc_no + ')">삭제</button></td>' +
                    '</tr>';
            } else {
                output += '</tr>';
            }


            cmtList.innerHTML = output;
        })

        alert("댓글 등록이 완료되었습니다.");
    });
}