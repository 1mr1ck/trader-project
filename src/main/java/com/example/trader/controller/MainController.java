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
    @RequestMapping(path = "/login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(path = "/myPage", method = RequestMethod.GET)
    public String myPage(){
        return "myPage";
    }
    @RequestMapping(path = "/userUpdate", method = RequestMethod.GET)
    public String userUpdate(){
        return "userUpdate";
    }
    @RequestMapping(path = "/userDelete", method = RequestMethod.GET)
    public String userDelete(){
        return "userDelete";
    }
    @RequestMapping(path = "/userTrader", method = RequestMethod.GET)
    public String userTrader(){
        return "userTrader";
    }

    @RequestMapping(path = "/userBoard", method = RequestMethod.GET)
    public String userBoard(){
        return "userBoard";
    }

    @RequestMapping(path = "/userComment", method = RequestMethod.GET)
    public String userComment(){
        return "userComment";
    }

    @RequestMapping(path = "/board", method = RequestMethod.GET)
    public String board() {return "board";}

    @RequestMapping(path = "/createBoard", method = RequestMethod.GET)
    public String createBoard() {return "createBoard";}

    @RequestMapping("/product")
    public String product() {
        return "product";
    }

    @RequestMapping("/createProduct")
    public String createProduct() {
        return "createProduct";
    }


}
