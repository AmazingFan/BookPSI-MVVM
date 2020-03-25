package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Permission;
import com.yf.bookpsi.pojo.RolePermission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RolePermissionDAO extends JpaRepository<RolePermission,Integer> {
    List<RolePermission> findAllByRoleid(int roleid);
    void deleteAllByRoleid(int roleid);
}
