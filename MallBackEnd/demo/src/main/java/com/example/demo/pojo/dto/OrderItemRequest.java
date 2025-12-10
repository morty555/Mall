package com.example.demo.pojo.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderItemRequest {
    private Long productId;
    private String productName;
    private BigDecimal price;
    private Integer quantity;

    // getter / setter
}
