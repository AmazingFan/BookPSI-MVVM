package com.yf.bookpsi.dao;

import com.yf.bookpsi.pojo.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDAO extends JpaRepository<Category,Integer> {
}
