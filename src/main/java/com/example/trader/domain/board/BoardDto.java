package com.example.trader.domain.board;

import com.example.trader.domain.b_comment.service.util.Timestamp;
import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BoardDto extends Timestamp {

    private int b_no;  //PK
    private int user_no;
    private String b_title;
    private String b_content;
    private boolean notice;
    private String nickname;

}
