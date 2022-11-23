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

        session.invalidate();
        String sRedirect_uri="/";
        response.sendRedirect(sRedirect_uri);
        return "logout";
    }

    // update
    @PostMapping("/userUpdate/UpdateProc")
    public void userUpdate(@RequestBody UserDto userDto,HttpServletRequest request, HttpServletResponse response) throws IOException {
        service.userUpdate(userDto);
        HttpSession session = request.getSession();


        session.setAttribute("log",userDto.getId());
        session.setAttribute("id",userDto.getId());
        session.setAttribute("nickname", userDto.getNickname());
        session.setAttribute("no", userDto.getNo());
        session.setAttribute("password", userDto.getPassword());
        session.setAttribute("email", userDto.getEmail());
        session.setAttribute("phone", userDto.getPhone());
        session.setAttribute("address", userDto.getAddress());

    }

    // delete
    @PostMapping("/userDelete/userDeleteProc")
    public void userDelete(@RequestBody UserDto userDto, HttpServletRequest request, HttpServletResponse response) throws IOException {

        service.deleteUser(userDto.getNo());
        HttpSession session = request.getSession();
        session.invalidate();
        String sRedirect_uri="/";
        response.sendRedirect(sRedirect_uri);
    }

    // idCheck
    @PostMapping("/idCheck")
    public String userIdCheck(@RequestParam String id){
        String idCheck = "Y";
        User user = repository.findUserByid(id);
        if(user == null) {
            idCheck = "";
        }
        return idCheck;
    }

    @PostMapping("/nicknameCheck")
    public String userNicknameCheck(@RequestParam String nickname){
        String nicknameCheck = "Y";
        User user = repository.findUserNickname(nickname);
        if(user == null){
            nicknameCheck = "";
        }
        return nicknameCheck;
    }

    @PostMapping("/emailCheck")
    public String userEmailCheck(@RequestParam String email){
        String emailCheck = "Y";
        User user = repository.findUserEmail(email);
        if(user == null){
            emailCheck = "";
        }
        return emailCheck;
    }

    // 한명의 회원정보 읽기
    @PostMapping("/user/{user_no}")
    public User readUserByNo(@PathVariable int user_no) {
        return service.readUserById(user_no);
    }
}
