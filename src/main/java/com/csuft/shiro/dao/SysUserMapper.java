package com.csuft.shiro.dao;

import com.csuft.shiro.entity.SysUser;
import com.csuft.shiro.utils.Query;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserMapper {

    /**
     * 查分页模糊询出用户列表
     *
     * @param query 分页模糊参数
     * @return 用户列表
     */
    List<SysUser> queryList(Query query);

    /**
     * 查出分页模糊查询总数
     *
     * @param query 分页模糊查询参数
     * @return 数量
     */
    int queryTotal(Query query);

    /**
     * 按ID删除用户
     *
     * @param userId 用户ID
     * @return 操作结果
     */
    int deleteByPrimaryKey(Long userId);

    /**
     * 插入用户
     *
     * @param record 用户
     * @return 操作结果
     */
    int insert(SysUser record);

    /**
     * 插入用户（用户信息不全）
     *
     * @param record 用户
     * @return 操作结果
     */
    int insertSelective(SysUser record);

    /**
     * 按ID查询用户
     *
     * @param userId 用户ID
     * @return 用户
     */
    SysUser selectByPrimaryKey(Long userId);

    /**
     * 更新用户信息（用户信息不全）
     *
     * @param record 用户
     * @return 操作结果
     */
    int updateByPrimaryKeySelective(SysUser record);

    /**
     * 更新用户信息
     *
     * @param record 用户
     * @return 操作结果
     */
    int updateByPrimaryKey(SysUser record);

    /**
     * 根据用户名，查询系统用户
     *
     * @param username 用户名
     * @return 用户
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
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<Long> queryAllMenuId(Long userId);

    /**
     * 批量删除用户
     *
     * @param userIds 用户ID列表
     * @return 操作结果
     */
    int deleteBatch(Long[] userIds);

    /**
     * 根据ID查询用户
     *
     * @param userId 用户ID
     * @return 用户
     */
    SysUser selectById(Long userId);
}