package com.example.demo.pojo.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserLoginDto implements Serializable {

    private String username;

    private String password;

    private String email;

    private String code;
}
