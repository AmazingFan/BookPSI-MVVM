package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.BookDAO;
import com.yf.bookpsi.pojo.Book;
import com.yf.bookpsi.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service

public class BookService {
    @Autowired
    BookDAO bookDAO;

    @Autowired
    CategoryService categoryService;

    @Autowired
    OrderBookService orderItemService;
    @Autowired
    OrdersService orderService;

    public List<Book> list() {
        //Sort sort = new Sort(Sort.Direction.DESC, "id");
        return bookDAO.findAll();
    }

    public Book get(int id) {
        return bookDAO.findById(id);
    }

    public void addOrUpdate(Book book){
        bookDAO.save(book);
    }

    public void deleteById(int id){
        bookDAO.deleteById(id);
    }

    public List<Book> listByCategory(int cid){
        Category category=categoryService.get(cid);
        return bookDAO.findAllByCategory(category);
    }
/*
    public List<Book> listBooksByOrder(int orderid){
        List<Book> books=new ArrayList<>();
        List<OrderItem> orderItems=orderItemService.listAllByOrderId(orderid);
        for(OrderItem orderItem:orderItems){
            books.add(bookDAO.findById((orderItem.getBookid())));
        }
        return books;
    }

 */

    public List<Book> Search(String keywords) {
        return bookDAO.findAllByTitleLike('%' + keywords + '%');
    }

    public List<Book> findLowStock(){
        List<Book> books=bookDAO.findAll();
        List<Book> books1=new ArrayList<>();
        for(Book book:books){
            if(book.getStock()<book.getLowstock()){
                books1.add(book);
            }
        }
        return books1;
    }

}