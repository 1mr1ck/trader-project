function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function productCreate() {

    if($('#p_title').val() === ""){
        alert("제목을 입력해주세요.");
        return false;
    }

    if($('#price').val() === ""){
        alert("가격을 입력해주세요.");
        return false;
    }

    if($('#input_img').val() === ""){
        alert("이미지를 넣어주세요.");
        return false;
    }

    if($('#p_content').val() === ""){
        alert("내용을 입력해주세요.");
        return false;
    }

    var file = document.getElementById('input_img');
    var form = new FormData();
    form.append("image", file.files[0])

    var imageSettings = {
        "url": "https://api.imgbb.com/1/upload?key=1a85bf62a95b42747a34329236c28d7b",
        "method": "POST",
        "timeout": 0,
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
    };

    $.ajax(imageSettings).done(function (response) {
        console.log(response);
        var jx = JSON.parse(response);
        console.log(jx.data.url);

        let user_no = $('#user_no').val();
        let other_no = $('#other_no').val();
        let p_title = $('#p_title').val();
        let p_content = $('#p_content').val();
        let category = $('#category').val();
        let p_check = $('#p_check').val();
        let img_url = jx.data.url;
        let p_type = $('#p_type').val();
        let nickname = $('#nickname').val();
        let price = $('#price').val();

        let createSettings = {
            "url": "/v1/write/product",
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
                "p_type": p_type,
                "nickname": nickname,
                "price": price
            }),
        };

        $.ajax(createSettings).done(function (response) {
            console.log(response);
            location.href="/productSearch";
        });
    });
}