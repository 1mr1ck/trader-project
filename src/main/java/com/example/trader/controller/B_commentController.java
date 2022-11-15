package com.example.trader.controller;

import com.example.trader.domain.b_comment.B_commentDto;
import com.example.trader.service.B_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class B_commentController {

    @Autowired
    private B_commentService b_commentService;

    // 조회
    @GetMapping("/board/{b_no}/comments")
    public List<B_commentDto> commentsByB_no(@PathVariable int b_no) {
        // 결과 응답
        System.out.println(b_no);
        return b_commentService.comments(b_no);
    }

}
