package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysMenuMapper;
import com.qfedu.dtboot.dao.SysUserMapper;
import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by helen on 2018/3/6
 */
@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public SysUser queryByUserName(String username) {
        return sysUserMapper.queryByUserName(username);
    }

    @Override
    public List<String> queryAllPerms(Long userId) {
        return sysMenuMapper.queryAllPerms(userId);
    }
}
