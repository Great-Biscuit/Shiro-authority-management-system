package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysUserRoleMapper;
import com.qfedu.dtboot.entity.SysUserRole;
import com.qfedu.dtboot.service.SysUserRoleService;
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

    @Override
    public void saveOrUpdate(Long userId, List<Long> roleIdList) {
        //先删除
        sysUserRoleMapper.deleteByUserIds(new Long[]{userId});
        //看是修改还是新增
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

    @Override
    public void deleteByRoleIds(Long[] roleIds) {
        sysUserRoleMapper.deleteByRoleIds(roleIds);
    }

    @Override
    public void deleteByUserIds(Long[] UserIds) {
        sysUserRoleMapper.deleteByUserIds(UserIds);
    }
}
