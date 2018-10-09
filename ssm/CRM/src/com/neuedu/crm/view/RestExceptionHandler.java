package com.neuedu.crm.view;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class RestExceptionHandler {
	@ExceptionHandler(UnauthorizedException.class)  
    @ResponseBody  
    public String unauthorizedExceptionHandler(UnauthorizedException unauthorizedException) {  

        return "{'status':'-1','msg':'权限不足'}";
    }  
}
