package com.example.trader.controller;

import com.example.trader.domain.board.Board;
import com.example.trader.domain.board.BoardDto;
import com.example.trader.domain.p_comment.P_comment;
import com.example.trader.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
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

    @GetMapping("/boardDetail/{b_no}")
    public ModelAndView SearchTotalPageviews(@PathVariable int b_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("boardDetail");
        modelAndView.addObject("response", getBoard(b_no));
        return modelAndView;
    }
    //getBoard
    @GetMapping("/v1/search/board")
    public Board getBoard(@RequestParam int b_no){
        Board board = service.readBoardByB_no(b_no);
        return board;
    }


    @GetMapping("/boardView")
    public ModelAndView SearchTotalPageviews() throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("boardView");
        modelAndView.addObject("response", getBoardAll());
        return modelAndView;
    }

    //getBoardAll
    @GetMapping("/v1/search/boardAll")
    public List<Board> getBoardAll() {
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
