package com.example.trader.controller;

import com.example.trader.domain.b_comment.B_comment;
import com.example.trader.domain.b_comment.B_commentDto;
import com.example.trader.service.B_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class B_commentController {

    @Autowired
    private B_commentService b_commentService;

    // 그 게시글의 댓글 전체 불러오기
    @GetMapping("/board/{b_no}/b_comments")
    public List<B_comment> commentsByB_no(@PathVariable int b_no) {
        // 결과 응답
        System.out.println(b_no);
        return b_commentService.comments(b_no);
    }

    // 댓글 생성
    @PostMapping("/board/{b_no}/b_comments")
    public B_comment create(@PathVariable int b_no, @RequestBody B_commentDto b_commentDto) {
        return b_commentService.createB_comment(b_no, b_commentDto);
    }

    // 댓글 수정
    @PostMapping("/b_comments/{bc_no}/update")
    public void update(@PathVariable int bc_no, @RequestBody B_commentDto b_commentDto) {
        b_commentService.update(bc_no, b_commentDto);
    }

    // 댓글 삭제
    @DeleteMapping("/b_comments/{bc_no}/delete")
    public void delete(@PathVariable int bc_no) {
        b_commentService.delete(bc_no);
    }
}
