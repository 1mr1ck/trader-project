package com.example.trader.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Integer> {

    @Query(value = "SELECT * FROM `user` WHERE `id`=? and `password`=?", nativeQuery = true)
    public User findUserIdPw(String id, String password);

    @Query(value = "SELECT * FROM `user` WHERE `id`=?",nativeQuery = true)
    public User findUserByid(String id);
}
