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

    @RequestMapping(path = "/join/joinUser", method = RequestMethod.POST)
    public String joinUser(){ return "joinUser"; }
}
