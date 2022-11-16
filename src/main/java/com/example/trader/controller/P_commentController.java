package com.example.trader.controller;

import com.example.trader.domain.p_comment.P_comment;
import com.example.trader.domain.p_comment.P_commentDto;
import com.example.trader.service.P_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class P_commentController {

    @Autowired
    private P_commentService p_commentService;

    // 전체 조회
    @GetMapping("/product/{p_no}/p_comments")
    private List<P_comment> commentsByP_no(@PathVariable int p_no) {
        System.out.println(p_no);
        return p_commentService.comments(p_no);
    }

    // 생성
    @PostMapping("/product/{p_no}/p_comments")
    private P_comment create(@PathVariable int p_no, @RequestBody P_commentDto p_commentDto) {
        return p_commentService.createP_comment(p_no, p_commentDto);
    }
}
