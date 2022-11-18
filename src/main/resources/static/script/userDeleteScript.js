function userDelete(){
    let no = document.getElementById("no").value;
    var settings = {
        "url": "userDelete/userDeleteProc",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "no": no
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });

    location.href="/myPage";
}