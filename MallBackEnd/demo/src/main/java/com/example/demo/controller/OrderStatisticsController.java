package com.example.demo.controller;


import com.example.demo.pojo.vo.DailySalesVO;
import com.example.demo.pojo.vo.ProductSalesVO;
import com.example.demo.service.OrderStatisticsService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin(origins = "*")
public class OrderStatisticsController {

    private final OrderStatisticsService statisticsService;

    public OrderStatisticsController(OrderStatisticsService statisticsService) {
        this.statisticsService = statisticsService;
    }

    /**
     * 商品销量统计（饼图）
     */
    @GetMapping("/product-sales")
    public List<ProductSalesVO> productSales() {
        return statisticsService.getProductSales();
    }

    /**
     * 每日销售额统计（折线图）
     */
    @GetMapping("/daily-sales")
    public List<DailySalesVO> dailySales() {
        return statisticsService.getDailySales();
    }
}
