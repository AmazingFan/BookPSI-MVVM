package com.yf.bookpsi.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "orders")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    private int serialid;
    private int value;
    private int status;
    private int type;
    private Timestamp createtime;

@OneToMany
@JoinTable(name="order_book",joinColumns={@JoinColumn(name="orderid")}
        ,inverseJoinColumns={@JoinColumn(name="bookid")})
List<OrderBook> orderBooks;

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public List<OrderBook> getOrderBooks() {
        return orderBooks;
    }

    public void setOrderBooks(List<OrderBook> orderBooks) {
        this.orderBooks = orderBooks;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSerialid() {
        return serialid;
    }

    public void setSerialid(int serialid) {
        this.serialid = serialid;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }



    public Orders() {
    }
}
