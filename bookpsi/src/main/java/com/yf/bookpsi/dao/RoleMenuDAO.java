package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.RoleMenu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleMenuDAO extends JpaRepository<RoleMenu,Integer> {
    List<RoleMenu> findAllByRoleid(int roleid);
    void deleteAllByRoleid(int roleid);
}
