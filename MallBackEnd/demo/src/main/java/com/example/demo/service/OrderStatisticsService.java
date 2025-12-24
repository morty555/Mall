package com.example.demo.service;

import com.example.demo.pojo.vo.DailySalesVO;
import com.example.demo.pojo.vo.ProductSalesVO;

import java.util.List;

public interface OrderStatisticsService {

    List<ProductSalesVO> getProductSales();

    List<DailySalesVO> getDailySales();
}
