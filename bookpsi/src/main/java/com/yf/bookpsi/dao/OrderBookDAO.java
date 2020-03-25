package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.OrderBook;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderBookDAO extends JpaRepository<OrderBook,Integer> {


    List<OrderBook> findAllByOrderid(int orderid);
    void deleteAllByOrderid(int orderid);

}
