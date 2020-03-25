package com.yf.bookpsi.controller;

import com.yf.bookpsi.pojo.User;
import com.yf.bookpsi.result.Result;
import com.yf.bookpsi.result.ResultFactory;
import com.yf.bookpsi.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

@RestController
public class LoginController {

    @Autowired(required = false)
    UserService userService;

    @CrossOrigin
    @ResponseBody
    @PostMapping(value = "/api/login")
    public Result login(@RequestBody User requestUser) {
        String username = requestUser.getUsername();
        username = HtmlUtils.htmlEscape(username);

        Subject subject = SecurityUtils.getSubject();
//        subject.getSession().setTimeout(10000);
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, requestUser.getPassword());
        usernamePasswordToken.setRememberMe(true);
        try {
            User user = userService.findByUserName(username);
            if (!user.isEnabled()) {
                String message = "该用户已被禁用";
                return ResultFactory.buildFailResult(message);
            }
            subject.login(usernamePasswordToken);
            // 生成随机 token 并存储在 session 中
            return ResultFactory.buildSuccessResult(usernamePasswordToken);

        } catch (AuthenticationException e) {
            String message = "账号或密码错误";
            return ResultFactory.buildFailResult(message);
        }
    }


    @PostMapping(value = "/api/register")
    public Result register(@RequestBody User user){
    String userName=user.getUsername();
    String passWord=user.getPassword();
    userName=HtmlUtils.htmlEscape(userName);
    user.setUsername(userName);

    String salt = new SecureRandomNumberGenerator().nextBytes().toString();
    int times=2;
    String encodePassword = new SimpleHash("md5",passWord,salt,times).toString();
    user.setSalt(salt);
    user.setPassword(encodePassword);
    userService.addOrUpdate(user);

    return ResultFactory.buildSuccessResult(user);
    }


    @GetMapping(value = "/api/logout")
    public Result logout(){

        Subject subject=SecurityUtils.getSubject();
        subject.logout();
        String message="成功登出";
        return ResultFactory.buildSuccessResult(message);
    }

    @GetMapping(value = "/api/authentication")
    public String authentication() {
        return "身份认证成功";
    }
}
