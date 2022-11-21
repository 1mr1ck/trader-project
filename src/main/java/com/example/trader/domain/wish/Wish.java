package com.example.trader.domain.wish;

import com.example.trader.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wish")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class Wish extends Timestamp {

    @Id
    private int w_no;

    private int p_no;

    private int user_no;

    private String p_title;

    public static Wish createWish(WishDto wishDto) {
        Wish wish = new Wish();
        wish.setW_no(wishDto.getW_no());
        wish.setP_no(wishDto.getP_no());
        wish.setUser_no(wishDto.getUser_no());
        wish.setP_title(wishDto.getP_title());

        return wish;
    }
}
