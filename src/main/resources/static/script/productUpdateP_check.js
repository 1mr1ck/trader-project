function updateP_check() {

    let p_no = $('#p_no').val();
    let other_no = $('#other_no').val();
    let p_check = $('#p_check').val();
    if(p_check === '진행중')
        other_no = 1;

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
            "other_no": other_no,
            "p_check": p_check
        }),
    };

    $.ajax(settings).done(function (response) {
        if(p_check !== '거래완')
            alert(p_check + " 상태로 변경되었습니다.");
        else
            alert(p_check + "료 상태로 변경되었습니다.");
        console.log(response);
    });
}

function addcomma(value){
    addCommaValue = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    document.getElementById('price').value = addCommaValue;
}
