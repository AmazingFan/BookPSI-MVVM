package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.RoleUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleUserDAO extends JpaRepository<RoleUser,Integer> {
    List<RoleUser> findAllByUserid(int userid);
    void deleteAllByUserid(int userid);


}
