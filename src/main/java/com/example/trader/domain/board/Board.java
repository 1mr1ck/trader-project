package com.example.trader.domain.board;

import com.example.trader.service.util.Timestamp;
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

    public Board(BoardDto boardDto){
        this.user_no = boardDto.getUser_no();
        this.b_title = boardDto.getB_title();
        this.b_content = boardDto.getB_content();
        this.notice = boardDto.isNotice();
    }

    //update용 set
    public void setBoard(BoardDto boardDto){
        this.b_title = boardDto.getB_title();
        this.b_content = boardDto.getB_content();
    }

    //set대신용
    public Board(int User_no, String b_title, String b_content) {
        this.user_no = user_no;
        this.b_title = b_title;
        this.b_content = b_content;
    }
}
