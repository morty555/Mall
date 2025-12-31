package com.example.demo.controller;

import com.example.demo.pojo.dto.Product;
import com.example.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/products")
public class ProductController {
    @Autowired
    private  ProductService productService;

    // 查询列表，支持分页、搜索和分类
    @GetMapping
    public Map<String, Object> getProducts(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int limit,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) Long category
    ) {
        return productService.getProducts(search, category, page, limit);
    }

    // 查询单个产品详情
    @GetMapping("/{id}")
    public Product getProduct(@PathVariable Long id) {
        return productService.getProductById(id);
    }

    // 查询推荐产品
    @GetMapping("/featured")
    public List<Product> getFeaturedProducts(@RequestParam(defaultValue = "10") int limit) {
        return productService.getFeaturedProducts(limit);
    }

    // 查询所有商品
    @GetMapping("/AllProducts")
    public List<Product> getProducts() {
        return productService.getAllProducts();
    }
    // 删除商品
    @DeleteMapping("/delete/{id}")
    public void deleteProduct(@PathVariable Long id) {
        productService.deleteProductById(id);
    }

    // 修改商品
    @PutMapping("/update")
    public void updateProduct(@RequestBody Product product) {
        productService.updateProduct(product);
    }
    // ✅ 新增商品
    @PostMapping("/add")
    public String addProduct(@RequestBody Product product) {
        productService.addProduct(product);
        return "success";
    }

}
