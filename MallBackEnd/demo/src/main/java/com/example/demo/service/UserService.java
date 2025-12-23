package com.example.demo.service;


import com.example.demo.pojo.dto.UserLoginDto;
import com.example.demo.pojo.entity.User;

import java.util.List;

public interface UserService {
    User login(UserLoginDto userLoginDto);

    User register(UserLoginDto userLoginDto);


    List<User> getAllUsers();
}