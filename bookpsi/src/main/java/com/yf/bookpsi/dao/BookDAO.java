package com.yf.bookpsi.dao;
import com.yf.bookpsi.pojo.Book;
import com.yf.bookpsi.pojo.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookDAO extends JpaRepository<Book,Integer> {
    Book findById(int id);
    List<Book> findAllByCategory(Category category);

    List<Book> findAllByTitleLike(String keyword);

    List<Book> findAllByStockLessThan(int stock);

}
