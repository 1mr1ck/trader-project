function productCreate() {

    let user_no = $('#user_no').val();
    let other_no = $('#other_no').val();
    let p_title = $('#p_title').val();
    let p_content = $('#p_content').val();
    let category = $('#category').val();
    let p_check = $('#p_check').val();
    let img_url = $('#img_url').val();
    let p_type = $('#p_type').val();

    let settings = {
        "url": "http://localhost:8080/v1/write/product",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": user_no,
            "other_no": other_no,
            "p_title": p_title,
            "p_content": p_content,
            "category": category,
            "p_check": p_check,
            "img_url": img_url,
            "p_type": p_type
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        location.href="/";
    });
}