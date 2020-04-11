package com.yf.bookpsi.controller;


import com.alipay.api.AlipayApiException;
import com.yf.bookpsi.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class PayController {
    @Autowired
    PayService payService;

    @PostMapping("/api/pay")
    public String payMent(Integer number,Integer snumber) throws IOException, AlipayApiException {

         return payService.aliPaytest(number,snumber);
    }

    @RequestMapping("/api/payorder")
    public String payorder(Integer value) throws IOException, AlipayApiException {
        Integer sd=3;
        return payService.aliPaytest(value,sd);
    }

}
