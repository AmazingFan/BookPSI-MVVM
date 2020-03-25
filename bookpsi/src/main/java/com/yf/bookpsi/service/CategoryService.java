package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.CategoryDAO;
import com.yf.bookpsi.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryDAO categoryDAO;

    public Category get(int id){
        return categoryDAO.findById(id).orElse(null);
    }

    public List<Category> list(){
        return categoryDAO.findAll();
    }
}
