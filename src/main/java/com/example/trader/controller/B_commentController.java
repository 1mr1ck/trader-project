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

    // Create
    // 댓글 생성
    @PostMapping("/b_comment/board/{b_no}")
    public List<B_comment> create(@PathVariable int b_no, @RequestBody B_commentDto b_commentDto) {
        return b_commentService.createB_comment(b_no, b_commentDto);
    }

    // Read
    // 그 게시글의 댓글 전체 불러오기
    @GetMapping("/b_comment/board/{b_no}")
    public List<B_comment> commentsByB_no(@PathVariable int b_no) {
        // 결과 응답
        System.out.println(b_no);
        return b_commentService.commentsByB_no(b_no);
    }

    // 하나의 유저의 댓글 전체 불러오기
    @GetMapping("/b_comment/user/{user_no}")
    public List<B_comment> commentsByUser_no(@PathVariable int user_no) {
        return b_commentService.commentsByUser_no(user_no);
    }


    // 댓글 수정
    @PostMapping("/b_comment/{bc_no}/update")
    public void update(@PathVariable int bc_no, @RequestBody B_commentDto b_commentDto) {
        b_commentService.update(bc_no, b_commentDto);
    }

    // 댓글 삭제
    @DeleteMapping("/b_comment/{bc_no}/delete")
    public void delete(@PathVariable int bc_no) {
        b_commentService.delete(bc_no);
    }
}
