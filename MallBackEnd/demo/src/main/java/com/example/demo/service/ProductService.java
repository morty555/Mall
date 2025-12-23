package com.example.demo.service;

import com.example.demo.pojo.dto.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    Map<String, Object> getProducts(String search, Long category, int page, int limit);

    Product getProductById(Long id);

    List<Product> getFeaturedProducts(int limit);

    List<Product> getAllProducts();
}
