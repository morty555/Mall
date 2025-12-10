package com.example.demo.mapper;

import com.example.demo.pojo.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderMapper {
    int insertOrder(Order order);
    List<Order> selectOrdersByUserId(@Param("userId") Long userId);

}
