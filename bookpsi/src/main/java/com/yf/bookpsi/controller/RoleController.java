package com.yf.bookpsi.controller;

import com.yf.bookpsi.pojo.Permission;
import com.yf.bookpsi.pojo.Role;
import com.yf.bookpsi.pojo.RoleMenu;
import com.yf.bookpsi.result.Result;
import com.yf.bookpsi.result.ResultFactory;
import com.yf.bookpsi.service.PermissionService;
import com.yf.bookpsi.service.RoleMenuService;
import com.yf.bookpsi.service.RolePermissionService;
import com.yf.bookpsi.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
@RestController
public class RoleController {
    @Autowired
    RoleService RoleService;
    @Autowired
    PermissionService PermissionService;
    @Autowired
    RolePermissionService RolePermissionService;
    @Autowired
    RoleMenuService RoleMenuService;

    @GetMapping("/api/role")
    public List<Role> listRoles(){
        return RoleService.list();
    }

    @PutMapping("/api/role/status")
    public Result updateRoleStatus(@RequestBody Role requestRole) {
        Role Role = RoleService.findById(requestRole.getId());
        Role.setEnabled(requestRole.isEnabled());
        RoleService.addOrUpdate(Role);
        String message = "用户" + Role.getZhname() + "状态更新成功";
        return ResultFactory.buildSuccessResult(message);
    }

    @PutMapping("/api/role")
    public Result editRole(@RequestBody Role requestRole) {
        RoleService.addOrUpdate(requestRole);
        RolePermissionService.savePermChanges(requestRole.getId(), requestRole.getPerms());
        String message = "修改角色信息成功";
        return ResultFactory.buildSuccessResult(message);
    }

    @PostMapping("/api/role")
    public Result addRole(@RequestBody Role requestRole) {
        RoleService.addOrUpdate(requestRole);
        String message = "添加角色成功";
        return ResultFactory.buildSuccessResult(message);
    }

    @GetMapping("/api/role/perm")
    public List<Permission> listPerms() {
        return PermissionService.list();
    }

    @PutMapping("/api/role/menu")
    public void updateRoleMenu(@RequestParam int rid, @RequestBody LinkedHashMap menusIds) {
        RoleMenuService.deleteAllByRid(rid);
        for (Object value : menusIds.values()) {
            for (int mid : (List<Integer>)value) {
                RoleMenu rm = new RoleMenu();
                rm.setRoleid(rid);
                rm.setMenuid(mid);
                RoleMenuService.save(rm);
            }
        }
    }

    @DeleteMapping("/api/role/{id}")
    public void deleteById(@PathVariable("id") int id){
        RoleService.deleteRole(id);
    }
}
