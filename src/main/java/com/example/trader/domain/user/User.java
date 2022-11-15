package com.example.trader.domain.user;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@NoArgsConstructor
@Table(name="user")
@Entity
@Getter
public class User {

    @Id
    private int no;
    private String id;
    private String password;
    private String email;
    private String phone;
    private String address;
    private String nickname;
    private String token;

    public User(UserDto userDto){
        this.no = userDto.getNo();
        this.id = userDto.getId();
        this.password = userDto.getPassword();
        this.email = userDto.getEmail();
        this.phone = userDto.getPhone();
        this.address = userDto.getAddress();
        this.nickname = userDto.getNickname();
    }
}
