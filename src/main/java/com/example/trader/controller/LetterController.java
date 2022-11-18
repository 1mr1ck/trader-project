package com.example.trader.controller;

import com.example.trader.domain.letter.Letter;
import com.example.trader.domain.letter.LetterDto;
import com.example.trader.domain.product.Product;
import com.example.trader.service.LetterService;
import com.example.trader.service.ProductService;
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

    // letter chatting list and read p_no
    @GetMapping ("/letterWrite/{p_no}/{user_no}/{other_no}")
    public ModelAndView SearchTotalPageviews(@PathVariable int p_no, @PathVariable int user_no, @PathVariable int other_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("letterWrite");
        Product product = productService.readProductByP_no(p_no);
        modelAndView.addObject("productOfLetter", product);
        List<Letter> letterList = service.readLetterByP_noAndUser_noAndOther_no(p_no, user_no, other_no);
        modelAndView.addObject("myLetterChattingList", letterList);
        return modelAndView;
    }

    // GetLetter
    @GetMapping("/v1/read/letter")
    public Letter getLetter(@RequestParam int l_code) {
        Letter letter = service.readLetterByL_code(l_code);
        return letter;
    }

    // letter chatting list
    @PostMapping("/v1/read/letter/{p_no}/{user_no}/{other_no}")
    public List<Letter> getLetterByP_noAndUser_noAndOther_no(@PathVariable int p_no, @PathVariable int user_no, @PathVariable int other_no) {
        return service.readLetterByP_noAndUser_noAndOther_no(p_no, user_no, other_no);
    }

    // my letter list
    @GetMapping ("/myLetter/{user_no}")
    public ModelAndView SearchTotalPageviews(@PathVariable int user_no) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("letter");
        List<Letter> myLetterList = service.readLetterByUser_no(user_no);
        modelAndView.addObject("myLetterList", myLetterList);
        return modelAndView;
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
