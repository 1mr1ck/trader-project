package com.example.trader.domain.wish;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface WishRepository extends JpaRepository<Wish, Integer> {

    @Query(value = "SELECT * FROM wish where p_no = ? and user_no = ?", nativeQuery = true)
    public Wish readWish(int p_no, int user_no);

    @Query(value = "SELECT w FROM Wish w where w.p_no = ?", nativeQuery = true)
    public List<Wish> readWishByP_no(int p_no);

    @Query(value = "SELECT w FROM Wish w where w.user_no= :user_no")
    public List<Wish> readWishByUser_no(@Param("user_no") int user_no);
}
