package com.example.demo.service.impl;

import com.example.demo.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class MailServiceImpl implements MailService {
    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String from;

    @Override
    public void sendOrderSuccessMail(String to, Long orderId, BigDecimal totalPrice) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject("订单下单成功通知");
        message.setText(
                "您好，您的订单已下单成功！\n\n" +
                        "订单号：" + orderId + "\n" +
                        "订单金额：" + totalPrice + " 元\n\n" +
                        "感谢您的购买！"
        );
        mailSender.send(message);
    }
}

