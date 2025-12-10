package com.example.demo.constant;

import com.example.demo.exception.BaseException;

public class AccountLockedException extends BaseException {
    public AccountLockedException() {
    }

    public AccountLockedException(String msg) {
        super(msg);
    }
}
