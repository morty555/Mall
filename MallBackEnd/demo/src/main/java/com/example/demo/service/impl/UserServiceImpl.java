package com.example.demo.service.impl;


import com.example.demo.constant.AccountLockedException;
import com.example.demo.constant.MessageConstant;
import com.example.demo.constant.StatusConstant;
import com.example.demo.exception.AccountExistedException;
import com.example.demo.exception.AccountNotFoundException;
import com.example.demo.exception.PasswordErrorException;
import com.example.demo.mapper.UserMapper;
import com.example.demo.pojo.dto.UserLoginDto;
import com.example.demo.pojo.entity.User;
import com.example.demo.service.UserService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;



import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;

import static com.example.demo.constant.RedisConstant.LOGIN_CODE_KEY;
import static com.example.demo.constant.RedisConstant.LOGIN_CODE_TTL;


@Service
@Slf4j
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Resource
    private StringRedisTemplate stringRedisTemplate;


    public User login(UserLoginDto userLoginDto) {
        String email = userLoginDto.getEmail();
        String password = DigestUtils.md5DigestAsHex(userLoginDto.getPassword().getBytes());
        User user = userMapper.getByEmail(email);
        //ThreadLocalUtil.setCurrentId(user.getId());
        if(user==null){
            throw new AccountNotFoundException(MessageConstant.ACCOUNT_NOT_FIND);
        }

        //password = DigestUtils.md5DigestAsHex(password.getBytes());
        System.out.println(password);
        if (!password.equals(user.getPassword())) {

            //密码错误
            throw new PasswordErrorException(MessageConstant.PASSWORD_ERROR);
        }

        if (user.getStatus() == StatusConstant.DISABLE) {
            //账号被锁定
            throw new AccountLockedException(MessageConstant.ACCOUNT_LOCKED);
        }
        return user;
    }


    public User register(UserLoginDto userLoginDto) {
        User user;
        String email = userLoginDto.getEmail();

        String username = userLoginDto.getUsername();
        String password = userLoginDto.getPassword();


        user = userMapper.getByEmail(email);
        if(user!=null){
            throw new AccountExistedException(MessageConstant.ACCOUNT_EXISTED);
        }
        else{
            user = new User();
            user.setUsername(username);
            user.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
            user.setEmail(email);
            user.setStatus(StatusConstant.ENABLE);
            user.setCreatedAt(LocalDateTime.now());
            user.setUpdatedAt(LocalDateTime.now());
//        user.builder()
//                .password(DigestUtils.md5DigestAsHex(password.getBytes()))
//                .username(username)
//                .createTime(LocalDateTime.now())
//                .updateTime(LocalDateTime.now())
//                .image("")
//                .status(StatusConstant.ENABLE)
//                .build();
            userMapper.register(user);
        }


        return user;
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.selectAllUsers();
    }


}



