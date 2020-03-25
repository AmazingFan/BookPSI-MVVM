package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.RoleUserDAO;
import com.yf.bookpsi.pojo.Role;
import com.yf.bookpsi.pojo.RoleUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class RoleUserService {
    @Autowired
    RoleUserDAO RoleUserDAO;

    public List<RoleUser> listAllByUid(int uid) {
        return RoleUserDAO.findAllByUserid(uid);
    }

    //    @Modifying
    @Transactional
    public void saveRoleChanges(int uid, List<Role> roles) {
        RoleUserDAO.deleteAllByUserid(uid);
        for (Role role : roles) {
            RoleUser ur = new RoleUser();
            ur.setUserid(uid);
            ur.setRoleid(role.getId());
            RoleUserDAO.save(ur);
        }
    }
}
