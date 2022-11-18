const cmtList = document.querySelector('.cmt-list');
const login_no = document.getElementById('no').value;
const login_nickname = document.getElementById('nickname').value;
const content_box = document.getElementById('cmt-content');

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

        list.forEach(e => {
            console.log(login_no);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.bc_content;
            const bc_no = e.bc_no;
            const cmt_user_no = e.user_no;
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

        content_box.value = "";
        alert("댓글 등록이 완료되었습니다.");
    });
}

// 수정 시작
function updateComment(b_no, bc_no) {

    let settings = {
        "url" : "http://localhost:8080/b_comments/board/" + b_no,
        "method" : "POST",
        "timeout" : 0,
        "header" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "b_no" : b_no
        })
    }

    $.ajax(settings).done(function (result) {
        const list = result;

        var output = "<tr>";

        list.forEach(e=> {
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.bc_content;
            const cmt_no = e.bc_no;
            const cmt_nickname = e.user_nickname;
            const cmt_user_no = e.user_no;

            output += '<td class="nickname">' + cmt_nickname + '</td>';
            output += '<td class="data">' + modDate + '</td>';
            output += '</tr>';
            if(bc_no == cmt_no) {
                output += '<td><input type="text" id="updateContent" name="updateContent" value="' + content + '"></td>';
                output += '<td><button onclick="modifyComment(' + b_no + ',' + cmt_no + ')">수정</button>' +
                    '<button onclick="modCancelComment(' + b_no + ',' + cmt_no + ')">취소</button></td>';
            } else {
                output += '<td class="content">' + content + '</td>';
                if(login_no == cmt_user_no) {
                    output += '<td><button onclick="updateComment(' + b_no + ',' + cmt_no + '">수정</button>' +
                        '<button onclick="deleteComment(' + b_no + ',' + cmt_no + '">삭제</button></td>';
                }
            }
            output += '</tr>';

            cmtList.innerHTML = output;
        })
    })
}

// 수정 완료
function modifyComment(b_no, bc_no) {
    const updateContent = document.getElementById('updateContent').value;
    let settings = {
        "url" : "http://localhost:8080/b_comment/board/" + b_no + "/" + bc_no + "/update",
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "b_no" : b_no,
            "bc_no" : bc_no,
            "bc_content" : updateContent
        })
    };

    $.ajax(settings).done(function (result) {
        var output = '<tr>';
        const list = result;

        list.forEach(e => {
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.bc_content;
            const bc_no = e.bc_no;
            const cmt_user_no = e.user_no;
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
    })
}

// 수정 취소
function modCancelComment(b_no, bc_no) {

    let settings = {
        "url": "http://localhost:8080/b_comments/board/" + b_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "b_no": b_no,
            "bc_no" : bc_no
        }),
    };

    $.ajax(settings).done(function (result) {
        var output = '<tr>';
        const list = result;

        list.forEach(e => {
            console.log(login_no);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.bc_content;
            const bc_no = e.bc_no;
            const cmt_user_no = e.user_no;
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

        content_box.value = "";
    });
}

// 삭제
function deleteComment(b_no, bc_no) {

    var settings = {
        "url" : "http://localhost:8080/b_comment/board/" + b_no + "/" + bc_no + "/delete",
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "b_no" : b_no,
            "bc_no" : bc_no
        })
    };

    $.ajax(settings).done(function (result) {
        const list = result;

        var output = "";

        if(list.length === 0) {
            cmtList.innerHTML = output;
        } else {
            output = '<tr>';
            list.forEach(e => {
                const modStr = e.modDate;
                const modDate = modStr.substring(0,10);
                const content = e.bc_content;
                const cmt_no = e.bc_no;
                const user_nickname = e.user_nickname;
                const cmt_user_no = e.user_no;

                output += '<td class="nickname">' + user_nickname + '</td>';
                output += '<td class="data">' + modDate + '</td>';
                output += '</tr>';
                output += '<tr class="content-box">';
                output += '<td class=content">' + content + '</td>';
                if(login_no == cmt_user_no) {
                    output += '<td><button onclick="updateComment(' + b_no + ',' + cmt_no + ')">수정</button>' +
                        '<button onclick="deleteComment(' + b_no + ',' + cmt_no + ')">삭제</button></td>' +
                        '</tr>';
                } else {
                    output += '</tr>';
                }

                cmtList.innerHTML = output;
            });
        }

        alert("댓글이 삭제되었습니다");
    })
}