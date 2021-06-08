package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysMenuMapper;
import com.qfedu.dtboot.dao.SysUserMapper;
import com.qfedu.dtboot.entity.SysMenu;
import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.service.SysUserService;
import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        return sysUserMapper.queryAllPerms(userId);
    }

    @Override
    public List<Long> queryAllMenuId(Long userId) {
        return sysUserMapper.queryAllMenuId(userId);
    }

    @Override
    public DataGridResult getPageList(Query query) {
        List<SysUser> rows = sysUserMapper.queryList(query);
        int total = sysUserMapper.queryTotal(query);

        //创建DataGridResult对象
        DataGridResult dataGridResult = new DataGridResult(rows, total);
        return dataGridResult;
    }
}
