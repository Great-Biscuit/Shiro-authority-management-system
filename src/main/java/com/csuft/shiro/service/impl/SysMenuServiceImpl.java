package com.csuft.shiro.service.impl;

import com.csuft.shiro.dao.SysMenuMapper;
import com.csuft.shiro.dao.SysUserMapper;
import com.csuft.shiro.entity.SysMenu;
import com.csuft.shiro.service.SysMenuService;
import com.csuft.shiro.service.SysRoleMenuService;
import com.csuft.shiro.utils.Constant;
import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


@Service
public class SysMenuServiceImpl implements SysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
     * 查询所有菜单
     *
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> queryListAll() {
        return sysMenuMapper.queryListAll();
    }

    /**
     * 分页模糊查询菜单
     *
     * @param query 分页模糊查询类
     * @return 分页模糊查询结果
     */
    @Override
    public DataGridResult getPageList(Query query) {

        List<SysMenu> rows = sysMenuMapper.queryList(query);
        int total = sysMenuMapper.queryTotal(query);

        //创建DataGridResult对象
        DataGridResult dataGridResult = new DataGridResult(rows, total);
        return dataGridResult;
    }

    /**
     * 批量删除
     *
     * @param menuIds 菜单ID列表
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void deleteBatch(Long[] menuIds) {
        sysMenuMapper.deleteBatch(menuIds);
        sysRoleMenuService.deleteByMenuIds(menuIds);
    }

    /**
     * 获取不包含按钮的菜单列表
     *
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> queryNotButtonList() {
        return sysMenuMapper.queryNotButtonList();
    }

    /**
     * 保存
     *
     * @param menu 菜单信息
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void save(SysMenu menu) {
        sysMenuMapper.insertSelective(menu);
    }

    /**
     * 根据ID查询菜单
     *
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    @Override
    public SysMenu queryObject(Long menuId) {
        return sysMenuMapper.selectByPrimaryKey(menuId);
    }

    /**
     * 更新菜单
     *
     * @param menu 菜单信息
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)//隔离级别
    public void update(SysMenu menu) {
        sysMenuMapper.updateByPrimaryKeySelective(menu);
    }

    /**
     * 获取用户权限列表
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> getUserPermissions(long userId) {

        List<String> permsList = null;
        //超级用户（id=1的用户），拥有最高权限
        if (userId == Constant.SUPER_ADMIN) {
            List<SysMenu> menuList = queryListAll();
            permsList = new ArrayList<String>(menuList.size());
            for (SysMenu menu : menuList) {
                permsList.add(menu.getPerms());
            }
        } else {
            permsList = sysUserMapper.queryAllPerms(userId);
        }

        //用户权限列表
        Set<String> permsSet = new HashSet<String>();
        for (String perms : permsList) {
            if (StringUtils.isBlank(perms)) {
                continue;
            }
            permsSet.addAll(Arrays.asList(perms.trim().split(",")));
        }
        return permsSet;
    }

    /**
     * 获取用户的菜单列表
     *
     * @param userId 用户ID
     * @return 用户的菜单列表
     */
    @Override
    public List<SysMenu> getUserMenuList(Long userId) {
        //系统管理员，拥有最高权限
        if (userId == Constant.SUPER_ADMIN) {
            return getAllMenuList(null);
        }

        //用户菜单列表
        List<Long> menuIdList = sysUserMapper.queryAllMenuId(userId);
        return getAllMenuList(menuIdList);
    }

    /**
     * 根据ID查询
     *
     * @param parentId 父菜单ID
     * @return 菜单
     */
    @Override
    public SysMenu getById(Long userId) {
        return sysMenuMapper.selectByPrimaryKey(userId);
    }

    /**
     * 根据父菜单，查询当前用户可见的子菜单
     *
     * @param parentId   父菜单ID
     * @param menuIdList 用户菜单ID列表
     */
    private List<SysMenu> queryListParentId(Long parentId, List<Long> menuIdList) {
        //根据副菜单id获取子菜单列表
        List<SysMenu> menuList = sysMenuMapper.queryListParentId(parentId);
        if (menuIdList == null) {
            return menuList;
        }

        //过滤出当前用户有权查看的子菜单列表
        List<SysMenu> userMenuList = new ArrayList<>();
        for (SysMenu menu : menuList) {
            if (menuIdList.contains(menu.getMenuId())) {
                userMenuList.add(menu);
            }
        }
        return userMenuList;
    }

    /**
     * 填充当前级别菜单列表的下一层菜单列表：递归形成树形结构
     *
     * @param menuList   当前用户可访问的菜单（当前级别）
     * @param menuIdList 当前用户可访问的菜单id列表
     * @return
     */
    private void getMenuTreeList(List<SysMenu> menuList, List<Long> menuIdList) {
        for (SysMenu entity : menuList) {
            if (entity.getType() == 0) {//目录
                //根据菜单id获取当前用户可见的子菜单列表
                List<SysMenu> subMenuList = queryListParentId(entity.getMenuId(), menuIdList);
                getMenuTreeList(subMenuList, menuIdList);
                entity.setList(subMenuList);
            }
        }
    }

    /**
     * 获取所有菜单列表
     */
    private List<SysMenu> getAllMenuList(List<Long> menuIdList) {
        //查询根菜单列表
        List<SysMenu> menuList = queryListParentId(0L, menuIdList);
        //递归获取子菜单
        getMenuTreeList(menuList, menuIdList);

        return menuList;
    }

}
