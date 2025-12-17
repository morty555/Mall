package com.example.demo.controller;

import com.example.demo.pojo.dto.CreateOrderRequest;
import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @PostMapping("/create")
    public Map<String, Object> createOrder(@RequestBody CreateOrderRequest request) {
        Map<String, Object> result = new HashMap<>();
        try {
            Long userId = request.getUserId();
            String recipient = request.getRecipient();
            String address = request.getAddress();
            String phone = request.getPhone();

            List<OrderItem> items = request.getItems().stream().map(i -> {
                OrderItem item = new OrderItem();
                item.setProductId(i.getProductId());
                item.setProductName(i.getProductName());
                item.setPrice(i.getPrice());
                item.setQuantity(i.getQuantity());
                return item;
            }).collect(Collectors.toList());
            Long orderId = orderService.createOrder(userId, items, address, phone);

            result.put("success", true);
            result.put("orderId", orderId);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }




    @GetMapping("/list")
    public List<Order> listOrders(@RequestParam Long userId) {
        return orderService.getOrdersByUserId(userId);
    }

}
