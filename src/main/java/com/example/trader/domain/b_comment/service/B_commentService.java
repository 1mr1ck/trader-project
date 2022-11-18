package com.example.trader.domain.b_comment.service;

import com.example.trader.domain.b_comment.B_comment;
import com.example.trader.domain.b_comment.B_commentDto;
import com.example.trader.domain.b_comment.B_commentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
@RequiredArgsConstructor
public class B_commentService {

    @Autowired
    private B_commentRepository b_commentRepository;


    // 댓글 생성
    public List<B_comment> createB_comment(int b_no, B_commentDto b_commentDto) {
        B_comment b_comment = B_comment.createB_comment(b_commentDto);
        b_commentRepository.save(b_comment);
        List<B_comment> b_commentList = b_commentRepository.findByB_no(b_no);
        return b_commentList;
    }

    // 그 게시글의 댓글 전체 불러오기
    public List<B_comment> commentsByB_no(int b_no) {
        List<B_comment> b_commentEntityList = b_commentRepository.findByB_no(b_no);
        if(b_commentEntityList != null) {
            return b_commentEntityList;
        }

        return null;
    }

    // 한 유저의 댓글 전체 불러오기
    public List<B_comment> commentsByUser_no(int user_no) {
        List<B_comment> b_commentEntityList = b_commentRepository.findByUser_no(user_no);
        if(b_commentEntityList != null) {
            return b_commentEntityList;
        }

        return null;
    }

    // 댓글 업데이트
    @Transactional
    public void update(int bc_no, B_commentDto b_commentDto) {
        B_comment b_comment = b_commentRepository.findByBc_no(bc_no);
        if(b_comment != null) {
            b_comment.setB_comment(b_commentDto);
        }
    }

    // 댓글 삭제
    @Transactional
    public void delete(int bc_no) {
        B_comment b_comment = b_commentRepository.findByBc_no(bc_no);
        if(b_comment != null) {
            b_commentRepository.delete(b_comment);
        }
    }
}
