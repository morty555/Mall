package com.example.demo.mapper;

import com.example.demo.pojo.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

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

    @Select("select * from user where id = #{userId}")
    User selectById(Long userId);

    // 查询所有用户
    @Select("SELECT id, username , email, created_at, updated_at, status FROM user ORDER BY id DESC")
    List<User> selectAllUsers();
    @Select("<script>SELECT * FROM user WHERE id IN " +
            "<foreach item='id' collection='list' open='(' separator=',' close=')'>#{id}</foreach></script>")
    List<User> selectByIds(@Param("list") List<Long> userIds);
}
