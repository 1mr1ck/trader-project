function productSearch() {
    $('.title').empty();
    $('.container').empty();

    let category = $('#category').val();
    let p_type = $('#p_type').val();
    let keyword = $('#keyword').val();
    
    if(keyword === "")
        keyword = "전체"

    let settings = {
        "url": "http://localhost:8080/v1/search/product/category/" + category + "/p_type/" + p_type + "/keyword/" + keyword,
        "method": "GET",
        "timeout": 0,
        "headers": {
            "Authorization": "KakaoAK f311a885f3d384727233750637411113"
        },
    };

    $.ajax(settings).done(function (response) {
        console.log(response);

        const list = response;

        $('.title').append(
            `<tr>
				<th>이미지</th>
				<th>제목</th>
				<th>카테고리</th>
				<th>판매/구매</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>수정날짜</th>
			</tr>`
        );

        list.forEach(e => {
            const p_no = e.p_no;
            const img_url = e.img_url;
            const p_title = e.p_title;
            const category = e.category;
            const p_type = e.p_type;
            const nickname = e.nickname;
            const regStr = e.regDate;
            const p_regDate = regStr.substring(0, 10);
            const modStr = e.modDate;
            const p_modDate = modStr.substring(0, 10);

            $('.container').append(
                `<tr>
					<td><img src="${img_url}" style="width: 100px; height: 100px;"></td>
					<td><a href="productView/${p_no}">${p_title}</a></td>
					<td>${category}</td>
					<td>${p_type}</td>
					<td>${nickname}</td>
					<td>${p_regDate}</td>
					<td>${p_modDate}</td>
				</tr>`
            );
        });
    });
}