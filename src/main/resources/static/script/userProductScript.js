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
            let category = e.category;
            let title = e.p_title;
            let content = e.p_content;
            let check = e.p_check;
            let type = e.p_type;

            tableBody += '<tr>'
            tableBody += '<td>' + category + '</td>'
            tableBody += '<td>' + title + '</td>'
            tableBody += '<td>' + content + '</td>'
            tableBody += '<td>' + check + '</td>'
            tableBody += '<td>' + type + '</td>'
            tableBody += '</tr>'

            userTbody.innerHTML = tableBody;
        })

    });
}