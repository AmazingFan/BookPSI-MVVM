package com.yf.bookpsi.service;

import com.yf.bookpsi.dao.PressDAO;
import com.yf.bookpsi.pojo.Press;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PressService {
    @Autowired
    PressDAO pressDAO;

    public Press get(int id){
        return pressDAO.findById(id);
    }

    public List<Press> list(){
        return pressDAO.findAll();
    }

    public void deleteById(int id){
        pressDAO.deleteById(id);
    }

    public void addOrUpdate(Press press){
        pressDAO.save(press);
    }
}
