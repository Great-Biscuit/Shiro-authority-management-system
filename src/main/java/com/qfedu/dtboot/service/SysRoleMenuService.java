package com.qfedu.dtboot.service;

import java.util.List;

/**
 * 用户与角色对应关系
 */
public interface SysRoleMenuService {
    List<Long> queryMenuIdList(Long roleId);
}
