package com.example.demo.service.impl;

import com.example.demo.mapper.OrderItemMapper;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ProductMapper productMapper;

    @Transactional
    public Long createOrder(Long userId, List<OrderItem> items, String address, String phone) {
        // 计算总价
        BigDecimal totalPrice = items.stream()
                .map(i -> i.getPrice().multiply(BigDecimal.valueOf(i.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 插入订单
        Order order = new Order();
        order.setUserId(userId);
        order.setTotalPrice(totalPrice);
        order.setStatus("pending");
        order.setAddress(address);
        order.setPhone(phone);
        orderMapper.insertOrder(order); // 会回写 order.id

        // 插入订单明细 & 扣减库存
        for (OrderItem item : items) {
            item.setOrderId(order.getId());
            orderItemMapper.insertOrderItem(item);
            productMapper.updateStock(item.getProductId(), -item.getQuantity());
        }

        return order.getId();
    }

    @Override
    public List<Order> getOrdersByUserId(Long userId) {
        return orderMapper.selectOrdersByUserId(userId);
    }
}
