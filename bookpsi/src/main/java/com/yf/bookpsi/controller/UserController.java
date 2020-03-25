package com.yf.bookpsi.controller;

import com.yf.bookpsi.pojo.User;
import com.yf.bookpsi.result.Result;
import com.yf.bookpsi.result.ResultFactory;
import com.yf.bookpsi.service.RoleUserService;
import com.yf.bookpsi.service.UserService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    RoleUserService roleUserService;

    @GetMapping("/api/user")
    public List<User> list(){
        return userService.list();
    }
    @PutMapping("/api/user/status")
    public Result updateUserStatus(@RequestBody User requestUser) {
        User user = userService.findByUserName(requestUser.getUsername());
        user.setEnabled(requestUser.isEnabled());
        userService.addOrUpdate(user);
        String message = "用户" + requestUser.getUsername() + "状态更新成功";
        return ResultFactory.buildSuccessResult(message);
    }

    @PutMapping("/api/user/password")
    public Result resetPassword(@RequestBody User requestUser) {
        User user = userService.findByUserName(requestUser.getUsername());
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        int times = 2;
        user.setSalt(salt);
        String encodedPassword = new SimpleHash("md5", "123", salt, times).toString();
        user.setPassword(encodedPassword);
        userService.addOrUpdate(user);
        String message = "重置密码成功";
        return ResultFactory.buildSuccessResult(message);
    }

    @PutMapping("/api/user")
    public Result editUser(@RequestBody User requestUser) {
        User user = userService.findByUserName(requestUser.getUsername());
        user.setUsername(requestUser.getUsername());
        user.setRealname(requestUser.getRealname());
        user.setPhone(requestUser.getPhone());
        user.setIdcard(requestUser.getIdcard());
        user.setGender(requestUser.getGender());
        user.setAddress(requestUser.getAddress());
        userService.addOrUpdate(user);
        roleUserService.saveRoleChanges(user.getId(),requestUser.getRoles());
        String message = "修改用户信息成功";
        return ResultFactory.buildSuccessResult(message);
    }

    @DeleteMapping("/api/user/delete/{id}")
    public void deleteById(@PathVariable("id") int id){
        userService.deleteById(id);
    }

}
