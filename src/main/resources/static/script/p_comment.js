const cmtList = document.querySelector('.cmt-list');
const login_no = document.getElementById('no').value;
const login_nickname = document.getElementById('nickname').value;
const content_box = document.getElementById('cmt-content');
// 등록
function saveComment(p_no) {
    if(login_nickname === "") {
        alert("로그인을 해주세요.");
        return;
    }
    const pc_content = document.getElementById('cmt-content').value;

    let settings = {
        "url": "http://localhost:8080/p_comment/product/" + p_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no,
            "user_no": login_no,
            "user_nickname": login_nickname,
            "pc_content": pc_content
        }),
    };

    $.ajax(settings).done(function (result) {
        var output = '<tr>';
        const list = result;

        list.forEach(e => {
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.pc_content;
            const pc_no = e.pc_no;
            const cmt_user_no = e.user_no;
            const cmt_nickname = e.user_nickname;

            output += '<td class="nickname">' + cmt_nickname + '</td>';
            output += '<td class="date">' + modDate + '</td>'
            output += '</tr>';
            output += '<tr claass="content-box">';
            output += '<td class="content">' + content + '</td>';
            if(login_no == cmt_user_no) {
                output += '<td><button onclick="updateComment(' + p_no + ','  + pc_no + ')">수정</button>' +
                    '<button onclick="deleteComment(' + p_no + ',' +  pc_no + ')">삭제</button></td>' +
                    '</tr>';
            } else {
                output += '</tr>';
            }

            content_box.value = "";
            cmtList.innerHTML = output;
        })

        alert("댓글 등록이 완료되었습니다.");
    });
}

// 수정
// 1차
function updateComment(p_no, pc_no) {

    let settings = {
        "url" : "http://localhost:8080/p_comments/product/" + p_no,
        "method" : "POST",
        "timeout" : 0,
        "header" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "p_no" : p_no
        })
    }

    $.ajax(settings).done(function (result) {
        const list = result;

        var output = "";

        list.forEach(e=> {
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.pc_content;
            const cmt_no = e.pc_no;
            const cmt_nickname = e.user_nickname;
            const cmt_user_no = e.user_no;

            output += '<td class="nickname">' + cmt_nickname + '</td>';
            output += '<td class="date">' + modDate + '</td>'
            output += '</tr>';
            output += '<tr claass="content-box">';
            if(pc_no == cmt_no) {
                output += '<td><input type="text" id="updateContent" name="updateContent" value="' + content + '"</td>';
                output += '<td><button onclick="modifyComment(' + p_no + ','  + cmt_no + ')">수정</button>' +
                    '<button onclick="modCancleComment(' + p_no + ','  + cmt_no + ')">취소</button></td>';
            } else {
                output += '<td class="content">' + content + '</td>';
                if(login_no == cmt_user_no) {
                    output += '<td><button onclick="updateComment(' + p_no + ','  + cmt_no + ')">수정</button>' +
                        '<button onclick="deleteComment(' + p_no + ',' +  cmt_no + ')">삭제</button></td>';
                }
            }
            output += '</tr>';

            cmtList.innerHTML = output;
        })
    });
}


// 2차
function modifyComment(p_no, pc_no) {
    const updateContent = document.getElementById("updateContent").value;
    let settings = {
        "url": "http://localhost:8080/p_comment/product/" + p_no + "/" + pc_no + "/update",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no,
            "pc_no" : pc_no,
            "user_no": login_no,
            "user_nickname": login_nickname,
            "pc_content" : updateContent
        }),
    };

    $.ajax(settings).done(function (result) {
        var output = '<tr>';
        const list = result;

        list.forEach(e => {
            console.log(login_no);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);
            const content = e.pc_content;
            const pc_no = e.pc_no;
            const cmt_user_no = e.user_no;
            const cmt_nickname = e.user_nickname;

            output += '<td class="nickname">' + cmt_nickname + '</td>';
            output += '<td class="date">' + modDate + '</td>'
            output += '</tr>';
            output += '<tr claass="content-box">';
            output += '<td class="content">' + content + '</td>';
            if(login_no == cmt_user_no) {
                output += '<td><button onclick="updateComment(' + p_no + ','  + pc_no + ')">수정</button>' +
                    '<button onclick="deleteComment(' + p_no + ',' +  pc_no + ')">삭제</button></td>' +
                    '</tr>';
            } else {
                output += '</tr>';
            }


            cmtList.innerHTML = output;
        })

    });
}

// 취소
function modCancleComment(p_no, pc_no) {

    let settings = {
        "url": "http://localhost:8080/p_comments" +
            "/product/" + p_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no
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
            const content = e.pc_content;
            const pc_no = e.pc_no;
            const cmt_user_no = e.user_no;
            console.log(cmt_user_no);
            const cmt_nickname = e.user_nickname;

            output += '<td class="nickname">' + cmt_nickname + '</td>';
            output += '<td class="date">' + modDate + '</td>'
            output += '</tr>';
            output += '<tr claass="content-box">';
            output += '<td class="content">' + content + '</td>';
            if(login_no == cmt_user_no) {
                output += '<td><button onclick="updateComment(' + p_no + ','  + pc_no + ')">수정</button>' +
                    '<button onclick="deleteComment(' + p_no + ',' +  pc_no + ')">삭제</button></td>' +
                    '</tr>';
            } else {
                output += '</tr>';
            }


            cmtList.innerHTML = output;
        })

    });
}
// 삭제
function deleteComment(p_no, pc_no) {

    let settings = {
        "url": "http://localhost:8080/p_comment/product/" + p_no + "/" + pc_no + "/delete",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no,
            "pc_no" : pc_no,
            "user_no": login_no,
            "user_nickname": login_nickname,
        }),
    };

    $.ajax(settings).done(function (response) {
        const list = response;
        console.log(list);

        var output = "";
        if(list.length === 0) {
            cmtList.innerHTML = output;
        } else {
            output = '<tr>';
            list.forEach(e => {
                const modStr = e.modDate;
                const modDate = modStr.substring(0,10);
                const content = e.pc_content;
                const cmt_no = e.pc_no;
                const user_nickname = e.user_nickname;
                const cmt_user_no = e.user_no;

                output += '<td class="nickname">' + user_nickname + '</td>';
                output += '<td class="date">' + modDate + '</td>'
                output += '</tr>';
                output += '<tr claass="content-box">';
                output += '<td class="content">' + content + '</td>';
                if(login_no == cmt_user_no) {
                    output += '<td><button onclick="updateComment(' + p_no + ','  + cmt_no + ')">수정</button>' +
                        '<button onclick="deleteComment(' + p_no + ',' +  cmt_no + ')">삭제</button></td>' +
                        '</tr>';
                } else {
                    output += '</tr>';
                }

                cmtList.innerHTML = output;
            });
        }

        alert("댓글이 삭제되었습니다.");
    });
}