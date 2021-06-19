package com.csuft.shiro.dao;

import com.csuft.shiro.entity.SysUserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserRoleMapper {

    /**
     * 根据ID删除用户角色关系
     * @param id ID
     * @return 操作结果
     */
    int deleteByPrimaryKey(Long id);

    /**
     * 插入用户角色关系
     * @param record 用户角色关系
     * @return 操作结果
     */
    int insert(SysUserRole record);

    /**
     * 插入用户角色关系（属性不全）
     * @param record 用户角色关系
     * @return 操作结果
     */
    int insertSelective(SysUserRole record);

    /**
     * 根据ID查询用户角色关系
     * @param id ID
     * @return 用户角色关系
     */
    SysUserRole selectByPrimaryKey(Long id);

    /**
     * 根据ID更新用户角色关系（属性不全）
     * @param record 用户角色关系
     * @return 操作结果
     */
    int updateByPrimaryKeySelective(SysUserRole record);

    /**
     * 根据ID更新用户角色关系
     * @param record 用户角色关系
     * @return 操作结果
     */
    int updateByPrimaryKey(SysUserRole record);

    /**
     * 根据用户ID获取其角色列表
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    List<Long> queryRoleIdList(Long userId);

    /**
     * 根据角色ID列表删除用户角色关系
     * @param roleIds 角色ID列表
     * @return 操作结果
     */
    int deleteByRoleIds(Long[] roleIds);

    /**
     * 根据用户ID列表删除用户角色关系
     * @param userIds 用户ID列表
     * @return 操作结果
     */
    int deleteByUserIds(Long[] userIds);
}