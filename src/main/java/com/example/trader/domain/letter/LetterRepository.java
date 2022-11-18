package com.example.trader.domain.letter;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LetterRepository extends JpaRepository<Letter, Integer> {

    @Query(value = "SELECT * FROM letter WHERE p_no = ? AND user_no = ? AND other_no", nativeQuery = true)
    public List<Letter> findByP_noAndUser_noAndOther_no(int p_no, int user_no, int other_no);

    @Query(value = "select max(l_code) as l_code from letter where user_no = ? or other_no = ? group by p_no, user_no, other_no order by l_code desc", nativeQuery = true)
    public List<Integer> findByUser_no(int user_no, int other_no);
}
