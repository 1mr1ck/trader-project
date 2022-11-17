let index={
    init:function () {
        $("#btn-delete").on("click", () => {
            this.deleteById();
        });
    },
    deleteById:function (){
        let id = $("#id").text();
        $.ajax({
            type:"DELETE",
            url:"/v1/delete/board",
            dataType:"json"
        }).done(function (resp) {
            alert("삭제 되었습니다.");
            location.href="/";
        }).fail(function (error){
            alert(JSON.stringify(error));
        });
    }
}