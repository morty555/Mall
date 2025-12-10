package com.example.demo.pojo.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data


public class Product {

    private Long id;

    private String name;

    private BigDecimal price;


    private String description;

    private String image;

    private Integer stock;


    private Long categoryId;


    private String specifications; // JSON 存储规格

    private Boolean featured;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
