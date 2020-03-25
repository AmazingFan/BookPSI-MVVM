package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Press;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PressDAO extends JpaRepository<Press,Integer> {
    Press findById(int id);
    void deleteById(int id);
}
