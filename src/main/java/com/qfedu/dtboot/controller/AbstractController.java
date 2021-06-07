package com.qfedu.dtboot.controller;

import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.utils.ShiroUtils;

/**
 * Created by helen on 2018/3/7
 * Controller公共组件
 */
public abstract class AbstractController {

    protected SysUser getUser() {
        return ShiroUtils.getUserEntity();
    }

    protected Long getUserId() {
        return getUser().getUserId();
    }
}