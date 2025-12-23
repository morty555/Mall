package com.example.demo.service;

import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;

import java.util.List;
import java.util.Map;

public interface OrderService {

    Long createOrder(Long userId, List<OrderItem> items, String address, String phone);
    List<Order> getOrdersByUserId(Long userId);

    List<Order> getAllOrders();

    Map<String, Object> getOrderStatistics();
}
