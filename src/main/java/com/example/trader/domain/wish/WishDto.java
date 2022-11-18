package com.example.trader.domain.wish;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

@Getter @Service
@NoArgsConstructor
@AllArgsConstructor
public class WishDto {

    private int w_no;

    private int p_no;

    private int user_no;
}
