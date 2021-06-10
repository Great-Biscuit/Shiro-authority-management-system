package com.csuft.shiro.service.impl;

import com.csuft.shiro.dao.SysRoleMapper;
import com.csuft.shiro.entity.SysRole;
import com.csuft.shiro.service.SysRoleMenuService;
import com.csuft.shiro.service.SysRoleService;
import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    @Override
    public DataGridResult getPageList(Query query) {

        List<SysRole> rows = sysRoleMapper.queryList(query);
        int total = sysRoleMapper.queryTotal(query);

        //创建DataGridResult对象
        DataGridResult dataGridResult = new DataGridResult(rows, total);
        return dataGridResult;
    }

    @Override
    public void deleteBatch(Long[] roleIds) {
        sysRoleMapper.deleteBatch(roleIds);
    }

    @Override
    public SysRole getById(Long roleId) {
        return sysRoleMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public List<SysRole> list() {
        return sysRoleMapper.selectAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean saveRole(SysRole role) {
        role.setCreateTime(new Date());
        long t = sysRoleMapper.insertSelective(role);
        if (t == 0L) return false;
        //创建角色与菜单的关系
        SysRole okRole = sysRoleMapper.queryByRoleName(role.getRoleName());
        sysRoleMenuService.saveOrUpdate(okRole.getRoleId(), role.getMenuIdList());
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean update(SysRole role) {
        long t = sysRoleMapper.updateByPrimaryKeySelective(role);
        if (t == 0L) return false;
        //更新角色与菜单的关系
        sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());
        return true;
    }
}
