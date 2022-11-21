const login_no = document.getElementById('user_no').value;
const box = document.getElementById('wrap');

// 회원정보수정 틀
function modifyMyInfo() {

    var output = "";

    let settings = {
        "url" : "http://localhost:8080/user/" + login_no,
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "no" : login_no
        })
    };

    $.ajax(settings).done(function(result) {
        const loginUser = result;

        const no = loginUser.no;
        const id = loginUser.id;
        const password = loginUser.password;
        const email = loginUser.email;
        const phone = loginUser.phone;
        const address = loginUser.address;
        const nickname = loginUser.nickname;

        output += '<form method="POST">';
        output += '<input type="hidden" id="user_no" autocomplete="off" value="' + no + '">';
        output += '<input type="text" id="id" name="id" autocomplete="off" value="' + id + '" placeholder="id" readonly>';
        output += '<input type="text" id="password" name="password" autocomplete="off" placeholder="password">';
        output += '<input type="text" id="email" name="email" autocomplete="off" value="' + email + '" placeholder="email" readonly>';
        output += '<input type="text" id="phone" name="phone" autocomplete="off" value="' + phone + '" onfocus="this.value=``" onblur="phoneNullCheck(' + phone + ')" placeholder="phone">';
        output += '<input type="text" id="address" name="address" autocomplete="off" value="' + address + '" onfocus="this.value=``" onblur="phoneNullCheck(' + address + ')" placeholder="address">';
        output += '<input type="text" id="nickname" name="nickname" autocomplete="off" value="' + nickname + '" onfocus="this.value=``" onblur="phoneNullCheck(' + nickname + ')" placeholder="address">';
        output += '<input type="button" value="정보수정" onclick="update()">';
        output += '</form>'

        box.innerHTML = output;
    })
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
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">'
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
            output += '<td onclick="location.href=`/boardDetail/' + b_no + '`" style="cursor: pointer">' + bc_content + '</td>';
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