package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserDAO extends JpaRepository<User,Integer> {
    @Query("select new User(u.id,u.account,u.username,u.realname,u.password,u.phone,u.gender,u.address,u.enabled,u.idcard)from User u")
    List<User> list();

    User findByUsername( String userName);

    User getByUsernameAndPassword(String userName,String passWord);

    void deleteById(int id);




}
