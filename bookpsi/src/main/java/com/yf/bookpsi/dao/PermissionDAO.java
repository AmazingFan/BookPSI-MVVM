package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PermissionDAO extends JpaRepository<Permission,Integer> {
    Permission findById(int id);
}
