package com.example.trader.domain.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

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
}
