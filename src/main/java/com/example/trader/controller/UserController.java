package com.example.trader.controller;

import com.example.trader.domain.user.User;
import com.example.trader.domain.user.UserDto;
import com.example.trader.domain.user.UserRepository;
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

    @Autowired
    private UserRepository repository;

    // join
    @PostMapping("/join/joinUser")
    public User JoinUser(@RequestBody UserDto userDto){
        User result = service.createUser(userDto);

        return result;
    }

    // login
    @PostMapping("/login/loginProc")
    public String loginUser(@RequestParam String id, @RequestParam String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
        User login = service.readUserByIdAndPassword(id, password);
        User user = repository.findUserByid(id);
        HttpSession session = request.getSession();

        if(login != null){
            session.setAttribute("log",id);
            session.setAttribute("id",id);
            session.setAttribute("nickname", user.getNickname());
            session.setAttribute("no", user.getNo());
            session.setAttribute("password", user.getPassword());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("address", user.getAddress());
            String sRedirect_uri="/";
            response.sendRedirect(sRedirect_uri);
        } else {
            String fRedirect_uri="/login";
            response.sendRedirect(fRedirect_uri);
        }
        return "login";
    }

    // logout
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        session.removeAttribute("log");
        String sRedirect_uri="/";
        response.sendRedirect(sRedirect_uri);
        return "logout";
    }

    // update
    @PostMapping("/userUpdate/UpdateProc")
    public void userUpdate(@RequestBody UserDto userDto, HttpServletResponse response) throws IOException {
        service.userUpdate(userDto);
        String sRedirect_uri="/";
        response.sendRedirect(sRedirect_uri);
    }

    // delete
    @PostMapping("/userDelete/userDeleteProc")
    public void userDelete(@RequestBody UserDto userDto){
        service.deleteUser(userDto.getNo());
    }

    // idCheck
    @PostMapping("/idCheck")
    public String userIdCheck(@RequestParam String id){

        String idCheck = "Y";



        return idCheck;
    }

    @PostMapping("/nicknameCheck")
    public String userNicknameCheck(@RequestParam String nickname){
        String nicknameCheck = "Y";

        return nicknameCheck;

    }

}
