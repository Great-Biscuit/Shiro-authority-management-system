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

	List<SysMenu> queryListAll();

	DataGridResult getPageList(Query query);

    /**
     * 批量删除
     * @param menuIds
     */
	void deleteBatch(Long[] menuIds);

    /**
     * 获取不包含按钮的菜单列表
     */
    List<SysMenu> queryNotButtonList();

    /**
     * 保存
     * @param menu
     */
	void save(SysMenu menu);

    /**
     * 查询菜单
     */
    SysMenu queryObject(Long menuId);

    /**
     * 更新
     * @param menu
     */
	void update(SysMenu menu);

    /**
     * 获取用户权限列表
     */
    Set<String> getUserPermissions(long userId);

    /**
     * 获取用户菜单列表
     */
    List<SysMenu> getUserMenuList(Long userId);

    SysMenu getById(Long parentId);
}
