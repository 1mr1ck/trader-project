package com.example.trader.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@NoArgsConstructor
@Table(name="board")
@Entity
@Getter
@Setter
@AllArgsConstructor
public class Board extends Timestamp{

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
}