package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.PermissionDAO;
import com.yf.bookpsi.pojo.Permission;
import com.yf.bookpsi.pojo.Role;
import com.yf.bookpsi.pojo.RolePermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
@Service
public class PermissionService {
    @Autowired
    PermissionDAO permissionDAO;
    @Autowired
    RoleUserService roleUserService;
    @Autowired
    RoleService roleService;
    @Autowired
    RolePermissionService rolePermissionService;
    @Autowired
    UserService userService;

    public Permission findById(int id) {
        return permissionDAO.findById(id);
    }

    public List<Permission> list() {return permissionDAO.findAll();}

    public boolean needFilter(String requestAPI) {
        List<Permission> ps = permissionDAO.findAll();
        for (Permission p: ps) {
            // 这里我们进行前缀匹配，拥有父权限就拥有所有子权限
            if (requestAPI.startsWith(p.getUrl())) {
                return true;
            }
        }
        return false;
    }

    public List<Permission> listPermsByRoleId(int rid) {
        List<RolePermission> rps = rolePermissionService.findAllByRid(rid);
        List<Permission> perms = new ArrayList<>();
        for (RolePermission rp : rps) {
            perms.add(permissionDAO.findById(rp.getPermissid()));
        }
        return perms;
    }

    public Set<String> listPermissionURLsByUser(String username) {
        List<Role> roles = roleService.listRolesByUser(username);
        Set<String> URLs = new HashSet<>();

        for (Role role : roles) {
            List<RolePermission> rps = rolePermissionService.findAllByRid(role.getId());
            for (RolePermission rp : rps) {
                URLs.add(permissionDAO.findById(rp.getPermissid()).getUrl());
            }
        }
        return URLs;
    }
}
