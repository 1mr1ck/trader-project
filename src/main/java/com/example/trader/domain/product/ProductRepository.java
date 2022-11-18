package com.example.trader.domain.product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT * FROM product WHERE category LIKE ? AND p_type LIKE ? AND p_title LIKE ?", nativeQuery = true)
    public List<Product> findByCategoryAndP_typeAndKeyword(String category, String p_type, String keyword);

    @Query(value = "SELECT * FROM product WHERE user_no=?", nativeQuery = true)
    public List<Product> findByUserNo(int no);
}
