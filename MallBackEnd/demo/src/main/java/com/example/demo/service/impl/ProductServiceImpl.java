package com.example.demo.service.impl;


import com.example.demo.mapper.ProductMapper;
import com.example.demo.pojo.dto.Product;
import com.example.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    // 分页查询产品
    public Map<String, Object> getProducts(String search, Long categoryId, int page, int size) {
        int offset = (page - 1) * size;
        List<Product> products = productMapper.selectProducts(search, categoryId, offset, size);
        int total = productMapper.countProducts(search, categoryId);

        Map<String, Object> result = new HashMap<>();
        result.put("data", products);
        result.put("total", total);
        return result;
    }

    // 查询单个产品
    public Product getProductById(Long id) {
        return productMapper.selectById(id);
    }

    // 查询推荐产品
    public List<Product> getFeaturedProducts(int limit) {
        return productMapper.selectFeaturedProducts(limit);
    }

    @Override
    public List<Product> getAllProducts() {
        return productMapper.selectAll();
    }

    @Override
    public void deleteProductById(Long id) {
        productMapper.deleteById(id);
    }

    @Override
    public void updateProduct(Product product) {
        if (product.getId() == null) {
            throw new RuntimeException("商品ID不能为空");
        }
        productMapper.update(product);
    }

    @Override
    public void addProduct(Product product) {
        productMapper.insert(product);
    }
}

