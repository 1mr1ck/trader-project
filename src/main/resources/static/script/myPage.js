const login_no = document.getElementById('user_no').value;
const box = document.getElementById('wrap');

let p_type = document.getElementById('p_type').value;
let p_check = document.getElementById('p_check').value;

// 상품 게시글
function my_product() {
    var settings = {
        "url": "http://localhost:8080/search/product/user_no/" + login_no + "/p_type/" + p_type + "/p_check/" + p_check,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        }
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        let output ='';
        output += '<div class="out">';
        if(p_check === '전체')
            output += '<button onclick="setP_check(`전체`)" style="background-color: #ffc9f6">전체</button>';
        else
            output += '<button onclick="setP_check(`전체`)" style="background-color: #fff">전체</button>';
        if(p_check === '진행중')
            output += '<button onclick="setP_check(`진행중`)" style="background-color: #ffc9f6">진행중</button>';
        else
            output += '<button onclick="setP_check(`진행중`)" style="background-color: #fff">진행중</button>';
        if(p_check === '예약중')
            output += '<button onclick="setP_check(`예약중`)" style="background-color: #ffc9f6">예약중</button>';
        else
            output += '<button onclick="setP_check(`예약중`)" style="background-color: #fff">예약중</button>';
        if(p_check === '거래완')
            output += '<button onclick="setP_check(`거래완`)" style="background-color: #ffc9f6">거래완료</button>';
        else
            output += '<button onclick="setP_check(`거래완`)" style="background-color: #fff">거래완료</button>';

        if(p_type === '전체')
            output += '<div><button onclick="setP_type(`전체`)" style="background-color: #ffc9f6">전체</button>';
        else
            output += '<div><button onclick="setP_type(`전체`)" style="background-color: #fff">전체</button>';
        if(p_type === '삽니다')
            output += '<button onclick="setP_type(`삽니다`)" style="background-color: #ffc9f6">삽니다</button>';
        else
            output += '<button onclick="setP_type(`삽니다`)" style="background-color: #fff">삽니다</button>';
        if(p_type === '팝니다')
            output += '<button onclick="setP_type(`팝니다`)" style="background-color: #ffc9f6">팝니다</button></div>';
        else
            output += '<button onclick="setP_type(`팝니다`)" style="background-color: #fff">팝니다</button></div>';
        output += '<div class="in">';
        output += '<form method="POST">'
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">'
        output += '</form>';
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="category">카테고리</th>';
        output += '<th class="title">제목</th>';
        output += '<th class="content">내용</th>';
        output += '<th class="price">가격</th>';
        output += '<th class="check">진행상태</th>';
        output += '<th class="type">판매/구매</th>';
        output += '<th class="type">수정/삭제</th>';
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        const list = response.content;
        const size = response.pageable;
        const totalEle = response.totalElements;
        const totalPages = response.totalPages;

        list.forEach(e => {
            let p_no = e.p_no;
            let user_no = e.user_no;
            let category = e.category;
            let title = e.p_title;
            let content = e.p_content;
            let priceStr = e.price;
            let price = priceStr.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            let check = e.p_check;
            let type = e.p_type;
            if(check === '거래완')
                check += '료';

            output += '<tr>'
            output += '<td>' + category + '</td>'
            output += '<td onclick="location.href=`/productView/' + p_no + '`" style="cursor: pointer">' + title + '</td>'
            output += '<td>' + content + '</td>'
            output += '<td>' + price + '원</td>'
            output += '<td>' + check + '</td>'
            output += '<td>' + type + '</td>'
            output += '<td><button onclick="location.href=`productUpdate/' + p_no + '`">수정</button>'
            output += '<button onclick="productDelete(' + p_no + ',' + user_no +')">삭제</button></td>'
            output += '</tr>'

        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        if(totalPages < 10) {
            for (let i = 0; i < totalPages; i++) {
                if (i == 0) {
                    output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6">' + (i + 1) + '</button>'
                } else {
                    output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff">' + (i + 1) + '</button>'
                }
            }
        } else {
            for (let i = 0; i < 10; i++) {
                if (i == 0) {
                    output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6">' + (i + 1) + '</button>'
                } else {
                    output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff">' + (i + 1) + '</button>'
                }
            }
        }
        output += '</div>';

        box.innerHTML = output;
    });
}

// x 페이지 게시글
function x_page(pageNum) {
    console.log(pageNum);
    var settings = {
        "url": "http://localhost:8080/search/product/user_no/" + login_no + "/p_type/" + p_type + "/p_check/" + p_check + "/pageNum/" + pageNum,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": login_no,
        })
    };

    $.ajax(settings).done(function (response) {
        console.log("페이지넘버 : " + pageNum, response)
        let output ='';
        output += '<div class="out">';
        if(p_check === '전체')
            output += '<button onclick="setP_check(`전체`)" style="background-color: #ffc9f6">전체</button>';
        else
            output += '<button onclick="setP_check(`전체`)" style="background-color: #fff">전체</button>';
        if(p_check === '진행중')
            output += '<button onclick="setP_check(`진행중`)" style="background-color: #ffc9f6">진행중</button>';
        else
            output += '<button onclick="setP_check(`진행중`)" style="background-color: #fff">진행중</button>';
        if(p_check === '예약중')
            output += '<button onclick="setP_check(`예약중`)" style="background-color: #ffc9f6">예약중</button>';
        else
            output += '<button onclick="setP_check(`예약중`)" style="background-color: #fff">예약중</button>';
        if(p_check === '거래완')
            output += '<button onclick="setP_check(`거래완`)" style="background-color: #ffc9f6">거래완료</button>';
        else
            output += '<button onclick="setP_check(`거래완`)" style="background-color: #fff">거래완료</button>';

        if(p_type === '전체')
            output += '<div><button onclick="setP_type(`전체`)" style="background-color: #ffc9f6">전체</button>';
        else
            output += '<div><button onclick="setP_type(`전체`)" style="background-color: #fff">전체</button>';
        if(p_type === '삽니다')
            output += '<button onclick="setP_type(`삽니다`)" style="background-color: #ffc9f6">삽니다</button>';
        else
            output += '<button onclick="setP_type(`삽니다`)" style="background-color: #fff">삽니다</button>';
        if(p_type === '팝니다')
            output += '<button onclick="setP_type(`팝니다`)" style="background-color: #ffc9f6">팝니다</button></div>';
        else
            output += '<button onclick="setP_type(`팝니다`)" style="background-color: #fff">팝니다</button></div>';
        output += '<div class="in">';
        output += '<form method="POST">'
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">'
        output += '</form>';
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="category">카테고리</th>';
        output += '<th class="title">제목</th>';
        output += '<th class="content">내용</th>';
        output += '<th class="price">가격</th>';
        output += '<th class="check">진행상태</th>';
        output += '<th class="type">판매/구매</th>';
        output += '<th class="type">수정/삭제</th>';
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        const list = response.content;
        const size = response.pageable;
        const totalEle = response.totalElements;
        const totalPages = response.totalPages;

        list.forEach(e => {
            let p_no = e.p_no;
            let user_no = e.user_no;
            let category = e.category;
            let title = e.p_title;
            let content = e.p_content;
            let priceStr = e.price;
            let price = priceStr.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            let check = e.p_check;
            let type = e.p_type;
            if(check === '거래완')
                check += '료';

            output += '<tr>'
            output += '<td>' + category + '</td>'
            output += '<td onclick="location.href=`/productView/' + p_no + '`" style="cursor: pointer">' + title + '</td>'
            output += '<td>' + content + '</td>'
            output += '<td>' + price + '원</td>'
            output += '<td>' + check + '</td>'
            output += '<td>' + type + '</td>'
            output += '<td><button onclick="location.href=`productUpdate/' + p_no + '`">수정</button>'
            output += '<button onclick="productDelete(' + p_no + ',' + user_no +')">삭제</button></td>'
            output += '</tr>'

        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        if(totalPages < 10) {
            for (let i = 0; i < totalPages; i++) {
                if (i == pageNum) {
                    output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6">' + (i + 1) + '</button>'
                } else {
                    output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff">' + (i + 1) + '</button>'
                }
            }
        } else {
            if(totalPages - 10 < pageNum) {
                if(totalPages - 11 > 0) {
                    for (let i = 0; i < 10; i++) {
                        if (i == pageNum) {
                            output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6">' + (i + 1) + '</button>'
                        } else {
                            output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff">' + (i + 1) + '</button>'
                        }
                    }
                } else {
                    for (let i = totalPages - 11; i < totalPages - 1; i++) {
                        if (i == pageNum) {
                            output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6">' + (i + 1) + '</button>'
                        } else {
                            output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff">' + (i + 1) + '</button>'
                        }
                    }
                }
            } else {
                for(let i=pageNum-1; i<pageNum + 9; i++) {
                    if (i == pageNum) {
                        output += '<button onclick=x_page(' + i + ') style="background-color: #ffc9f6">' + (i + 1) + '</button>'
                    } else {
                        output += '<button onclick=x_page(' + i + ') style="background-color: #ffffff">' + (i + 1) + '</button>'
                    }
                }
            }
        }
        output += '</div>';

        box.innerHTML = output;
    });
}

function setP_check(check) {
    p_check = check;
    my_product();
}

function setP_type(type) {
    p_type = type;
    my_product();
}

// 상품 게시글 삭제
function productDelete(p_no, user_no) {
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
        my_product();
    });
}

// 보드 글
function my_board() {
    var settings = {
        "url": "/myPage/boardUser?user_no=" + login_no,
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "user_no": login_no
        }),
    };

    $.ajax(settings).done(function (response) {
        const list = response;

        let output ='<div class="out">';
        output += '<div class="in">';
        output += '<form method="POST">'
        output += '<input type="hidden" value="'
            + login_no + '" id="user_no" name="user_no">'
        output += '</form>';
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="title">제목</th>';
        output += '<th class="content">내용</th>';
        output += '<th class="nickname">닉네임</th>';
        output += '<th class="regDate">작성날짜</th>';
        output += '<th class="modDate">수정날짜</th>';
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        list.forEach(e => {
            let title = e.b_title;
            let content = e.b_content;
            let nickname = e.nickname;
            let modStr = e.modDate;
            let modDate = modStr.substring(0,10);
            let regStr = e.regDate;
            let regDate = regStr.substring(0,10);

            output += '<tr>'
            output += '<td>' + title + '</td>'
            output += '<td>' + content + '</td>'
            output += '<td>' + nickname + '</td>'
            output += '<td>' + modDate + '</td>'
            output += '<td>' + regDate + '</td>'
            output += '</tr>'

        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        output += '</div>';

        box.innerHTML = output;

    });
}

// 커뮤니티 댓글
function my_boardCmt() {

    let settings = {
        "url" : "http://localhost:8080/b_comment/user/" + login_no,
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "user_no" : login_no
        })
    };

    $.ajax(settings).done(function(result) {
        const list = result;
        console.log(result);

        var output = '<div class="out">';
        output += '<div class="in">';
        output += '<form method="POST">';
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">';
        output += '</form>'
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="b_no">게시글번호</th>'
        output += '<th class="content">댓글내용</th>'
        output += '<th class="regDate">작성날짜</th>'
        output += '<th class="modDate">수정날짜</th>'
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        list.forEach(e => {
            const b_no = e.b_no;
            const bc_content = e.bc_content;
            const regStr = e.regDate;
            const regDate = regStr.substring(0,10);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);

            output += '<tr>';
            output += '<td>' + b_no + '</td>';
            output += '<td onclick="location.href=`/boardDetail/'
                + b_no + '`" style="cursor: pointer">' + bc_content + '</td>';
            output += '<td>' + regDate + '</td>';
            output += '<td>' + modDate + '</td>';
            output += '</tr>';
        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        output += '</div>';

        box.innerHTML = output;
    })
}

// 중고장터 댓글
function my_productCmt() {

    let settings = {
        "url" : "http://localhost:8080/p_comment/user/" + login_no,
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "user_no" : login_no
        })
    };

    $.ajax(settings).done(function(result) {
        const list = result;
        console.log(result);

        var output = '<div class="out">';
        output += '<div class="in">';
        output += '<form method="POST">';
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">';
        output += '</form>'
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="b_no">게시글번호</th>'
        output += '<th class="content">댓글내용</th>'
        output += '<th class="regDate">작성날짜</th>'
        output += '<th class="modDate">수정날짜</th>'
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        list.forEach(e => {
            const p_no = e.p_no;
            const pc_content = e.pc_content;
            const regStr = e.regDate;
            const regDate = regStr.substring(0,10);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);

            output += '<tr>';
            output += '<td>' + p_no + '</td>';
            output += '<td onclick="location.href=`/productView/' + p_no + '`" style="cursor: pointer">' + pc_content + '</td>';
            output += '<td>' + regDate + '</td>';
            output += '<td>' + modDate + '</td>';
            output += '</tr>';
        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        output += '</div>';

        box.innerHTML = output;
    })
}

// 좋아요
function my_wish() {

    let settings = {
        "url" : "http://localhost:8080/wish/" + login_no,
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "user_no" : login_no
        })
    }

    $.ajax(settings).done(function(result) {
        const list = result;

        var output = '<div class="out">';
        output += '<div class="in">';
        output += '<form method="POST">';
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">';
        output += '</form>'
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="p_no">게시글 번호</th>'
        output += '<th class="content">제목</th>'
        output += '<th class="regDate">♡-날짜</th>'
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        list.forEach(e => {
            const p_no = e.p_no;
            const p_title = e.p_title;
            const regStr = e.regDate;
            const regDate = regStr.substring(0,10);

            output += '<tr>';
            output += '<td>' + p_no + '</td>';
            output += '<td onclick="location.href=`/productView/' + p_no + '`" style="cursor: pointer">' + p_title + '</td>';
            output += '<td>' + regDate + '</td>';
            output += '</tr>';
        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        output += '</div>';

        box.innerHTML = output;
    })
}