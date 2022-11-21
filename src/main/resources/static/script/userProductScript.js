function content(){
    const userTbody = document.querySelector('.userProductTBody');
    let no = document.getElementById('user_no').value;

    var settings = {
        "url": "/myPage/productUser?user_no=" + no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": no
        }),
    };

    $.ajax(settings).done(function (response) {
        let tableBody ='';
        const list = response;
        list.forEach(e => {
            console.log(response);
            let p_no = e.p_no;
            let user_no = e.user_no;
            let category = e.category;
            let title = e.p_title;
            let content = e.p_content;
            let check = e.p_check;
            let type = e.p_type;
            if(check === "거래완")
                check += "료";

            tableBody += '<tr>'
            tableBody += '<td>' + category + '</td>'
            tableBody += '<td>' + title + '</td>'
            tableBody += '<td>' + content + '</td>'
            tableBody += '<td>' + check + '</td>'
            tableBody += '<td>' + type + '</td>'
            tableBody += '<td><button onclick="location.href=`productUpdate/' + p_no + '`">수정</button>'
            tableBody += '<button onclick="productDelete(' + p_no + ',' + user_no +')">삭제</button></td>'
            tableBody += '</tr>'

            userTbody.innerHTML = tableBody;
        })

    });
}

function productDelete(p_no,user_no) {
    var settings = {
        "url": "http://localhost:8080/v1/delete/product?p_no=" + p_no + "&user_no=" + user_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113",
            "Content-Type": "application/json"
        },
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        content();
    });
}

function productPrint() {

}