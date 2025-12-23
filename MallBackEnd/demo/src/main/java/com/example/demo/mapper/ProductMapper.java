package com.example.demo.mapper;


import com.example.demo.pojo.dto.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ProductMapper {

    // 分页查询产品，支持搜索和分类
    List<Product> selectProducts(
            @Param("search") String search,
            @Param("categoryId") Long categoryId,
            @Param("offset") int offset,
            @Param("limit") int limit
    );

    // 查询总数，用于分页
    int countProducts(@Param("search") String search,
                      @Param("categoryId") Long categoryId);

    // 查询单个产品
    Product selectById(@Param("id") Long id);
    @Update("UPDATE products SET stock = stock - #{quantity} WHERE id = #{id}")
    int updateStock(@Param("id") Long id, @Param("quantity") int quantity);
    // 查询推荐产品
    List<Product> selectFeaturedProducts(@Param("limit") int limit);

    @Select("SELECT id, name, price, stock FROM products")
    List<Product> selectAll();
}
