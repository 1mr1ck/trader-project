package com.example.trader.service;

import com.example.trader.domain.board.Board;
import com.example.trader.domain.board.BoardRepository;
import com.example.trader.domain.product.Product;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.trader.domain.board.BoardDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@RequiredArgsConstructor
@Service
public class BoardService {

    @Autowired
    private BoardRepository repository;

    //Create
    public void createBoard(BoardDto boardDto){
        Board board = new Board(boardDto);
        repository.save(board);
    }

    //Read
    public Board readBoardByB_no(int b_no){
        Board board = repository.findById(b_no).orElseThrow(
                () -> new IllegalArgumentException("사용자를 찾지 못했습니다.")
        );
        return board;
    }

    public List<Board> readBoardAll() {
        return repository.findAll();
    }

    //Update
    @Transactional
    public void updateBoard(BoardDto boardDto){
        Board board = readBoardByB_no(boardDto.getB_no());
        if(board != null){
            board.setBoard(boardDto);
        }
    }

    //Delete
    @Transactional
    public void deleteBoard(int b_no) {repository.deleteById(b_no);}
}
