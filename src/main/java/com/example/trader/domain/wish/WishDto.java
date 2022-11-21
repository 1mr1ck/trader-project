package com.example.trader.domain.wish;

import com.example.trader.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

@Getter @Service
@NoArgsConstructor
@AllArgsConstructor
public class WishDto extends Timestamp {

    private int w_no;

    private int p_no;

    private int user_no;

    private String p_title;
}
