package com.example.trader.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String index(){
        return "index";
    }

    @RequestMapping(path = "/join", method = RequestMethod.GET)
    public String join(){
        return "join";
    }

    @RequestMapping(path = "/createBoard", method = RequestMethod.GET)
    public String createBoard() {return "createBoard";}

    @RequestMapping("/product")
    public String product() {
        return "product";
    }
}
