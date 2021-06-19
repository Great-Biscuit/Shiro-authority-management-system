package com.csuft.shiro.service;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.entity.SysMenu;

import java.util.List;
import java.util.Set;

/**
 * 菜单管理
 */
public interface SysMenuService {

    /**
     * 查询所有菜单
     *
     * @return 菜单列表
     */
    List<SysMenu> queryListAll();

    /**
     * 分页模糊查询菜单
     *
     * @param query 分页模糊查询类
     * @return 分页模糊查询结果
     */
    DataGridResult getPageList(Query query);

    /**
     * 批量删除
     *
     * @param menuIds 菜单ID列表
     */
    void deleteBatch(Long[] menuIds);

    /**
     * 获取不包含按钮的菜单列表
     *
     * @return 菜单列表
     */
    List<SysMenu> queryNotButtonList();

    /**
     * 保存
     *
     * @param menu 菜单信息
     */
    void save(SysMenu menu);

    /**
     * 根据ID查询菜单
     *
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    SysMenu queryObject(Long menuId);

    /**
     * 更新菜单
     *
     * @param menu 菜单信息
     */
    void update(SysMenu menu);

    /**
     * 获取用户权限列表
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    Set<String> getUserPermissions(long userId);

    /**
     * 获取用户的菜单列表
     *
     * @param userId 用户ID
     * @return 用户的菜单列表
     */
    List<SysMenu> getUserMenuList(Long userId);

    /**
     * 根据ID查询
     *
     * @param parentId 父菜单ID
     * @return 菜单
     */
    SysMenu getById(Long parentId);
}
