package com.example.trader.domain.letter;

import com.example.trader.domain.b_comment.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="letter")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Letter extends Timestamp {

    @Id
    private int l_code;
    private int p_no;
    private String p_title;
    private int user_no;
    private int other_no;
    private String user_nickname;
    private String other_nickname;
    private String l_content;
    private boolean make;

    public Letter(LetterDto letterDto) {
        this.p_no = letterDto.getP_no();
        this.p_title = letterDto.getP_title();
        this.user_no = letterDto.getUser_no();
        this.other_no = letterDto.getOther_no();
        this.user_nickname = letterDto.getUser_nickname();
        this.other_nickname = letterDto.getOther_nickname();
        this.l_content = letterDto.getL_content();
        this.make = letterDto.isMake();
    }

    // update용 setter
    public void setLetter(LetterDto letterDto) {
        this.l_content = letterDto.getL_content();
    }
}
