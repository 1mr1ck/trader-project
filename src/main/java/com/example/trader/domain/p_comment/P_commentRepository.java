package com.example.trader.domain.p_comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface P_commentRepository extends JpaRepository<P_comment, Integer> {

    @Query(value = "SELECT * FROM p_comment WHERE p_no = ?", nativeQuery = true)
    public List<P_comment> findByP_no(int p_no);
}
