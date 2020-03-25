package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.BookDAO;
import com.yf.bookpsi.dao.OrderBookDAO;
import com.yf.bookpsi.pojo.OrderBook;
import com.yf.bookpsi.pojo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderBookService {
    @Autowired
    OrderBookDAO orderBookDAO;
    @Autowired
    BookService bookService;


    public List<OrderBook> listAllByOrderId(int Orderid){
        return orderBookDAO.findAllByOrderid(Orderid);
    }

    public List<OrderBook> list(){
        return orderBookDAO.findAll();
    }

    public void savestock(int orderid,int type,List<OrderBook> orderBook){
        for (OrderBook orderBook1:orderBook){
            OrderBook orderBook2=new OrderBook();
            orderBook2.setOrderid(orderid);
            orderBook2.setBook(orderBook1.getBook());
            orderBook2.setAmount(orderBook1.getAmount());
            orderBook2.setPrice(orderBook1.getPrice());
            if (type==1){
            orderBook1.getBook().setStock(orderBook1.getBook().getStock()+orderBook2.getAmount());
            bookService.addOrUpdate(orderBook1.getBook());//增加库存
            }else if(type==0){
                orderBook1.getBook().setStock(orderBook1.getBook().getStock()-orderBook2.getAmount());
                orderBook1.getBook().setSale(orderBook1.getBook().getSale()+orderBook2.getAmount());
                bookService.addOrUpdate(orderBook1.getBook());//减少库存,增加销量
            }
            orderBookDAO.save(orderBook2);
        }

    }
}
