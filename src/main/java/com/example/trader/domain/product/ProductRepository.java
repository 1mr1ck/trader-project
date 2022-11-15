package com.example.trader.domain.product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product, Integer> {

//    @Query(value = "SELECT * FROM product WHERE p_no = ?", nativeQuery = true)
//    public Product findByP_no(int p_no);
}
