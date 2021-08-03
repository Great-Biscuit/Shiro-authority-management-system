package com.csuft.shiro.service;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.entity.SysUser;

import java.util.List;

public interface SysUserService {

    /**
     * 根据用户名，查询系统用户
     *
     * @param username 用户名
     * @return
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
     *
     * @param userId 用户ID
     * @return 菜单ID列表
     */
    List<Long> queryAllMenuId(Long userId);

    /**
     * 分页模糊查询用户信息
     *
     * @param query 分页模糊查询参数
     * @return 分页模糊查询结果
     */
    DataGridResult getPageList(Query query);

    /**
     * 更新密码
     *
     * @param userId      用户ID
     * @param password    旧密码
     * @param newPassword 新密码
     * @return 更新结果
     */
    boolean updatePassword(Long userId, String password, String newPassword);

    /**
     * 根据ID查询用户
     *
     * @param userId 用户ID
     * @return 用户
     */
    SysUser getById(Long userId);

    /**
     * 根据ID列表删除用户
     *
     * @param asList 用户ID列表
     */
    void deleteByIds(Long[] asList);

    /**
     * 保存用户
     *
     * @param user 用户
     * @return 操作结果
     */
    boolean saveUser(SysUser user);

    /**
     * 更新用户
     *
     * @param user 用户
     * @return 操作结果
     */
    boolean updateUser(SysUser user);
}
