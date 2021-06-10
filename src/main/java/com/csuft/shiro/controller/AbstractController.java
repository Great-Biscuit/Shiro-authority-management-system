package com.csuft.shiro.controller;

import com.csuft.shiro.entity.SysUser;
import com.csuft.shiro.utils.ShiroUtils;

/**
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