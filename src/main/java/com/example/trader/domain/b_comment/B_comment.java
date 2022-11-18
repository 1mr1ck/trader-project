package com.example.trader.domain.b_comment;

import com.example.trader.service.util.Timestamp;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="b_comment")
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class B_comment extends Timestamp {

    @Id
    private int bc_no;

    private int b_no;

    private int user_no;

    private String user_nickname;
    private String bc_content;

    public static B_comment createB_comment(B_commentDto b_commentDto) {
        B_comment b_comment = new B_comment();
        b_comment.setB_no(b_commentDto.getB_no());
        b_comment.setUser_no(b_commentDto.getUser_no());
        b_comment.setUser_nickname(b_commentDto.getUser_nickname());
        b_comment.setBc_content(b_commentDto.getBc_content());

        return b_comment;
    }

    public void setB_comment(B_commentDto b_commentDto) {
        this.bc_content = b_commentDto.getBc_content();
    }
}
