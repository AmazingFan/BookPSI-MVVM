package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.MenuDAO;
import com.yf.bookpsi.dao.RoleMenuDAO;
import com.yf.bookpsi.pojo.Menu;
import com.yf.bookpsi.pojo.RoleMenu;
import com.yf.bookpsi.pojo.RoleUser;
import com.yf.bookpsi.pojo.User;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
@Service
public class MenuService {
    @Autowired
    MenuDAO menuDAO;
    @Autowired
    UserService userService;
    @Autowired
    RoleUserService roleUserService;
    @Autowired
    RoleMenuService roleMenuService;

    public List<Menu> getAllByParentId(int parentId) {return menuDAO.findAllByParentid(parentId);}

    public List<Menu> getMenusByCurrentUser() {
        String username = SecurityUtils.getSubject().getPrincipal().toString();
        User user = userService.findByUserName(username);
        List<RoleUser> userRoleList = roleUserService.listAllByUid(user.getId());
        List<Menu> menus = new ArrayList<>();
        for (RoleUser roleUser : userRoleList) {
            List<RoleMenu> rms = roleMenuService.findAllByRoleid(roleUser.getRoleid());
            for (RoleMenu rm : rms) {
                // 增加防止多角色状态下菜单重复的逻辑
                Menu menu = menuDAO.findById(rm.getMenuid());
                boolean isExist = false;
                for (Menu m : menus) {
                    if (m.getId() == menu.getId()) {
                        isExist = true;
                    }
                }
                if (!isExist) {
                    menus.add(menu);
                }
            }
        }
        handleMenus(menus);
        return menus;
    }

    public List<Menu> getMenusByRoleId(int rid) {
        List<Menu> menus = new ArrayList<>();
        List<RoleMenu> rms = roleMenuService.findAllByRoleid(rid);
        for (RoleMenu rm : rms) {
            menus.add(menuDAO.findById(rm.getMenuid()));
        }
        handleMenus(menus);
        return menus;
    }

    public void handleMenus(List<Menu> menus) {
        for (Menu menu : menus) {
            menu.setChildren(getAllByParentId(menu.getId()));
        }

        Iterator<Menu> iterator = menus.iterator();
        while (iterator.hasNext()) {
            Menu menu = iterator.next();
            if (menu.getParentid() != 0) {
                iterator.remove();
            }
        }
    }
}
