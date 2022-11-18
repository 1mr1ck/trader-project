package com.example.trader.controller;

import com.example.trader.domain.letter.Letter;
import com.example.trader.domain.letter.LetterDto;
import com.example.trader.domain.product.Product;
import com.example.trader.domain.b_comment.service.LetterService;
import com.example.trader.domain.b_comment.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class LetterController {

    @Autowired
    private LetterService service;

    @Autowired
    private ProductService productService;


    // Create
    @PostMapping("/v1/write/letter")
    public void writeLetter(@RequestBody LetterDto letterDto) {
        service.createLetter(letterDto);
    }

    @GetMapping("/letterWrite/{p_no}/{user_no}")
    public ModelAndView SearchTotalPageviews(@PathVariable int p_no, @PathVariable int user_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("letterWrite");
        Product product = productService.readProductByP_no(p_no);
        modelAndView.addObject("productOfLetter", product);
        List<Letter> letterList = service.readLetterByUser_noAndP_no(user_no, p_no);
        modelAndView.addObject("myLetterList", letterList);
        return modelAndView;
    }

    // GetLetter
    @GetMapping("/v1/read/letter")
    public Letter getLetter(@RequestParam int l_code) {
        Letter letter = service.readLetterByL_code(l_code);
        return letter;
    }

    @GetMapping("/v1/read/letter/user_no/{user_no}/p_no/{p_no}")
    public List<Letter> getLetterByUser_noAndP_no(@PathVariable int user_no, @PathVariable int p_no) {
        return service.readLetterByUser_noAndP_no(user_no, p_no);
    }

    // GetLetterAll
    @GetMapping("/v1/read/letterAll")
    public List<Letter> getLetterAll() {
        return service.readLetterAll();
    }

    // UpdateLetter
    @PostMapping("/v1/update/letter")
    public void updateLetter(@RequestBody LetterDto letterDto) {
        service.updateLetter(letterDto);
    }

    // DeleteLetter
    @DeleteMapping("/v1/delete/letter")
    public void deleteLetter(@RequestParam int l_code) {
        service.deleteLetter(l_code);
    }

}
