package com.yf.bookpsi.controller;

import com.alipay.api.AlipayApiException;
import com.yf.bookpsi.pojo.OrderBook;
import com.yf.bookpsi.pojo.Orders;
import com.yf.bookpsi.service.OrderBookService;
import com.yf.bookpsi.service.OrdersService;
import com.yf.bookpsi.service.PayService;
import com.yf.bookpsi.util.SerialNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@RestController
public class OrdersController {
    @Autowired
    OrdersService orderService;
    @Autowired
    OrderBookService orderBookService;
    @Autowired
    PayService payService;

    @GetMapping("/api/order/{type}")
    public List<Orders> list(@PathVariable("type") int type){
        return orderService.list(type);
    }

    @GetMapping("/api/order/find/{id}")
    public Orders find(@PathVariable("id") int id) {
        return orderService.findById(id);
    }

    @GetMapping("/api/order/return")
    public List<Orders> find() {
        return orderService.findByStatus(0);
    }

    @GetMapping("/api/order")
    public List<Orders> listall() {
        return orderService.listall();
    }


    @RequestMapping("/api/order/submit")
    public String stock(@RequestBody Orders orders) throws IOException, AlipayApiException {
        Orders orders1=new Orders();
        orders1.setSerialid(SerialNumber.snumber());
        orders1.setStatus(orders.getStatus());
        orders1.setValue(orders.getValue());
        orders1.setType(orders.getType());
        orders1.setCreatetime(new Timestamp(new Date().getTime()));



        orderService.add(orders1);
        orderBookService.savestock(orders1.getId(),orders1.getType(),orders.getOrderBooks());
        return payService.aliPaytest((Integer)orders1.getValue(),(Integer)orders1.getSerialid());
    }

    @DeleteMapping("/api/order/delete/{id}")
    public void deleteById(@PathVariable("id") int id){
        orderService.deleteById(id);
    }

    @PutMapping("/api/order/return/{id}")
    public void returnOrder(@PathVariable("id") int id){
        Orders orders= new Orders();
        Orders orders1= orderService.findid(id);
        orders.setId(orders1.getId());
        orders.setType(orders1.getType());
        orders.setValue(orders1.getValue());
        orders.setSerialid(orders1.getSerialid());
        orders.setOrderBooks(orders1.getOrderBooks());
        orders.setCreatetime(orders1.getCreatetime());
        orders.setStatus(0);
        orderService.add(orders);
        orderBookService.savestock(id,0,orderBookService.listAllByOrderId(id));

    }


}
