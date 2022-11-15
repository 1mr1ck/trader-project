package com.example.trader.controller;

import com.example.trader.domain.product.ProductDto;
import com.example.trader.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class ProductController {

    @Autowired
    private ProductService service;

    // Create
    @PostMapping("/v1/create/product")
    public void createProduct(@RequestBody ProductDto productDto) {
        service.createProduct(productDto);
    }

    // GetProduct
//    @GetMapping("/v1/search/product")
}
