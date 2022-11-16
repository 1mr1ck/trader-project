function createBoard(){

    let user_no = $('#user_no').val();
    let b_title = $('#b_title').val();
    let b_content = $('#b_content').val();
    let notice = $('#notice').val();
    let noticeCheck = false;
    if(notice==="공지"){
        noticeCheck=true;
    }

    let settings = {
        "url": "http://localhost:8080/v1/write/board",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": user_no,
            "b_title": b_title,
            "b_content": b_content,
            "notice": noticeCheck
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        location.href="/";
    });
}