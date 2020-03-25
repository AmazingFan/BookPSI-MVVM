package com.yf.bookpsi.controller;

import com.yf.bookpsi.pojo.Book;
import com.yf.bookpsi.pojo.Press;
import com.yf.bookpsi.result.Result;
import com.yf.bookpsi.result.ResultFactory;
import com.yf.bookpsi.service.PressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PressController {
    @Autowired
    PressService pressService;

    @GetMapping(value = "/api/press")
    List<Press> list(){
        return pressService.list();
    }

    @DeleteMapping("/api/press/delete/{id}")
    public void deleteById(@PathVariable("id") int id){
        pressService.deleteById(id);
    }

    @PostMapping("/api/press")
    public void addOrUpdate(@RequestBody Press press){
        pressService.addOrUpdate(press);

    }
}
