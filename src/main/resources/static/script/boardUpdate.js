function boardUpdate () {
    let b_no = $('#b_no').val();
    let user_no = $('#user_no').val();
    let b_title = $('#b_title').val();
    let b_content = $('#b_content').val();
    let nickname = $('#nickname').val();



    var settings = {
        "url": "/v1/update/board/",
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
    });fail(function(error){
        alert("글수정 실패");
        console.log(error);
    })
}

$(function() {

    $('#update').click(function(){

        if($('#b_title').val() == ""){
            alert("제목을 입력해주세요.");
            return false;
        }

        if($('#b_content').val() == ""){
            alert("내용을 입력해주세요.");
            return false;
        }
        boardUpdate();
    });
});

function deleteBoard() {
    let b_no = $('#boardNo').val();
    document.location.href='/v1/delete/board?b_no='+b_no;
}

$(function() {

    $('#delete').click(function(){

    if (confirm("정말 삭제하시겠습니까??") == true){    //확인

        deleteBoard();

    }else{   //취소

        return false;

    }

    });
});