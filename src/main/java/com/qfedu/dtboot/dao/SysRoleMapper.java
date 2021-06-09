package com.qfedu.dtboot.dao;

import com.qfedu.dtboot.entity.SysRole;
import com.qfedu.dtboot.utils.Query;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysRoleMapper {

    int deleteByPrimaryKey(Long roleId);

    int insert(SysRole record);

    /**
     * 属性不全插入
     *
     * @param record
     * @return
     */
    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Long roleId);

    /**
     * 属性不全更新
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    List<SysRole> queryList(Query query);

    int queryTotal(Query query);

    int deleteBatch(Long[] roleIds);

    List<SysRole> selectAll();

    SysRole queryByRoleName(String roleName);
}