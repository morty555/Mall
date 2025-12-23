package com.example.demo.controller;


import com.example.demo.constant.JwtClaimsConstant;
import com.example.demo.exception.AccountExistedException;
import com.example.demo.exception.AccountNotFoundException;
import com.example.demo.exception.PasswordErrorException;
import com.example.demo.pojo.dto.UserLoginDto;
import com.example.demo.pojo.entity.User;
import com.example.demo.pojo.vo.FogetPasswordVo;
import com.example.demo.pojo.vo.UserLoginVo;
import com.example.demo.properties.JwtProperties;
import com.example.demo.result.Result;
import com.example.demo.service.UserService;
import com.example.demo.utils.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@CrossOrigin
@RequestMapping("/api")
@RestController
@Slf4j
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private JwtProperties jwtProperties;


    /**
     * 登录
     *
     * @param userLoginDto
     * @return
     */
    @ExceptionHandler({AccountNotFoundException.class, PasswordErrorException.class, AccountNotFoundException.class})
    @PostMapping("/auth/login")
    public Result<UserLoginVo> login(@RequestBody UserLoginDto userLoginDto){
        log.info("用户登陆:{}",userLoginDto);
        User user = userService.login(userLoginDto);

        //登录成功后，生成jwt令牌
        Map<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID, user.getId());
        String token = JwtUtil.createJWT(
                jwtProperties.getUserSecretKey(),
                jwtProperties.getUserTtl(),
                claims);
        UserLoginVo userLoginVo = UserLoginVo.builder()
                .id(user.getId())
                .username(user.getUsername())
                .token(token)
                .build();
        if(user==null){}
        System.out.println(userLoginVo);
        return Result.success(userLoginVo);

    }

    @ExceptionHandler(AccountExistedException.class)
    @PostMapping("/auth/register")
    public  Result<UserLoginVo> register(@RequestBody UserLoginDto userLoginDto){
        log.info("用户注册:{}",userLoginDto);
        User user = userService.register(userLoginDto);
        if(user == null){
            return Result.error("注册失败,验证码错误");
        }
        UserLoginVo userLoginVo = UserLoginVo.builder()
                .username(user.getUsername())
                .id(user.getId())
                .build();


        return Result.success(userLoginVo);
    }


    // 返回所有客户（用户）
    @GetMapping("customers")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
}
