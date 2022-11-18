package com.example.trader.domain.b_comment.service;

import com.example.trader.domain.product.Product;
import com.example.trader.domain.product.ProductDto;
import com.example.trader.domain.product.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.sound.sampled.Port;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ProductService {

    @Autowired
    private ProductRepository repository;

    // Controller -> CRUD Method
    // Create
    public void createProduct(ProductDto productDto) {
        Product product = new Product(productDto);
        repository.save(product);
    }

    // Read
    public Product readProductByP_no(int p_no) {
        Product product = repository.findById(p_no).orElseThrow(
            () -> new IllegalArgumentException("상품을 찾지 못했습니다.")
        );
        return product;
    }

    public  List<Product> findProductUserNo(int user_no){
        return repository.findByUserNo(user_no);
    }

    public List<Product> readProductAll() {
        return repository.findAll();
    }

    // Update
    @Transactional
    public void updateProduct(ProductDto productDto) {
        Product product = readProductByP_no(productDto.getP_no());
        if(product != null)
            product.setProduct(productDto);
    }

    // Delete
    @Transactional
    public void deleteProduct(int p_no) {
        repository.deleteById(p_no);
    }

    // Search By Category And P_type And Keyword
    @Transactional
    public List<Product> searchProductByCategoryAndP_typeAndKeyword(String category, String p_type, String keyword) {
        if(category.equals("전체"))
            category = "";
        if(p_type.equals("전체"))
            p_type = "";
        if(keyword.equals("전체"))
            keyword = "";
        category = "%" + category + "%";
        p_type = "%" + p_type + "%";
        keyword = "%" + keyword + "%";
        return repository.findByCategoryAndP_typeAndKeyword(category, p_type, keyword);
    }
}
