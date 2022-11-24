package com.example.trader.controller;

import com.example.trader.domain.board.Board;
import com.example.trader.domain.board.BoardDto;
import com.example.trader.service.B_commentService;
import com.example.trader.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RestController
public class BoardController {

    @Autowired
    private BoardService service;

    @Autowired
    private B_commentService b_commentService;
    private int b_no;


    //Create
    @PostMapping("/v1/write/board")
    public void writeBoard(@RequestBody BoardDto boardDto){
        service.createBoard(boardDto);
    }

    @GetMapping("/boardDetail/{b_no}")
    public ModelAndView SearchTotalPageviews1(@PathVariable int b_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("boardDetail");
        modelAndView.addObject("response", getBoard(b_no));
        modelAndView.addObject("comments", b_commentService.commentsByB_no(b_no));
        return modelAndView;
    }

    // 1user userNo board
    @PostMapping("/myPage/boardUser")
    public List<Board> BoardUserNo(@RequestParam String user_no){
        int no = Integer.parseInt(user_no);
        return service.findBoardUserNo(no);
    }
   // update
    @GetMapping("/boardUpdate/{b_no}")
    public ModelAndView SearchTotalPageviews2(@PathVariable int b_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("boardUpdate");
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
    public ModelAndView SearchTotalPageviews(@PageableDefault(size=2, sort="mod_date", direction = Sort.Direction.DESC) Pageable pageable) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("boardView");
        modelAndView.addObject("response", getBoardAll(pageable).getContent());
        modelAndView.addObject("totalPage", getBoardAll(pageable).getTotalPages());
        return modelAndView;
    }

    @PostMapping("/boardView/pageNum/{pageNum}")
    public Page<Board> boardList(@PathVariable int pageNum, @PageableDefault(size=2, sort="mod_date", direction = Sort.Direction.DESC) Pageable pageable) {
        return service.boardByPage(pageable.withPage(pageNum));
    }

    //getBoardAll
    @GetMapping("/v1/search/boardAll")
    public Page<Board> getBoardAll (@PageableDefault(size=10, sort="mod_date", direction = Sort.Direction.DESC) Pageable pageable) throws IOException {
        return service.readBoardAll(pageable);
    }

    //post
    //updateBoard
    @PostMapping("/v1/update/board/")
    public void updateBoard(@RequestBody BoardDto boardDto){
        service.updateBoard(boardDto);
    }



    //deleteBoard
    @GetMapping("/v1/delete/board")
    public void deleteBoard(int b_no , HttpServletResponse response) throws IOException {
        service.deleteBoard(b_no);

        String sRedirect_uri="/boardView";
        response.sendRedirect(sRedirect_uri);
    }

}
