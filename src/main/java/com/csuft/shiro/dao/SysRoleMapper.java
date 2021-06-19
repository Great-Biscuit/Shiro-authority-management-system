package com.csuft.shiro.dao;

import com.csuft.shiro.entity.SysRole;
import com.csuft.shiro.utils.Query;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMapper {

    /**
     * 根据主键删除角色
     *
     * @param roleId 角色ID
     * @return 操作结果
     */
    int deleteByPrimaryKey(Long roleId);

    /**
     * 插入角色
     *
     * @param record 角色信息
     * @return 操作结果
     */
    int insert(SysRole record);

    /**
     * 属性不全插入
     *
     * @param record 角色信息
     * @return 操作结果
     */
    int insertSelective(SysRole record);

    /**
     * 根据主键查询角色
     *
     * @param roleId 角色ID
     * @return 角色
     */
    SysRole selectByPrimaryKey(Long roleId);

    /**
     * 属性不全更新
     *
     * @param record 角色
     * @return 操作结果
     */
    int updateByPrimaryKeySelective(SysRole record);

    /**
     * 更新角色信息
     *
     * @param record 角色
     * @return 操作结果
     */
    int updateByPrimaryKey(SysRole record);

    /**
     * 分页模糊查询
     *
     * @param query 参数
     * @return 角色列表
     */
    List<SysRole> queryList(Query query);

    /**
     * 查询总数
     *
     * @param query 分页模糊查询参数
     * @return 数量
     */
    int queryTotal(Query query);

    /**
     * 删除ID列表中的角色
     *
     * @param roleIds ID列表
     * @return 操作结果
     */
    int deleteBatch(Long[] roleIds);

    /**
     * 查询所有角色
     *
     * @return 所有角色的列表
     */
    List<SysRole> selectAll();

    /**
     * 根据角色名称查询角色
     *
     * @param roleName 角色名
     * @return 角色
     */
    SysRole queryByRoleName(String roleName);
}