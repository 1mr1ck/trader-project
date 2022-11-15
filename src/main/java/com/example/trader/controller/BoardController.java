package com.example.trader.controller;

import com.example.trader.board.Board;
import com.example.trader.board.BoardDto;
import com.example.trader.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RestController
public class BoardController {

    @Autowired
    private BoardService service;


    //Create
    @PostMapping("/v1/write/board")
    public void writeBoard(@RequestBody BoardDto boardDto){
        service.createBoard(boardDto);
    }

    //getBoard
    @GetMapping("/v1/search/board")
    public Board getBoard(@RequestParam int b_no){
        Board board = service.readBoardByB_no(b_no);
        return board;
    }
    //getBoardAll
    @GetMapping("/v1/search/boardAll")
    public List<Board> getBoardAll(){
        return service.readBoardAll();
    }
    //post
    //updateBoard
    @PostMapping("/v1/update/board")
    public void updateBoard(@RequestBody BoardDto boardDto){
        service.updateBoard(boardDto);
    }

    //post
    //deleteBoard
    @DeleteMapping("/v1/delete/board")
    public void deleteBoard(@RequestParam int b_no){
        service.deleteBoard(b_no);
    }
}
