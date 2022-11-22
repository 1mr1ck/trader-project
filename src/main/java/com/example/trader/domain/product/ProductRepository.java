package com.example.trader.domain.product;

import com.example.trader.domain.board.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT * FROM product WHERE category LIKE ? AND p_type LIKE ? AND p_title LIKE ? ORDER BY mod_date DESC", nativeQuery = true)
    public List<Product> findByCategoryAndP_typeAndKeyword(String category, String p_type, String keyword);

    @Query(value = "SELECT * FROM product WHERE user_no = ? AND p_type LIKE ? AND p_check LIKE ? ORDER BY mod_date DESC", nativeQuery = true)
    public List<Product> findByUser_noAndP_typeAndP_check(int user_no, String p_type, String p_check);

    @Query(value = "SELECT * FROM product WHERE user_no=?", nativeQuery = true)
    public List<Product> findByUserNo(int no);

    @Query(value = "SELECT * FROM product ORDER BY mod_date DESC", nativeQuery = true)
    public List<Product> findAll_DESC();
}
