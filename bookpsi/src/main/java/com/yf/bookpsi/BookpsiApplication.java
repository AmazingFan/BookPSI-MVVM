package com.yf.bookpsi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication

public class BookpsiApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookpsiApplication.class, args);
    }

}
