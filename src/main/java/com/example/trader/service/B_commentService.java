package com.example.trader.service;

import com.example.trader.domain.b_comment.B_comment;
import com.example.trader.domain.b_comment.B_commentDto;
import com.example.trader.domain.b_comment.B_commentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class B_commentService {

    @Autowired
    private B_commentRepository b_commentRepository;

    public List<B_commentDto> comments(int b_no) {
        List<B_comment> b_commentEntityList = b_commentRepository.findByB_no(b_no);
        List<B_commentDto> b_commentDtoList = new ArrayList<>();
        for(int i=0; i<b_commentEntityList.size(); i++) {
            B_commentDto dto = B_commentDto.toB_commentDto(b_commentEntityList.get(i));
            System.out.println(b_commentEntityList.get(i));
            b_commentDtoList.add(dto);
        }

        return b_commentDtoList;
    }
}
