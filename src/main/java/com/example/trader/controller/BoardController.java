package com.example.trader.controller;

import com.example.trader.board.Board;
import com.example.trader.board.BoardDto;
import com.example.trader.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RestController
public class BoardController {

    @Autowired
    private BoardService service;


    //Create
    @PostMapping("/v1/create/board")
    public void createboard(@RequestBody BoardDto boardDto){
        service.createBoard(boardDto);
    }

    //getBoard
    @GetMapping("/v1/search/board")
    public Board getBoard(@RequestParam int b_no){
        Board board = service.readBoardByB_no(b_no);
        return board;
    }

}
