package com.example.demo.service;

import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;

import java.util.List;

public interface OrderService {

    Long createOrder(Long userId, List<OrderItem> items, String address, String phone);
    List<Order> getOrdersByUserId(Long userId);
}
