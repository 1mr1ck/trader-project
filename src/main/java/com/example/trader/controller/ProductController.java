package com.example.trader.controller;

import com.example.trader.domain.p_comment.P_comment;
import com.example.trader.domain.product.Product;
import com.example.trader.domain.product.ProductDto;
import com.example.trader.service.P_commentService;
import com.example.trader.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class ProductController {

    @Autowired
    private ProductService service;

    @Autowired
    private P_commentService p_commentService;

    // Create
    @PostMapping("/v1/write/product")
    public void writeProduct(@RequestBody ProductDto productDto) {
        service.createProduct(productDto);
    }

    @GetMapping("/productView/{p_no}")
    public ModelAndView SearchTotalPageviews1(@PathVariable int p_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productView");
        modelAndView.addObject("response", getProduct(p_no));
        List<P_comment> p_commentList = p_commentService.commentsByP_no(p_no);
        modelAndView.addObject("comments", p_commentList);
        return modelAndView;
    }

    // GetProduct
    @GetMapping("/v1/search/product")
    public Product getProduct(@RequestParam int p_no) {
        Product product = service.readProductByP_no(p_no);
        return product;
    }

    @GetMapping("/product")
    public ModelAndView SearchTotalPageviews() throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("product");
        modelAndView.addObject("response", getProductAll());
        return modelAndView;
    }

    // ProductUserNo
    @PostMapping("/myPage/productUser")
    public List<Product> ProductUserNo(@RequestParam String user_no){
        int no = Integer.parseInt(user_no);
        return service.findProductUserNo(no);
    }

    // 페이징 처리 메소드
    @PostMapping("/search/product/user_no/{user_no}/p_type/{p_type}/p_check/{p_check}")
    public Page<Product> findByUserNo_page1(@PathVariable int user_no, @PathVariable String p_type, @PathVariable String p_check, @PageableDefault(size=5, sort="mod_date", direction = Sort.Direction.DESC) Pageable pageable) {
        return service.findByUserNo(user_no, p_type, p_check, pageable);
    }

    // 선택한 페이지 리스트
    @PostMapping("/search/product/user_no/{user_no}/p_type/{p_type}/p_check/{p_check}/pageNum/{pageNum}")
    public Page<Product> findByUserNo_pageX(@PathVariable int user_no, @PathVariable String p_type, @PathVariable String p_check, @PageableDefault(size=5, sort="mod_date", direction = Sort.Direction.DESC) Pageable pageable, @PathVariable int pageNum) {

        return service.findByUserNo(user_no, p_type, p_check, pageable.withPage(pageNum));
    }





    // GetProductAll
    @GetMapping("/v1/search/productAll")
    public List<Product> getProductAll() {
        return service.readProductAll();
    }

    // GetProductByCategoryAndP_typeAndKeyword
    @GetMapping("/search/product/category/{category}/p_type/{p_type}/keyword/{keyword}")
    public Page<Product> getProductByCategoryAndP_typeAndKeyword(@PathVariable String category, @PathVariable String p_type, @PathVariable String keyword, @PageableDefault(size=10, sort="mod_date", direction = Sort.Direction.DESC) Pageable pageable) {
        return service.searchProductByCategoryAndP_typeAndKeyword(category, p_type, keyword, pageable);
    }

    // GetProductByUser_noAndP_typeAndP_check
    @PostMapping("/v1/search/product/user_no/{user_no}/p_type/{p_type}/p_check/{p_check}")
    public List<Product> getProductByUser_noAndP_typeAndKeyword(@PathVariable int user_no, @PathVariable String p_type, @PathVariable String p_check) {
        return service.searchProductByUser_noAndP_typeAndP_check(user_no, p_type, p_check);
    }

    // UpdateProduct
    @PostMapping("/v1/update/product")
    public void updateProduct(@RequestBody ProductDto productDto) {
        service.updateProduct(productDto);
    }

    @GetMapping("/productUpdate/{p_no}")
    public ModelAndView SearchTotalPageviews2(@PathVariable int p_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productUpdate");
        modelAndView.addObject("response", getProduct(p_no));
        return modelAndView;
    }

    @PostMapping("/v1/update/product/p_check")
    public void updateProductP_check(@RequestBody ProductDto productDto) {
        service.updateProductP_check(productDto);
    }

    // DeleteProduct
    @PostMapping("/v1/delete/product")
    public List<Product> deleteProduct(@RequestParam int p_no, @RequestParam int user_no) {
        return service.deleteProduct(p_no, user_no);
    }

}
