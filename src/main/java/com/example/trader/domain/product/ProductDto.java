package com.example.trader.domain.product;

import com.example.trader.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductDto extends Timestamp {

    private int p_no;
    private int user_no;
    private int other_no;
    private String p_title;
    private String p_content;
    private String category;
    private String p_check;
    private String img_url;
    private String p_type;

}
