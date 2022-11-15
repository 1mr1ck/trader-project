package com.example.trader.board;

import com.example.trader.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BoardDto extends Timestamp{

    private int b_no;  //PK
    private int user_no;
    private String b_title;
    private String b_content;
    private boolean notice;
}
