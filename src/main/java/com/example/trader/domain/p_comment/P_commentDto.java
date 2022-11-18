package com.example.trader.domain.p_comment;

import com.example.trader.domain.b_comment.service.util.Timestamp;
import lombok.*;

import javax.persistence.Id;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class P_commentDto extends Timestamp {

    @Id
    private int pc_no;

    private int p_no;

    private int user_no;

    private String user_nickname;

    private String pc_content;
}
