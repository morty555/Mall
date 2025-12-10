package com.example.demo.pojo.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FogetPasswordVo implements Serializable {

    private String email;

   private String code;

    private String newPassword;
}
