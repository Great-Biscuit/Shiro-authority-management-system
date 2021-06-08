package com.qfedu.dtboot.controller;

import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.utils.ShiroUtils;

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