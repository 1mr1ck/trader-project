package com.example.trader.domain.b_comment.service;

import com.example.trader.domain.letter.Letter;
import com.example.trader.domain.letter.LetterDto;
import com.example.trader.domain.letter.LetterRepository;
import com.example.trader.domain.product.Product;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class LetterService {

    @Autowired
    private LetterRepository repository;

    // Controller -> CRUD Method
    // Create
    public void createLetter(LetterDto letterDto) {
        Letter letter = new Letter(letterDto);
        repository.save(letter);
    }

    // Read
    public Letter readLetterByL_code(int l_code) {
        Letter letter = repository.findById(l_code).orElseThrow(
                () -> new IllegalArgumentException("쪽지를 찾지 못했습니다.")
        );
        return letter;
    }

    public List<Letter> readLetterAll() {
        return repository.findAll();
    }

    // Update
    @Transactional
    public void updateLetter(LetterDto letterDto) {
        Letter letter = readLetterByL_code(letterDto.getL_code());
        if(letter != null)
            letter.setLetter(letterDto);
    }

    // Delete
    @Transactional
    public void deleteLetter(int l_code) {
        repository.deleteById(l_code);
    }

    // Read By P_no And User_no And Other_no
    public List<Letter> readLetterByP_noAndUser_noAndOther_no(int p_no, int user_no, int other_no) {
        return repository.findByP_noAndUser_noAndOther_no(p_no, user_no, other_no);
    }

    // Read P_no By User_no And Other_no
    public List<Letter> readLetterByUser_no(int user_no) {
        return repository.findByUser_no(user_no, user_no);
    }
}
