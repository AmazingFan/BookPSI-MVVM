package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.RoleMenuDAO;
import com.yf.bookpsi.pojo.RoleMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class RoleMenuService {
    @Autowired
    RoleMenuDAO RoleMenuDAO;

    public List<RoleMenu> findAllByRoleid(int rid) {
        return RoleMenuDAO.findAllByRoleid(rid);
    }

    @Modifying
    @Transactional
    public void deleteAllByRid(int rid) {
        RoleMenuDAO.deleteAllByRoleid(rid);
    }

    public void save(RoleMenu rm) {
        RoleMenuDAO.save(rm);
    }
}
