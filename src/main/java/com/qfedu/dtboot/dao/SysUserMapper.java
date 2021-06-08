package com.qfedu.dtboot.dao;

import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.utils.Query;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserMapper {

    /**
     * 查询出列表
     *
     * @param query
     * @return
     */
    List<SysUser> queryList(Query query);

    /**
     * 查出总数
     *
     * @param query
     * @return
     */
    int queryTotal(Query query);

    /**
     * 按ID删除用户
     *
     * @param userId
     * @return
     */
    int deleteByPrimaryKey(Long userId);

    /**
     * 插入用户
     *
     * @param record
     * @return
     */
    int insert(SysUser record);

    /**
     * 插入（用户信息不全）
     * @param record
     * @return
     */
    int insertSelective(SysUser record);

    /**
     * 按ID查询用户
     * @param userId
     * @return
     */
    SysUser selectByPrimaryKey(Long userId);

    /**
     * 更新用户信息（用户信息不全）
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(SysUser record);

    /**
     * 更新用户信息
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(SysUser record);

    /**
     * 根据用户名，查询系统用户
     *
     * @param username
     * @return
     */
    SysUser queryByUserName(String username);

    /**
     * 查询用户的所有权限
     *
     * @param userId 用户ID
     */
    List<String> queryAllPerms(Long userId);

    /**
     * 查询用户的所有菜单ID
     */
    List<Long> queryAllMenuId(Long userId);

}