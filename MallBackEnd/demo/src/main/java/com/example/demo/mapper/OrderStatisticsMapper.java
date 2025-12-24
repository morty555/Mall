package com.example.demo.mapper;

import com.example.demo.pojo.vo.DailySalesVO;
import com.example.demo.pojo.vo.ProductSalesVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderStatisticsMapper {

    /**
     * 商品销量统计（按商品汇总）
     */
    @Select("""
        SELECT 
            product_name AS productName,
            SUM(quantity) AS count
        FROM order_items
        GROUP BY product_id, product_name
        ORDER BY count DESC
    """)
    List<ProductSalesVO> selectProductSales();


    /**
     * 每日销售额统计
     */
    @Select("""
        SELECT 
            DATE(created_at) AS date,
            SUM(total_price) AS total
        FROM orders
        GROUP BY DATE(created_at)
        ORDER BY date
    """)
    List<DailySalesVO> selectDailySales();
}
