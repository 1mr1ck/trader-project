const login_no = document.getElementById('id').value;

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

        var output = "<div>";
        output += "<table>";
        output += "<tbody>";

        list.forEach(e => {
            const b_no = e.b_no;
            const bc_content = e.bc_content;
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);

            output += '<tr>';
            output += '<td><a href="/boardDetail/"' + b_no + '>' + bc_content + '</td>';
            output += '<td>' + modDate + '</td>';
            output += '</tr>';
        })
        output += '</table>'
        output += '</div>'
    })
}