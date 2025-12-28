package com.example.demo.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // 前端 1
        registry.addViewController("/front1/").setViewName("forward:/frontB/index.html");
        // 前端 2
        registry.addViewController("/front2/").setViewName("forward:/frontC/dist/index.html");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 映射前端静态资源
        registry.addResourceHandler("/front1/**")
                .addResourceLocations("classpath:/static/frontB/");
        registry.addResourceHandler("/front2/**")
                .addResourceLocations("classpath:/static/frontC/dist/");
    }
}
