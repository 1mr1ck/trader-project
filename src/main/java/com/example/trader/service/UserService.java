package com.example.trader.service;


import com.example.trader.domain.user.User;
import com.example.trader.domain.user.UserDto;
import com.example.trader.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@RequiredArgsConstructor
@Service
public class UserService {

    @Autowired
    private UserRepository repository;

    // create
    public User createUser(UserDto userDto){
        User user = new User(userDto);

        return repository.save(user);
    }

    // Read
    // 1user
    public User readUserById(int no){
        User user = repository.findById(no).orElseThrow(
                ()-> new IllegalArgumentException("사용자를 찾지 못했습니다")
        );
        return user;
    }

    // 1user id, pw
    public User readUserByIdAndPassword(String id, String password){
        User result = repository.findUserIdPw(id, password);
        return result;
    }

    // AllUser

    // Update
    @Transactional
    public void userUpdate(UserDto userDto){
        User user = readUserById(userDto.getNo());
        if(user != null){
            user.setUser(userDto);
        }
    }

    // delete
    public void deleteUser(int no){
        repository.deleteById(no);
    }
}
