package com.example.trader.service;


import com.example.trader.domain.user.User;
import com.example.trader.domain.user.UserDto;
import com.example.trader.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public User readUserByIdAndPassword(String id, String password){
        User result = repository.findUserIdPw(id, password);
        return result;
    }

    // AllUser

    // Update

    // delete
}
