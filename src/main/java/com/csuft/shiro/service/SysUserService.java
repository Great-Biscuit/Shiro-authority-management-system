package com.csuft.shiro.service;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.entity.SysUser;

import java.util.List;

public interface SysUserService {

    /**
     * 根据用户名，查询系统用户
     */
    SysUser queryByUserName(String username);

    /**
     * 查询用户的所有权限
     *
     * @param userId 用户ID
     */
    List<String> queryAllPerms(Long userId);

    /**
     * 查询用户的所有菜单ID
     */
    List<Long> queryAllMenuId(Long userId);

    DataGridResult getPageList(Query query);

    boolean updatePassword(Long userId, String password, String newPassword);

    SysUser getById(Long userId);

    void deleteByIds(Long[] asList);

    boolean saveUser(SysUser user);

    boolean updateUser(SysUser user);
}