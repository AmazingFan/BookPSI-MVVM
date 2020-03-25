package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.RoleDAO;
import com.yf.bookpsi.pojo.Menu;
import com.yf.bookpsi.pojo.Permission;
import com.yf.bookpsi.pojo.Role;
import com.yf.bookpsi.pojo.RoleUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class RoleService {
    @Autowired
    RoleDAO roleDAO;
    @Autowired
    UserService userService;
    @Autowired
    RoleUserService roleUserService;
    @Autowired
    PermissionService permissionService;
    @Autowired
    MenuService menuService;

    public List<Role> list() {
        List<Role> roles = roleDAO.findAll();
        List<Permission> perms;
        List<Menu> menus;
        for (Role role : roles) {
            //perms = PermissionService.listPermsByRoleId(role.getId());
            perms =permissionService.listPermsByRoleId(role.getId());
            menus = menuService.getMenusByRoleId(role.getId());
            role.setPerms(perms);
            role.setMenus(menus);
        }
        return roles;
    }

    public Role findById(int id) {
        return roleDAO.findById(id);
    }

    public void addOrUpdate(Role Role) {
        roleDAO.save(Role);
    }

    public List<Role> listRolesByUser(String username) {
        int uid =  userService.findByUserName(username).getId();
        List<Role> roles = new ArrayList<>();
        List<RoleUser> urs = roleUserService.listAllByUid(uid);
        for (RoleUser ur: urs) {
            roles.add(roleDAO.findById(ur.getRoleid()));
        }
        return roles;
    }

    public void deleteRole(int id){
        roleDAO.deleteById(id);
    }
}
