package com.csuft.shiro.service;

import java.util.List;

/**
 * 用户与角色对应关系
 */
public interface SysRoleMenuService {
    List<Long> queryMenuIdList(Long roleId);

    void saveOrUpdate(Long roleId, List<Long> menuIdList);

    void deleteByRoleIds(Long[] roleIds);

    void deleteByMenuIds(Long[] menuIds);
}
