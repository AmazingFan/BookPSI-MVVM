package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuDAO extends JpaRepository<Menu,Integer> {
    Menu findById(int id);
    List<Menu> findAllByParentid(int parentid);
}
