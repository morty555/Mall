package com.example.demo.pojo.dto;

import lombok.Data;

import java.util.List;

@Data
public class CreateOrderRequest {
    private Long userId;
    private String recipient;
    private String address;
    private String phone;
    private List<OrderItemRequest> items;

    // getter / setter
}