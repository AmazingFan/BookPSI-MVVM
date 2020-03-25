package com.yf.bookpsi.controller;

import com.yf.bookpsi.pojo.Menu;
import com.yf.bookpsi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
public class MenuController {
    @Autowired
    MenuService MenuService;

    @GetMapping("/api/menu")
    public List<Menu> menu() {
        List<Menu> menus = MenuService.getMenusByCurrentUser();
        return menus;
    }

    @GetMapping("/api/role/menu")
    public List<Menu> listAllMenus() {
        List<Menu> menus = MenuService.getMenusByRoleId(1);
        return menus;
    }
}
