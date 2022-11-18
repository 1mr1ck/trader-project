// const cmtList = document.querySelector('.cmt-list');
// const login_no = document.getElementById('no').value;
// const login_nickname = document.getElementById('nickname').value;
// function modifyboard(b_no) {
//     const updateContent = document.getElementById("updateContent").value;
//     console.log(updateContent);
//     let settings = {
//         "url": "http://localhost:8080/update/board/" + b_no + "/" + "/update",
//         "method": "POST",
//         "timeout": 0,
//         "headers": {
//             "Content-Type": "application/json"
//         },
//         "data": JSON.stringify({
//             "b_no": b_no,
//             "user_no": login_no,
//             "user_nickname": login_nickname,
//             "b_content" : updateContent
//         }),
//     };
//
//     $.ajax(settings).done(function (result) {
//         let output = '<td>';
//         const board = result;
//         console.log(result);
//
//         board.forEach(e => {
//             console.log(login_no);
//             const modStr = e.modDate;
//             const modDate = modStr.substring(0,10);
//             const content = e.pc_content;
//             const b_no = e.b_no;
//             const cmt_user_no = e.user_no;
//             console.log(cmt_user_no);
//             const cmt_nickname = e.user_nickname;
//
//             output += '<td class="nickname">' + cmt_nickname + '</td>';
//             output += '<td class="date">' + modDate + '</td>'
//             output += '</tr>';
//             output += '<tr claass="content-box">';
//             output += '<td class="content">' + content + '</td>';
//             if(login_no == cmt_user_no) {
//                 output += '<td><button onclick="updateComment(' + b_no + ',' + ')">수정</button>' +
//                     // '<button onclick="deleteComment(' + p_no + ',' +  pc_no + ')">삭제</button></td>' +
//                     '</tr>';
//             } else {
//                 output += '</tr>';
//             }
//
//
//             cmtList.innerHTML = output;
//         })
//
//     });
// }

function boardUpdate () {
    let b_no = $('#b_no').val();
    let user_no = $('#user_no').val();
    let b_title = $('#b_title').val();
    let b_content = $('#b_content').val();
    let nickname = $('#nickname').val();



    var settings = {
        "url": "http://localhost:8080/v1/update/board/",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "b_no": b_no,
            "user_no": user_no,
            "b_title": b_title,
            "b_content": b_content,
            "nickname" : nickname,
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        alert("글수정 성공");
        location.href="/";
    });
    // // fail(function(error){
    //     alert("글수정 실패");
    //     console.log(error);
    // })


}