package com.qfedu.dtboot.dao;

import com.qfedu.dtboot.entity.SysUserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserRoleMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysUserRole record);

    int insertSelective(SysUserRole record);

    SysUserRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysUserRole record);

    int updateByPrimaryKey(SysUserRole record);

    /**
     * 根据用户ID获取其角色列表
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    List<Long> queryRoleIdList(Long userId);

    void deleteByRoleIds(Long[] roleIds);

    void deleteByUserIds(Long[] userIds);
}