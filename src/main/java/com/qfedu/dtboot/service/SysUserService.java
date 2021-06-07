package com.qfedu.dtboot.service;

import com.qfedu.dtboot.entity.SysUser;

import java.util.List;

/**
 * Created by helen on 2018/3/6
 */
public interface SysUserService {

    /**
     * 根据用户名，查询系统用户
     */
    SysUser queryByUserName(String username);

    /**
     * 查询用户的所有权限
     * @param userId  用户ID
     */
    List<String> queryAllPerms(Long userId);
}
