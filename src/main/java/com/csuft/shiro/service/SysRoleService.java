package com.csuft.shiro.service;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.entity.SysRole;

import java.util.List;

public interface SysRoleService {

    /**
     * 分页模糊查询角色
     *
     * @param query 分页模糊查询参数
     * @return 分页模糊查询结果
     */
    DataGridResult getPageList(Query query);

    /**
     * 根据ID列表删除角色
     *
     * @param id 角色ID列表
     */
    void deleteBatch(Long[] id);

    /**
     * 根据ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色
     */
    SysRole getById(Long roleId);

    /**
     * 查询所有角色
     *
     * @return
     */
    List<SysRole> list();

    /**
     * 保存角色
     *
     * @param role 角色信息
     * @return 操作结果
     */
    boolean saveRole(SysRole role);

    /**
     * 更新角色
     *
     * @param role 角色信息
     * @return 操作结果
     */
    boolean update(SysRole role);
}
