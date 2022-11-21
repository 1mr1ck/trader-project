package com.example.trader.controller;

import com.example.trader.domain.wish.Wish;
import com.example.trader.domain.wish.WishDto;
import com.example.trader.service.WishService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class WishController {

    @Autowired
    private WishService wishService;

    // 생성
    @PostMapping("/product/wish/{p_no}/{user_no}")
    public Wish clickWish(@RequestBody WishDto wishDto) {
        return wishService.create(wishDto);
    }

    // 하나의 위시 가져오기
    @PostMapping("/wish/{p_no}/{user_no}")
    public Wish readWish(@PathVariable int p_no, @PathVariable int user_no) {
        return wishService.readWish(p_no, user_no);
    }

    // 한 유저의 좋아요 목록 다 가져오기
    @PostMapping("/wish/{user_no}")
    public List<Wish> readWishByUserNo(@PathVariable int user_no) {
        return wishService.readWishByUser_no(user_no);
    }

    // 게시글의 위시목록 가져오기
    @PostMapping("/product/{p_no}/wish")
    public List<Wish> readWishByP_no(@PathVariable int p_no) {
        return wishService.readWishByP_no(p_no);
    }

    // 삭제
    @PostMapping("/product/wish/{w_no}/delete")
    public void deleteWish(@PathVariable int w_no) {
        wishService.delete(w_no);
    }
}
