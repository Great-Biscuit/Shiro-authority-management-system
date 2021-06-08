package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysUserRoleMapper;
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
}
