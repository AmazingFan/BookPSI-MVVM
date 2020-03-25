package com.yf.bookpsi.controller;

import com.yf.bookpsi.pojo.Book;
import com.yf.bookpsi.pojo.Category;
import com.yf.bookpsi.pojo.Search;
import com.yf.bookpsi.service.BookService;
import com.yf.bookpsi.service.CategoryService;
import com.yf.bookpsi.service.PressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    PressService pressService;
    @Autowired
    CategoryService categoryService;

    @GetMapping("/api/book")
    public List<Book> list() throws Exception{
        return bookService.list();
    }

    @GetMapping("/api/book/{id}")
    public Book findById(@PathVariable("id") int id){
        return bookService.get(id);
    }

    @PostMapping("/api/book")
    public void addOrUpdate(@RequestBody Book book){
        bookService.addOrUpdate(book);
    }

    @GetMapping("/api/categories/{categoryid}/book")
    public List<Book> findByCategory(@PathVariable("categoryid") int cid) throws Exception{
        if (cid==0) {
            return bookService.list();
        } else {
            return bookService.listByCategory(cid);
        }
    }

    @GetMapping("/api/category")
    public List<Category> categoryList(){
        return categoryService.list();
    }

    @DeleteMapping("/api/book/delete/{id}")
    public void deleteById(@PathVariable("id") int id){
        bookService.deleteById(id);
    }

    @CrossOrigin
    @PostMapping("/api/book/search")
    public List<Book> searchResult(@RequestBody Search s) throws Exception {
        if ("".equals(s.getKeywords())) {
            return bookService.list();
        } else {
            return bookService.Search(s.getKeywords());
        }
    }

    @GetMapping("/api/book/low")
    public List<Book> findLowStock(){
        return bookService.findLowStock();
    }
}
