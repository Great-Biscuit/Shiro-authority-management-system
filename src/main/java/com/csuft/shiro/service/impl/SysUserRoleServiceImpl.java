package com.csuft.shiro.service.impl;

import com.csuft.shiro.dao.SysUserRoleMapper;
import com.csuft.shiro.entity.SysUserRole;
import com.csuft.shiro.service.SysUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysUserRoleServiceImpl implements SysUserRoleService {

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    /**
     * 根据用户ID获取其角色列表
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    @Override
    public List<Long> queryRoleIdList(Long userId) {
        return sysUserRoleMapper.queryRoleIdList(userId);
    }

    /**
     * 保存修改用户角色联系
     *
     * @param userId     用户ID
     * @param roleIdList 角色ID列表
     */
    @Override
    public void saveOrUpdate(Long userId, List<Long> roleIdList) {
        //先删除
        sysUserRoleMapper.deleteByUserIds(new Long[]{userId});
        //看有无需添加的数据
        if (roleIdList == null || roleIdList.size() == 0)
            return;
        //再保存
        for (Long roleId : roleIdList) {
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(userId);
            sysUserRole.setRoleId(roleId);
            sysUserRoleMapper.insertSelective(sysUserRole);
        }
    }

    /**
     * 根据角色ID列表删除用户角色联系
     *
     * @param roleIds
     */
    @Override
    public void deleteByRoleIds(Long[] roleIds) {
        sysUserRoleMapper.deleteByRoleIds(roleIds);
    }

    /**
     * 根据用户ID列表删除用户角色联系
     *
     * @param UserIds 用户ID列表
     */
    @Override
    public void deleteByUserIds(Long[] UserIds) {
        sysUserRoleMapper.deleteByUserIds(UserIds);
    }
}
