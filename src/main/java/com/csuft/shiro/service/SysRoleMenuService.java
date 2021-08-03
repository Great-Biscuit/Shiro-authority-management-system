package com.csuft.shiro.service;

import java.util.List;

/**
 * 用户与角色对应关系
 */
public interface SysRoleMenuService {
    /**
     * 查询角色的菜单列表
     *
     * @param roleId 角色ID
     * @return 菜单列表
     */
    List<Long> queryMenuIdList(Long roleId);

    /**
     * 保存或修改角色菜单关系
     *
     * @param roleId     角色ID
     * @param menuIdList 菜单列表
     */
    void saveOrUpdate(Long roleId, List<Long> menuIdList);

    /**
     * 根据角色ID列表删除角色菜单关系
     *
     * @param roleIds 角色ID列表
     */
    void deleteByRoleIds(Long[] roleIds);

    /**
     * 根据菜单ID列表删除角色菜单关系
     *
     * @param menuIds 菜单ID列表
     */
    void deleteByMenuIds(Long[] menuIds);
}
