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
    private int user_no;
    private int p_no;
    private String nickname;
    private String l_content;
}
