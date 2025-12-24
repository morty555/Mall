package com.example.demo.service.impl;

import com.example.demo.mapper.OrderStatisticsMapper;
import com.example.demo.pojo.vo.DailySalesVO;
import com.example.demo.pojo.vo.ProductSalesVO;
import com.example.demo.service.OrderStatisticsService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderStatisticsServiceImpl implements OrderStatisticsService {

    private final OrderStatisticsMapper statisticsMapper;

    public OrderStatisticsServiceImpl(OrderStatisticsMapper statisticsMapper) {
        this.statisticsMapper = statisticsMapper;
    }

    @Override
    public List<ProductSalesVO> getProductSales() {
        return statisticsMapper.selectProductSales();
    }

    @Override
    public List<DailySalesVO> getDailySales() {
        return statisticsMapper.selectDailySales();
    }
}
