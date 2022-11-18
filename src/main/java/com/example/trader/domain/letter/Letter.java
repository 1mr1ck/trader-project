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
    private int user_no;
    private int p_no;
    private String nickname;
    private String l_content;

    public Letter(LetterDto letterDto) {
        this.user_no = letterDto.getUser_no();
        this.p_no = letterDto.getP_no();
        this.nickname = letterDto.getNickname();
        this.l_content = letterDto.getL_content();
    }

    // update용 setter
    public void setLetter(LetterDto letterDto) {
        this.l_content = letterDto.getL_content();
    }
}
