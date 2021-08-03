package com.csuft.shiro.dao;

import com.csuft.shiro.entity.SysMenu;
import com.csuft.shiro.utils.Query;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysMenuMapper {

    /**
     * 根据主键删除菜单
     *
     * @param menuId 菜单ID
     * @return 操作结果
     */
    int deleteByPrimaryKey(Long menuId);

    /**
     * 插入菜单
     *
     * @param record 菜单数据
     * @return 操作结果
     */
    int insert(SysMenu record);

    /**
     * 插入菜单（信息不全）
     *
     * @param record 菜单数据
     * @return 操作结果
     */
    int insertSelective(SysMenu record);

    /**
     * 根据主键查询菜单
     *
     * @param menuId 菜单ID
     * @return 菜单数据
     */
    SysMenu selectByPrimaryKey(Long menuId);

    /**
     * 根据主键更新菜单（信息不全）
     *
     * @param record 菜单数据
     * @return 操作结果
     */
    int updateByPrimaryKeySelective(SysMenu record);

    /**
     * 根据主键更新菜单
     *
     * @param record 菜单数据
     * @return 操作结果
     */
    int updateByPrimaryKey(SysMenu record);

    /**
     * 查询所有菜单
     *
     * @return 菜单列表
     */
    List<SysMenu> queryListAll();

    /**
     * 分页模糊查询菜单
     *
     * @param query 分页模糊参数
     * @return 菜单列表
     */
    List<SysMenu> queryList(Query query);

    /**
     * 查询菜单总数
     *
     * @param query 分页模糊参数
     * @return 数量
     */
    int queryTotal(Query query);

    /**
     * 批量删除
     *
     * @param menuIds 菜单ID列表
     * @return 操作结果
     */
    int deleteBatch(Long[] menuIds);

    /**
     * 获取不包含按钮的菜单列表
     *
     * @return 菜单列表
     */
    List<SysMenu> queryNotButtonList();


    /**
     * 根据父菜单，查询子菜单
     *
     * @param parentId 父菜单ID
     */
    List<SysMenu> queryListParentId(Long parentId);

}