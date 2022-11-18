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

    private String user_nickname;

    private String bc_content;

}
