package com.csuft.shiro.service.impl;

import com.csuft.shiro.dao.SysRoleMenuMapper;
import com.csuft.shiro.entity.SysRoleMenu;
import com.csuft.shiro.service.SysRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleMenuServiceImpl implements SysRoleMenuService {

    @Autowired
    SysRoleMenuMapper sysRoleMenuMapper;

    /**
     * 根据角色ID获取菜单ID列表
     *
     * @param roleId 角色ID
     * @return 菜单ID列表
     */
    @Override
    public List<Long> queryMenuIdList(Long roleId) {
        return sysRoleMenuMapper.queryMenuIdList(roleId);
    }

    @Override
    public void saveOrUpdate(Long roleId, List<Long> menuIdList) {
        //先删除
        sysRoleMenuMapper.deleteByRoleIds(new Long[]{roleId});
        //看是修改还是新增
        if (menuIdList == null || menuIdList.size() == 0)
            return;
        //再保存
        for (Long menuId : menuIdList) {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setRoleId(roleId);
            sysRoleMenu.setMenuId(menuId);
            sysRoleMenuMapper.insertSelective(sysRoleMenu);
        }
    }

    @Override
    public void deleteByRoleIds(Long[] roleIds) {
        sysRoleMenuMapper.deleteByRoleIds(roleIds);
    }

    @Override
    public void deleteByMenuIds(Long[] menuIds) {
        sysRoleMenuMapper.deleteByMenuIds(menuIds);
    }
}
