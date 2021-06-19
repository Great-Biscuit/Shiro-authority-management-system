package com.csuft.shiro.service;

import java.util.List;

public interface SysUserRoleService {

    /**
     * 根据用户ID查询角色ID列表
     *
     * @param userId 用户ID
     * @return 角色ID列表
     */
    List<Long> queryRoleIdList(Long userId);

    /**
     * 保存修改用户角色联系
     *
     * @param userId     用户ID
     * @param roleIdList 角色ID列表
     */
    void saveOrUpdate(Long userId, List<Long> roleIdList);

    /**
     * 根据角色ID列表删除用户角色联系
     *
     * @param roleIds
     */
    void deleteByRoleIds(Long[] roleIds);

    /**
     * 根据用户ID列表删除用户角色联系
     *
     * @param asList 用户ID列表
     */
    void deleteByUserIds(Long[] asList);
}
