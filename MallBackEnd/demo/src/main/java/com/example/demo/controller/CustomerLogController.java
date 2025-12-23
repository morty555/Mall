package com.example.demo.controller;


import com.example.demo.pojo.entity.CustomerLog;
import com.example.demo.service.CustomerLogService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@CrossOrigin
@RestController
public class CustomerLogController {

    @Resource
    private CustomerLogService customerLogService;

    @GetMapping("/api/customers/logs")
    public List<CustomerLog> getCustomerLogs() {
        return customerLogService.getCustomerLogs();
    }
}
