package com.example.trader.domain.p_comment;

import com.example.trader.service.util.Timestamp;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="p_comment")
@Entity
@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class P_comment extends Timestamp {

    @Id
    private int pc_no;

    private int p_no;

    private int user_no;

    private String user_nickname;
    private String pc_content;

    public static P_comment createB_comment(P_commentDto p_commentDto) {
        P_comment p_comment = new P_comment();
        p_comment.setP_no(p_commentDto.getP_no());
        p_comment.setPc_no(p_commentDto.getPc_no());
        p_comment.setUser_no(p_commentDto.getUser_no());
        p_comment.setUser_nickname(p_commentDto.getUser_nickname());
        p_comment.setPc_content(p_commentDto.getPc_content());

        return p_comment;
    }

    public void setB_comment(P_commentDto p_commentDto) {
        this.pc_content = p_commentDto.getPc_content();
    }
}
