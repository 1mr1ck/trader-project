function productSearch() {

    let category = $('#category').val();
    let p_type = $('#p_type').val();
    let keyword = $('#keyword').val();
    
    if(keyword === "")
        keyword = "전체"

    let settings = {
        "url": "http://localhost:8080/search/product/category/" + category + "/p_type/" + p_type + "/keyword/" + keyword,
        "method": "GET",
        "timeout": 0,
    };

    const titlebox = document.querySelector('.title');
    const btn_box = document.querySelector('.page_btn_box');
    const box = document.querySelector('.container');
    $.ajax(settings).done(function (response) {
        console.log(response);

        const list = response.content;
        const totalPage = response.totalPages;

        var titleOutput = "";
        titleOutput += '<tr>';
        titleOutput += '<th>이미지</th>';
        titleOutput += '<th>제목</th>';
        titleOutput += '<th>카테고리</th>';
        titleOutput += '<th>닉네임</th>';
        titleOutput += '<th>삽니다/팝니다</th>';
        titleOutput += '<th>가격</th>';
        titleOutput += '<th>작성/수정날짜</th>';
        titleOutput += '</tr>';

        var output = "";
        var btn_output = "";

        list.forEach(e => {
            const p_no = e.p_no;
            const img_url = e.img_url;
            const p_title = e.p_title;
            const category = e.category;
            const p_type = e.p_type;
            const nickname = e.nickname;
            // const regStr = e.regDate;
            // const p_regDate = regStr.substring(0, 10);
            const modStr = e.modDate;
            const p_modDate = modStr.substring(0, 10);
            const priceStr = e.price;
            const price = priceStr.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

            output += '<tr>';
            output += '<td><img src="' + img_url + '" style="width: 100px; height: 100px;"></td>';
            output += '<td><a href="/productView/' + p_no + '">' + p_title + '</a></td>';
            output += '<td>' + category + '</td>';
            output += '<td>' + nickname + '</td>';
            output += '<td>' + p_type + '</td>';
            output += '<td>' + price + '원</td>';
            output += '<td>' + p_modDate + '</td>';
            output += '</tr>';
        });
        for (let i = 0; i < totalPage; i++) {
            if (i == 0) {
                btn_output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6" class="page_btn">' + (i + 1) + '</button>'
            } else {
                btn_output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff" class="page_btn">' + (i + 1) + '</button>'
            }
        }

        box.innerHTML = output;
        btn_box.innerHTML = btn_output;
        titlebox.innerHTML = titleOutput;
    });
}

function x_page(pageNum) {
    let category = $('#category').val();
    let p_type = $('#p_type').val();
    let keyword = $('#keyword').val();

    if(keyword === "")
        keyword = "전체"

    let settings = {
        "url": "http://localhost:8080/search/product/category/" + category + "/p_type/" + p_type + "/keyword/" + keyword + "/pageNum/" + pageNum,
        "method": "GET",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113"
        },
    };

    const btn_box = document.querySelector('.page_btn_box');
    const box = document.querySelector('.container');
    $.ajax(settings).done(function (response) {
        console.log(response);

        const list = response.content;
        const totalPage = response.totalPages;

        var output = "";
        var btn_output = "";

        list.forEach(e => {
            const p_no = e.p_no;
            const img_url = e.img_url;
            const p_title = e.p_title;
            const category = e.category;
            const p_type = e.p_type;
            const nickname = e.nickname;
            // const regStr = e.regDate;
            // const p_regDate = regStr.substring(0, 10);
            const modStr = e.modDate;
            const p_modDate = modStr.substring(0, 10);
            const priceStr = e.price;
            const price = priceStr.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

            output += '<tr>';
            output += '<td><img src="' + img_url + '" style="width: 100px; height: 100px;"></td>';
            output += '<td><a href="/productView/' + p_no + '">' + p_title + '</a></td>';
            output += '<td>' + category + '</td>';
            output += '<td>' + nickname + '</td>';
            output += '<td>' + p_type + '</td>';
            output += '<td>' + price + '원</td>';
            output += '<td>' + p_modDate + '</td>';
            output += '</tr>';
        });
        for (let i = 0; i < totalPage; i++) {
            if (i == pageNum) {
                btn_output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6" class="page_btn">' + (i + 1) + '</button>'
            } else {
                btn_output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff" class="page_btn">' + (i + 1) + '</button>'
            }
        }

        box.innerHTML = output;
        btn_box.innerHTML = btn_output;
    });
}