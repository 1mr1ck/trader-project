package com.example.trader.controller;

import com.example.trader.domain.user.User;
import com.example.trader.domain.user.UserDto;
import com.example.trader.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequiredArgsConstructor
@RestController
public class UserController {

    @Autowired
    private UserService service;
    @PostMapping("/join/joinUser")
    public User JoinUser(@RequestBody UserDto userDto){
        User result = service.createUser(userDto);

        return result;
    }

    @PostMapping("/login/loginProc")
    public String loginUser(@RequestParam String id, @RequestParam String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
        User login = service.readUserByIdAndPassword(id, password);
        HttpSession session = request.getSession();

        if(login != null){
            session.setAttribute("log",id);
            String sRedirect_uri="/";
            response.sendRedirect(sRedirect_uri);
        } else {
            String fRedirect_uri="/login";
            response.sendRedirect(fRedirect_uri);
        }
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        session.removeAttribute("log");
        String sRedirect_uri="/";
        response.sendRedirect(sRedirect_uri);
        return "logout";
    }
}
