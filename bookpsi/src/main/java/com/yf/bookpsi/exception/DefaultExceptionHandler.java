package com.yf.bookpsi.exception;


import com.yf.bookpsi.result.Result;
import com.yf.bookpsi.result.ResultFactory;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


@ControllerAdvice
public class DefaultExceptionHandler {
    @ExceptionHandler(UnauthorizedException.class)
    @ResponseBody
    public Result handleAuthorizationException(UnauthorizedException e) {
        String message = "权限认证失败";
        return ResultFactory.buildFailResult(message);
    }
}
