package com.example.trader.service;

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

    @Transactional
    public void updateProductP_check(ProductDto productDto) {
        Product product = readProductByP_no(productDto.getP_no());
        if(product != null)
            product.setProductP_check(productDto);
    }

    // Delete
    @Transactional
    public List<Product> deleteProduct(int p_no, int user_no) {
        repository.deleteById(p_no);
        return repository.findByUserNo(user_no);
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

    @Transactional
    public List<Product> searchProductByUser_noAndP_typeAndP_check(int user_no, String p_type, String p_check) {
        if(p_type.equals("전체"))
            p_type = "";
        if(p_check.equals("전체"))
            p_check = "";
        p_type = "%" + p_type + "%";
        p_check = "%" + p_check + "%";
        return repository.findByUser_noAndP_typeAndP_check(user_no, p_type, p_check);
    }
}
