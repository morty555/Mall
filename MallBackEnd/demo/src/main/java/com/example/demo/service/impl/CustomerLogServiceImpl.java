package com.example.demo.service.impl;

import com.example.demo.mapper.CustomerLogMapper;
import com.example.demo.mapper.OrderItemMapper;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.pojo.entity.CustomerLog;
import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;
import com.example.demo.pojo.entity.User;
import com.example.demo.service.CustomerLogService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class CustomerLogServiceImpl implements CustomerLogService {

    @Resource
    private CustomerLogMapper customerLogMapper;

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private UserMapper userMapper;

    @Resource
    private OrderItemMapper orderItemMapper;
    @Override
    public List<CustomerLog> getCustomerLogs() {
        // 1. 查询所有 customerLog
        List<CustomerLog> logs = customerLogMapper.selectAllLogs();

        // 2. 收集 productId
        List<Long> productIds = logs.stream()
                .map(CustomerLog::getProductId)
                .distinct()
                .collect(Collectors.toList());

        // 3. 批量查询所有 OrderItem
        List<OrderItem> items = orderItemMapper.selectByProductIds(productIds);

        // 4. 建立 productId -> OrderItem 列表映射
        Map<Long, List<OrderItem>> productIdToItems = items.stream()
                .collect(Collectors.groupingBy(OrderItem::getProductId));

        // 5. 收集所有 orderId 批量查询 Order
        List<Long> orderIds = items.stream()
                .map(OrderItem::getOrderId)
                .distinct()
                .collect(Collectors.toList());

        List<Order> orders = orderMapper.selectByIds(orderIds);
        Map<Long, Order> orderIdToOrder = orders.stream()
                .collect(Collectors.toMap(Order::getId, Function.identity()));

        // 6. 收集所有 userId 批量查询 User
        List<Long> userIds = orders.stream()
                .map(Order::getUserId)
                .distinct()
                .collect(Collectors.toList());

        List<User> users = userMapper.selectByIds(userIds);
        Map<Long, User> userIdToUser = users.stream()
                .collect(Collectors.toMap(User::getId, Function.identity()));

        // 7. 关联到 CustomerLog（可选，扩展字段）
        for (CustomerLog log : logs) {
            List<OrderItem> orderItems = productIdToItems.get(log.getProductId());
            if (orderItems != null && !orderItems.isEmpty()) {
                OrderItem item = orderItems.get(0);
                Order order = orderIdToOrder.get(item.getOrderId());
                if (order != null) {
                    // 填充订单创建时间
                    log.setTime(LocalDateTime.parse(order.getCreatedAt().toString())); // 或格式化
                    log.setAction("购买");
                }
            }
        }


        // ✅ 返回结果
        return logs;
    }

}

