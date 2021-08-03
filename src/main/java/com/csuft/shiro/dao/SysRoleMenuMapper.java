package com.csuft.shiro.dao;

import com.csuft.shiro.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMenuMapper {

    /**
     * 根据ID删除角色菜单表
     * @param id ID
     * @return 操作结果
     */
    int deleteByPrimaryKey(Long id);

    /**
     * 插入角色菜单关系
     * @param record 角色菜单关系
     * @return 操作结果
     */
    int insert(SysRoleMenu record);

    /**
     * 插入角色菜单关系（属性不全）
     * @param record 角色菜单关系
     * @return 操作结果
     */
    int insertSelective(SysRoleMenu record);

    /**
     * 根据ID查询角色菜单表
     * @param id ID
     * @return 角色菜单关系
     */
    SysRoleMenu selectByPrimaryKey(Long id);

    /**
     * 根据ID更新角色菜单关系（属性不全）
     * @param record 用户菜单关系
     * @return 操作结果
     */
    int updateByPrimaryKeySelective(SysRoleMenu record);

    /**
     * 根据ID更新角色菜单关系
     * @param record 用户菜单关系
     * @return 操作结果
     */
    int updateByPrimaryKey(SysRoleMenu record);

    /**
     * 根据角色ID获取菜单ID列表
     * @param roleId 角色ID
     * @return 菜单ID列表
     */
    List<Long> queryMenuIdList(Long roleId);

    /**
     * 根据角色ID列表删除角色菜单关系
     * @param roleIds 角色ID列表
     * @return 操作结果
     */
    int deleteByRoleIds(Long[] roleIds);

    /**
     * 根据菜单ID列表删除角色菜单关系
     * @param menuIds 菜单ID列表
     * @return 操作结果
     */
    int deleteByMenuIds(Long[] menuIds);
}