package com.example.demo.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TaskDto implements Serializable {
    private Long id;
    private String taskId;
    private Long ownerId;
    private String FileName;
    private String OSSPath;
    private String Status;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

}
