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
    });fail(function(error){
        alert("글수정 실패");
        console.log(error);
    })


}