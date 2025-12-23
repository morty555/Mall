package com.example.demo.service.impl;

import com.example.demo.mapper.OrderItemMapper;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.pojo.entity.Order;
import com.example.demo.pojo.entity.OrderItem;
import com.example.demo.pojo.entity.User;
import com.example.demo.service.MailService;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private MailService mailService;
    @Autowired
    private UserMapper userMapper;

    @Transactional
    public Long createOrder(Long userId, List<OrderItem> items, String address, String phone) {

        // 1. 计算总价
        BigDecimal totalPrice = items.stream()
                .map(i -> i.getPrice().multiply(BigDecimal.valueOf(i.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 2. 插入订单
        //System.out.println(userId);
        Order order = new Order();
        order.setUserId(userId);
        order.setTotalPrice(totalPrice);
        order.setStatus("pending");
        order.setAddress(address);
        order.setPhone(phone);
        orderMapper.insertOrder(order);

        // 3. 插入订单明细 & 扣库存
        for (OrderItem item : items) {
            item.setOrderId(order.getId());
            orderItemMapper.insertOrderItem(item);
            productMapper.updateStock(item.getProductId(), -item.getQuantity());
        }

        // 4. 事务提交成功后发送邮件
        TransactionSynchronizationManager.registerSynchronization(
                new TransactionSynchronizationAdapter() {
                    @Override
                    public void afterCommit() {
                        User user = userMapper.selectById(userId);
                        mailService.sendOrderSuccessMail(
                                user.getEmail(),
                                order.getId(),
                                totalPrice
                        );
                    }
                }
        );

        return order.getId();
    }

    @Override
    public List<Order> getOrdersByUserId(Long userId) {
        return orderMapper.selectOrdersByUserId(userId);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderMapper.selectAllOrders();
    }

    @Override
    public Map<String, Object> getOrderStatistics() {
        Integer orderCount = orderMapper.countOrders();
        BigDecimal totalSales = orderMapper.sumTotalPrice();

        Map<String, Object> map = new HashMap<>();
        map.put("orderCount", orderCount);
        map.put("totalSales", totalSales);
        return map;
    }
}
