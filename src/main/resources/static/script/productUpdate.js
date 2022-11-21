function productUpdate() {

    let p_no = $('#p_no').val();
    let p_title = $('#p_title').val();
    let p_content = $('#p_content').val();
    let category = $('#category').val();
    let img_url = $('#img_url').val();

    var settings = {
        "url": "http://localhost:8080/v1/update/product",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no,
            "p_title": p_title,
            "p_content": p_content,
            "category": category,
            "img_url": img_url
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        location.href="/";
    });
}