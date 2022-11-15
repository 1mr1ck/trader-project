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

    public User createUser(UserDto userDto){
        User user = new User(userDto);

        return repository.save(user);
    }
}
