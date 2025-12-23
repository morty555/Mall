package com.example.demo.mapper;

import com.example.demo.pojo.entity.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderItemMapper {
    int insertOrderItem(OrderItem orderItem);
    List<OrderItem> selectOrderItemsByOrderId(Long orderId);
    @Select("<script>SELECT * FROM order_items WHERE product_id IN " +
            "<foreach item='id' collection='list' open='(' separator=',' close=')'>#{id}</foreach></script>")
    List<OrderItem> selectByProductIds(@Param("list") List<Long> productIds);
}
