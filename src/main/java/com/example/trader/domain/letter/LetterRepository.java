package com.example.trader.domain.letter;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LetterRepository extends JpaRepository<Letter, Integer> {

    @Query(value = "SELECT * FROM letter WHERE user_no = ? AND p_no = ?", nativeQuery = true)
    public List<Letter> findByUser_noAndP_no(int user_no, int p_no);
}
