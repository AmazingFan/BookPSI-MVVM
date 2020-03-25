package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.OrdersDAO;
import com.yf.bookpsi.pojo.OrderBook;
import com.yf.bookpsi.pojo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrdersService {
    @Autowired
    OrdersDAO orderDAO;
    @Autowired
    BookService bookService;
    @Autowired
    OrderBookService orderBookService;


    public List<Orders> list(int type){
        List<Orders> orders=orderDAO.findAllByType(type);
        orders.removeIf(orders1 -> orders1.getStatus() == 0);
        List<OrderBook> orderBooks;

        for(Orders order:orders){
            orderBooks=orderBookService.listAllByOrderId(order.getId());

            order.setOrderBooks(orderBooks);
        }
        return orders;
    }

    public List<Orders> listall(){
        List<Orders> orders=orderDAO.findAll();
        List<OrderBook> orderBooks;

        for(Orders order:orders){
            orderBooks=orderBookService.listAllByOrderId(order.getId());

            order.setOrderBooks(orderBooks);
        }
        return orders;
    }

    public void add(Orders orders){
        this.orderDAO.save(orders);
    }

    public void deleteById(int id){
        orderDAO.deleteById(id);
    }

    public Orders findById(int id){
        Orders orders;
        orders=orderDAO.findById(id);
        List<OrderBook> orderBooks=orderBookService.listAllByOrderId(id);
        orders.setOrderBooks(orderBooks);
        return orders;
    }

    public Orders findid(int id){
        return orderDAO.findById(id);
    }

    public List<Orders> findByStatus(int status){
        List<Orders> orders=orderDAO.findAllByStatus(status);
        List<OrderBook> orderBooks;

        for(Orders order:orders){
            orderBooks=orderBookService.listAllByOrderId(order.getId());

            order.setOrderBooks(orderBooks);
        }
        return orders;
    }

    public List<Orders> findByIdAndType(int id,int type){
        List<Orders> orders=orderDAO.findAllByType(type);
        List<OrderBook> orderBooks;

        for(Orders order:orders){
            orderBooks=orderBookService.listAllByOrderId(order.getId());
            order.setOrderBooks(orderBooks);
        }
        return orders;
    }
}
