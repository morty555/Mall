package com.example.demo.pojo.entity;



import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CustomerLog {
    private Long id;
    private Long customerId; // 用户ID
    private String action;   // 浏览 / 购买
    private Long productId;  // 商品ID
    private LocalDateTime time; // 日志时间
}
