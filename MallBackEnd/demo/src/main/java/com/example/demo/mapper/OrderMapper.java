package com.example.demo.mapper;

import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.math.BigDecimal;
import java.util.List;


@Mapper
public interface OrderMapper {
    int insertOrder(Order order);
    List<Order> selectOrdersByUserId(@Param("userId") Long userId);
    List<OrderItem> selectOrderItemsByOrderId(Long orderId);

    @Select("SELECT * FROM orders ORDER BY created_at DESC")
    @Results({
            @Result(column="id", property="id", id=true),                     // 主键 id
            @Result(column="user_id", property="userId"),                    // 驼峰映射 userId
            @Result(column="total_price", property="totalPrice"),
            @Result(column="status", property="status"),
            @Result(column="phone", property="phone"),
            @Result(column="address", property="address"),
            @Result(column="created_at", property="createdAt"),
            @Result(column="updated_at", property="updatedAt"),
            @Result(property="items", column="id",                             // 使用订单 id 查询子项
                    many=@Many(select="selectItemsByOrderId"))
    })
    List<Order> selectAllOrders();

    // 根据订单 id 查询对应的订单项
    @Select("SELECT * FROM order_items WHERE order_id = #{orderId}")
    @Results({
            @Result(column="id", property="id", id=true),
            @Result(column="order_id", property="orderId"),
            @Result(column="product_id", property="productId"),
            @Result(column="product_name", property="productName"),
            @Result(column="price", property="price"),
            @Result(column="quantity", property="quantity")
    })
    List<OrderItem> selectItemsByOrderId(Long orderId);



    @Select("SELECT COUNT(*) FROM orders")
    Integer countOrders();

    @Select("SELECT IFNULL(SUM(total_price),0) FROM orders")
    BigDecimal sumTotalPrice();
    @Select("SELECT * FROM orders WHERE order_id = #{orderId}")
    Order selectByOrderId(@Param("orderId") Long orderId);

    @Select("<script>SELECT * FROM `orders` WHERE id IN " +
            "<foreach item='id' collection='list' open='(' separator=',' close=')'>#{id}</foreach></script>")
    List<Order> selectByIds(@Param("list") List<Long> orderIds);
}
