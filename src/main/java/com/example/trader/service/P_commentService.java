package com.example.trader.service;

import com.example.trader.domain.p_comment.P_comment;
import com.example.trader.domain.p_comment.P_commentDto;
import com.example.trader.domain.p_comment.P_commentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@RequiredArgsConstructor
@Service
public class P_commentService {

    @Autowired
    private P_commentRepository p_commentRepository;

    // Create
    // 생성
    public P_comment createP_comment(int p_no, P_commentDto p_commentDto) {
        P_comment p_comment = P_comment.createB_comment(p_commentDto);

        return p_commentRepository.save(p_comment);
    }

    // Read
    // 그 글의 댓글 목록 조회
    public List<P_comment> commentsByP_no(int p_no) {
        List<P_comment> p_commentEntityList = p_commentRepository.findByP_no(p_no);
        return p_commentEntityList;
    }

    // 한 유저의 댓글 목록 조회
    public List<P_comment> commentsByUser_no(int user_no) {
        List<P_comment> p_commentEntityList = p_commentRepository.findByUser_no(user_no);
        return p_commentEntityList;
    }

    // Update
    // 수정
    @Transactional
    public void update(int pc_no, P_commentDto p_commentDto) {
        P_comment p_comment = p_commentRepository.findByPc_no(pc_no);

        if(p_comment != null) {
            p_comment.setB_comment(p_commentDto);
        }
    }

    // Delete
    // 삭제
    @Transactional
    public void delete(int pc_no) {
        P_comment p_comment = p_commentRepository.findByPc_no(pc_no);

        if(p_comment != null) {
            p_commentRepository.delete(p_comment);
        }
    }

}
