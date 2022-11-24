function x_page(pageNum) {


    var settings = {
        "url": "http://localhost:8080/boardView/pageNum/" + pageNum,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify([]),
    };

    const boardList = document.querySelector('.boardList');
    const box = document.querySelector('.page-btn-box');

    $.ajax(settings).done(function (response) {
        console.log(response);

        var listOutput = "";
        var btnOutput = "";

        const list = response.content;
        const totalPage = response.totalPages;

        list.forEach(e => {
            const b_no = e.b_no;
            const b_title = e.b_title;
            const nickname = e.nickname;
            const modStr = e.modDate;
            const b_modDate = modStr.substring(0, 10);

            listOutput += '<tr>';
            listOutput += '<td>' + b_no + '</td>';
            listOutput += '<td><a href="/boardDetail/' + b_no + '">' + b_title + '</a></td>';
            listOutput += '<td>' + nickname + '</td>';
            listOutput += '<td>' + b_modDate + '</td>';
            listOutput += '</tr>';
        });
        for (let i = 0; i < totalPage; i++) {
            if (i == pageNum) {
                btnOutput += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6" class="page_btn">' + (i + 1) + '</button>'
            } else {
                btnOutput += '<button onclick=x_page(' + i + ') style="background-color: #ffffff" class="page_btn">' + (i + 1) + '</button>'
            }
        }
        boardList.innerHTML = listOutput;
        box.innerHTML = btnOutput;
    });
}