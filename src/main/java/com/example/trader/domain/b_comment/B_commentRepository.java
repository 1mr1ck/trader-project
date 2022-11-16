package com.example.trader.domain.b_comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface B_commentRepository extends JpaRepository<B_comment, Integer> {

    // 그 게시판의 댓글 전체목록
    @Query(value = "SELECT * FROM b_comment WHERE b_no = ?", nativeQuery = true)
    public List<B_comment> findByB_no(int b_no);

    // 한 유저의 댓글 전체목록
    @Query(value = "SELECT * FROM b_comment WHERE user_no = ?", nativeQuery = true)
    public List<B_comment> findByUser_no(int user_no);

    // 댓글넘버로 댓글하나 조회
    @Query(value = "SELECT * FROM b_comment WHERE bc_no = ?", nativeQuery = true)
    public B_comment findByBc_no(int bc_no);

}
