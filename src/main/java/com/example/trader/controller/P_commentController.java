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

    // Create
    // 생성
    @PostMapping("/p_comment/product/{p_no}")
    private List<P_comment> create(@PathVariable int p_no, @RequestBody P_commentDto p_commentDto) {
        return p_commentService.createP_comment(p_no, p_commentDto);
    }

    // Read
    // 그 글의 목록 조회
    @PostMapping("/p_comments/product/{p_no}")
    private List<P_comment> commentsByP_no(@PathVariable int p_no) {
        return p_commentService.commentsByP_no(p_no);
    }

    // 한 유저의 목록 조회
    @GetMapping("/p_comment/user/{user_no}")
    private List<P_comment> commentsByUser_no(@PathVariable int user_no) {
        return p_commentService.commentsByUser_no(user_no);
    }

    // Update
    // 수정
    @PostMapping("/p_comment/{pc_no}/update")
    private List<P_comment> update(@PathVariable int pc_no, @RequestBody P_commentDto p_commentDto) {
        p_commentService.update(pc_no, p_commentDto);

        return null;
    }

    // Delete
    // 삭제
    @PostMapping("/p_comment/product/{p_no}/{pc_no}/delete")
    private List<P_comment> delete(@PathVariable int p_no, @PathVariable int pc_no) {
        List<P_comment> p_commentList = p_commentService.delete(p_no, pc_no);

        return p_commentList;
    }
}
