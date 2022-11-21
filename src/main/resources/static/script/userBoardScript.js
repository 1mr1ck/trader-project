function content(){
    const userTbody = document.querySelector('.userBoardTBody');
    let no = document.getElementById('user_no').value;

    var settings = {
        "url": "/myPage/boardUser?user_no=" + no,
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
            let title = e.b_title;
            let content = e.b_content;
            let nickname = e.nickname;
            let modStr = e.modDate;
            let modDate = modStr.substring(0,10);
            let regStr = e.regDate;
            let regDate = regStr.substring(0,10);

            tableBody += '<tr>'
            tableBody += '<td>' + title + '</td>'
            tableBody += '<td>' + content + '</td>'
            tableBody += '<td>' + nickname + '</td>'
            tableBody += '<td>' + modDate + '</td>'
            tableBody += '<td>' + regDate + '</td>'
            tableBody += '</tr>'

            userTbody.innerHTML = tableBody;
        })

    });
}