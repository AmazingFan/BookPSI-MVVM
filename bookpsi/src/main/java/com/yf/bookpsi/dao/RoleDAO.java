package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDAO extends JpaRepository<Role,Integer> {
    Role findById(int id);

    void deleteById(int id);
}
