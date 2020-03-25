package com.yf.bookpsi.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "book")
public class Book implements Serializable {

    private static final long serialVersionUID = 3109884180514364431L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @ManyToOne
    @JoinColumn(name = "categoryid")
    private  Category category;
    private String title;
    private String auther;
    private int sellprice;
    private int purchaseprice;
    @ManyToOne
    @JoinColumn(name = "pressid")
    private Press press;
    private int stock;
    private  String isbn;
    private int sale;
    private int lowstock;
    private String description;
    private String format;

    public Press getPress() {
        return press;
    }

    public void setPress(Press press) {
        this.press = press;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuther() {
        return auther;
    }

    public void setAuther(String auther) {
        this.auther = auther;
    }

    public int getSellprice() {
        return sellprice;
    }

    public void setSellprice(int sellprice) {
        this.sellprice = sellprice;
    }

    public int getPurchaseprice() {
        return purchaseprice;
    }

    public void setPurchaseprice(int purchaseprice) {
        this.purchaseprice = purchaseprice;
    }



    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getLowstock() {
        return lowstock;
    }

    public void setLowstock(int lowstock) {
        this.lowstock = lowstock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

}
