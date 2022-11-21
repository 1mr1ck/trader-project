package com.example.trader.domain.product;

import com.example.trader.service.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Table(name="product")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product extends Timestamp {

    @Id
    private int p_no;
    private int user_no;
    private int other_no;
    private String p_title;
    private String p_content;
    private String category;
    private String p_check;
    private String img_url;
    private String p_type;
    private String nickname;
    private int price;

    public Product(ProductDto productDto) {
        this.user_no = productDto.getUser_no();
        this.other_no = productDto.getOther_no();
        this.p_title = productDto.getP_title();
        this.p_content = productDto.getP_content();
        this.category = productDto.getCategory();
        this.p_check = productDto.getP_check();
        this.img_url = productDto.getImg_url();
        this.p_type = productDto.getP_type();
        this.nickname = productDto.getNickname();
        this.price = productDto.getPrice();
    }

    // update용 setter
    public void setProduct(ProductDto productDto) {
        this.p_title = productDto.getP_title();
        this.p_content = productDto.getP_content();
        this.category = productDto.getCategory();
        this.img_url = productDto.getImg_url();
        this.price = productDto.getPrice();
    }

    // update p_check용 setter
    public void setProductP_check(ProductDto productDto) {
        this.other_no = productDto.getOther_no();
        this.p_check = productDto.getP_check();
    }
}
