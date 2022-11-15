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
}
