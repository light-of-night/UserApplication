package com.baizhi.controller;

import com.baizhi.entities.ErrorMessage;
import com.baizhi.exceptions.UserNameAndPasswordException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice //@ControllerAdvice +@ResponseBody
public class CustomExceptionHandler {

    @ExceptionHandler(value = UserNameAndPasswordException.class)
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    public ErrorMessage handlerError(UserNameAndPasswordException ex) {
        return new ErrorMessage(1001, ex.getMessage());
//
//        if (ex.getMessage().equals("用户不存在")) {
//            return new ErrorMessage(101, ex.getMessage());
//        }
//
//        if(ex.getMessage().equals("密码错误--请重新输入")){
//            return new ErrorMessage(102, ex.getMessage());
//        }else {
//        return new ErrorMessage(110, "系统发生故障，请稍后再试");}
    }
}
