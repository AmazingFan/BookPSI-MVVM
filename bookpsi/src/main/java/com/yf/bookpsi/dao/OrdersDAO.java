package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Book;
import com.yf.bookpsi.pojo.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrdersDAO extends JpaRepository<Orders,Integer> {
    void deleteById(int id);
    Orders findById(int id);

    List<Orders> findAllByType(int type);

    List<Orders> findAllByIdAndType(int id,int type);

    List<Orders> findAllByStatus(int status);

}
