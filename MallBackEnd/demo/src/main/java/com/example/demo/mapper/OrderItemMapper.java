package com.example.demo.mapper;

import com.example.demo.pojo.entity.OrderItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderItemMapper {
    int insertOrderItem(OrderItem orderItem);
    List<OrderItem> selectOrderItemsByOrderId(Long orderId);
}
