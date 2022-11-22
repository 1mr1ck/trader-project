package com.example.trader.domain.board;

import com.example.trader.domain.p_comment.P_comment;
import com.example.trader.domain.product.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {

    @Query(value = "SELECT * FROM board WHERE user_no=?", nativeQuery = true)
    public List<Board> findBoardByUserNo(int no);

    @Query(value = "SELECT * FROM board ORDER BY mod_date DESC", nativeQuery = true)
    public List<Board> findAll_DESC();
    
}


