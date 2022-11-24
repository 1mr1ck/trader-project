package com.example.trader.domain.product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT * FROM product WHERE category LIKE ? AND p_type LIKE ? AND p_title LIKE ? ORDER BY mod_date DESC", nativeQuery = true)
    public Page<Product> findByCategoryAndP_typeAndKeyword(String category, String p_type, String keyword, Pageable pageable);

    @Query(value = "SELECT * FROM product WHERE user_no = ? AND p_type LIKE ? AND p_check LIKE ? ORDER BY mod_date DESC", nativeQuery = true)
    public List<Product> findByUser_noAndP_typeAndP_check(int user_no, String p_type, String p_check);

    @Query(value = "SELECT * FROM product WHERE user_no=?", nativeQuery = true)
    public List<Product> findByUserNo(int no);

    @Query(value = "SELECT * FROM product WHERE user_no = ? AND p_type LIKE ? AND p_check LIKE ? ORDER BY mod_date DESC", nativeQuery = true)
    public Page<Product> pageingFindByUserNo(int user_no, String p_type, String p_check, Pageable pageable);

    @Query(value = "SELECT * FROM product ORDER BY mod_date DESC", nativeQuery = true)
    public List<Product> findAll_DESC();
}
