package com.example.demo.service;

import java.math.BigDecimal;

public interface MailService {
    void sendOrderSuccessMail(String to, Long orderId, BigDecimal totalPrice);
}
