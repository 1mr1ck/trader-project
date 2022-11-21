package com.example.trader.service;

import com.example.trader.domain.wish.Wish;
import com.example.trader.domain.wish.WishDto;
import com.example.trader.domain.wish.WishRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishService {

    @Autowired
    private WishRepository wishRepository;

    // 좋아요 클릭 서비스
    public Wish create(WishDto wishDto) {
        Wish wish = Wish.createWish(wishDto);
        wishRepository.save(wish);

        return wish;
    }

    public void delete(int w_no) {
        wishRepository.deleteById(w_no);
    }

    public Wish readWish(int p_no, int user_no) {
        return wishRepository.readWish(p_no, user_no);
    }

    public List<Wish> readWishByP_no(int p_no) {
        return wishRepository.readWishByP_no(p_no);
    }

    public List<Wish> readWishByUser_no(int user_no) {
        return wishRepository.readWishByUser_no(user_no);
    }
}