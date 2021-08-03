package com.csuft.shiro.controller;

import com.csuft.shiro.entity.SysUser;
import com.csuft.shiro.utils.ShiroUtils;

/**
 * Controller公共组件
 */
public abstract class AbstractController {

    /**
     * 得到当前用户
     *
     * @return 当前用户
     */
    protected SysUser getUser() {
        return ShiroUtils.getUserEntity();
    }

    /**
     * 得到当前用户ID
     *
     * @return 当前用户ID
     */
    protected Long getUserId() {
        return getUser().getUserId();
    }
}