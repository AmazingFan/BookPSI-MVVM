package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.RolePermissionDAO;
import com.yf.bookpsi.pojo.Permission;
import com.yf.bookpsi.pojo.RolePermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class RolePermissionService {
    @Autowired
    com.yf.bookpsi.dao.RolePermissionDAO RolePermissionDAO;

    List<RolePermission> findAllByRid(int rid) {
        return RolePermissionDAO.findAllByRoleid(rid);
    }

    //    @Modifying
    @Transactional
    public void savePermChanges(int rid, List<Permission> perms) {
        RolePermissionDAO.deleteAllByRoleid(rid);
        for (Permission perm : perms) {
            RolePermission rp = new RolePermission();
            rp.setRoleid(rid);
            rp.setPermissid(perm.getId());
            RolePermissionDAO.save(rp);
        }
    }
}
