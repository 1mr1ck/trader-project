package com.example.trader.domain.b_comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface B_commentRepository extends JpaRepository<B_comment, Integer> {

    @Query(value = "SELECT * FROM b_comment WHERE b_no = ?", nativeQuery = true)
    public List<B_comment> findByB_no(int b_no);

    @Query(value = "SELECT * FROM b_comment WHERE bc_no = ?", nativeQuery = true)
    public B_comment findByBc_no(int bc_no);
}
