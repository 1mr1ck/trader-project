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

    private String bc_comment;

    public static B_comment toB_comment(B_commentDto b_commentDto) {
        B_comment b_comment = new B_comment();
        b_comment.setBc_no(b_commentDto.getBc_no());
        b_comment.setB_no(b_commentDto.getB_no());
        b_comment.setUser_no(b_commentDto.getUser_no());
        b_comment.setBc_comment(b_commentDto.getBc_comment());

        return b_comment;
    }
}