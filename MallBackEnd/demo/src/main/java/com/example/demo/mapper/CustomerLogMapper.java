package com.example.demo.mapper;

import com.example.demo.pojo.entity.CustomerLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CustomerLogMapper {

    @Select("SELECT id, order_id,  product_id   FROM order_items ")
    List<CustomerLog> selectAllLogs();
}

