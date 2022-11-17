package com.example.trader.domain.p_comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface P_commentRepository extends JpaRepository<P_comment, Integer> {

    @Query(value = "SELECT * FROM p_comment WHERE p_no = ? ORDER BY pc_no DESC", nativeQuery = true)
    public List<P_comment> findByP_no(int p_no);

    @Query(value = "SELECT * FROM p_comment WHERE pc_no = ?", nativeQuery = true)
    public P_comment findByPc_no(int pc_no);

    @Query(value = "SELECT p FROM P_comment p WHERE p.user_no = :user_no")
    List<P_comment> findByUser_no(@Param("user_no") int user_no);
}
