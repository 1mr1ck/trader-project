package com.example.trader.domain.board;

import com.example.trader.domain.b_comment.service.util.Timestamp;
import lombok.*;

import javax.persistence.*;


@NoArgsConstructor
@Table(name="board")
@Entity
@Getter
@Setter
@AllArgsConstructor
public class Board extends Timestamp {

    @Id
    private int b_no;  //PK
    private int user_no;
    private String b_title;
    private String b_content;
    private boolean notice;
    private String nickname;

    public Board(BoardDto boardDto){
        this.user_no = boardDto.getUser_no();
        this.b_title = boardDto.getB_title();
        this.b_content = boardDto.getB_content();
        this.notice = boardDto.isNotice();
        this.nickname = boardDto.getNickname();
    }

    //update용 set
    public void setBoard(BoardDto boardDto){
        this.b_title = boardDto.getB_title();
        this.b_content = boardDto.getB_content();
    }
}
