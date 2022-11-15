package com.example.trader.domain.b_comment;

import com.example.trader.service.util.Timestamp;
import lombok.*;

import javax.persistence.Id;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class B_commentDto extends Timestamp {

    @Id
    private int bc_no;

    private int b_no;

    private int user_no;

    private String bc_comment;


    public static B_commentDto toB_commentDto(B_comment b_comment) {
        B_commentDto b_commentDto = new B_commentDto();
        b_commentDto.setBc_no(b_comment.getBc_no());
        b_commentDto.setB_no(b_comment.getB_no());
        b_commentDto.setUser_no(b_comment.getUser_no());
        b_commentDto.setBc_comment(b_comment.getBc_comment());

        return b_commentDto;
    }
}
