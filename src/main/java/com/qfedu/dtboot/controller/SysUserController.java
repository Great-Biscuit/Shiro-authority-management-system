package com.qfedu.dtboot.controller;

import com.qfedu.dtboot.utils.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by helen on 2018/3/7
 * 系统用户
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController{

    /**
     * 获取登录的用户信息
     */
    @GetMapping("/info")
    public R info(){
        return R.ok().put("user", getUser());
    }
}
