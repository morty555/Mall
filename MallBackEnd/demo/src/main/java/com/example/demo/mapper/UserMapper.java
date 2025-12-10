package com.example.demo.mapper;

import com.example.demo.pojo.entity.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
    /**
     * 根据用户名查询员工
     * @param email
     * @return
     */
    @Select("select * from user where email = #{eamil}")
    User getByEmail(String email);


    @Insert("insert into user(username,password,created_at,updated_at,status,email)"+"values"+"(#{username},#{password},#{createdAt},#{updatedAt},#{status},#{email})")
    void register(User user);


}
