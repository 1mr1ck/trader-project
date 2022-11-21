function updateP_check() {

    let p_no = $('#p_no').val();
    let p_check = $('#p_check').val();

    var settings = {
        "url": "http://localhost:8080/v1/update/product/p_check",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "p_no": p_no,
            "p_check": p_check
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });
}