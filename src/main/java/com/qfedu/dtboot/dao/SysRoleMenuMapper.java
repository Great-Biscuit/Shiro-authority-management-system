package com.qfedu.dtboot.dao;

import com.qfedu.dtboot.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMenuMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysRoleMenu record);

    int insertSelective(SysRoleMenu record);

    SysRoleMenu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysRoleMenu record);

    int updateByPrimaryKey(SysRoleMenu record);

    /**
     * 根据角色ID获取菜单ID列表
     */
    List<Long> queryMenuIdList(Long roleId);

    void deleteByRoleIds(Long[] roleIds);
}