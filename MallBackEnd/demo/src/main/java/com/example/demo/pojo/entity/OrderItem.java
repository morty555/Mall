package com.example.demo.pojo.entity;

import lombok.Data;

import java.math.BigDecimal;

// OrderItem.java
@Data
public class OrderItem {
    private Long id;
    private Long orderId;
    private Long productId;
    private String productName;
    private BigDecimal price;
    private Integer quantity;
    // getter/setter
}
