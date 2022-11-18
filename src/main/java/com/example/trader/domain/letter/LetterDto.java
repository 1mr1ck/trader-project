package com.example.trader.domain.letter;

import com.example.trader.domain.b_comment.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LetterDto extends Timestamp {

    private int l_code;
    private int p_no;
    private String p_title;
    private int user_no;
    private int other_no;
    private String user_nickname;
    private String other_nickname;
    private String l_content;
    private boolean make;
}
