function createBoard(){

    let user_no = $('#user_no').val();
    let b_title = $('#b_title').val();
    let b_content = $('#b_content').val();
    let nickname = $('#nickname').val();
    let notice = $('#notice').val();
    let noticeCheck = false;
    if(notice==="공지"){
        noticeCheck=true;
    }

    let settings = {
        "url": "/v1/write/board",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": user_no,
            "b_title": b_title,
            "b_content": b_content,
            "notice": noticeCheck,
            "nickname" : nickname
        }),
    };

    $.ajax(settings).done(function (response) {

        console.log(response);
        alert("글쓰기 성공");
        location.href="/boardView";
    });
};
$(function() {

    $('#create').click(function(){

        if($('#b_title').val() == ""){
            alert("제목을 입력해주세요.");
            return false;
        }

        if($('#b_content').val() == ""){
            alert("내용을 입력해주세요.");
            return false;
        }
    });
});
