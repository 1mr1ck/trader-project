package com.example.trader.controller;

import com.example.trader.domain.user.User;
import com.example.trader.domain.user.UserDto;
import com.example.trader.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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
}
