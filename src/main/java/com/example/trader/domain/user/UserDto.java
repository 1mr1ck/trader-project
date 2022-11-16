package com.example.trader.domain.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

    private int no;
    private String id;
    private String password;
    private String email;
    private String phone;
    private String address;
    private String nickname;
    private String token;

    public UserDto(String id, String password, String email, String phone, String address, String nickname){
        this.id = id;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.nickname = nickname;
    }

}
