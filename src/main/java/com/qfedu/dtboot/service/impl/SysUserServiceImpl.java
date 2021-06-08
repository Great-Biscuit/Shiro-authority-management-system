package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysUserMapper;
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

    @Override
    public boolean updatePassword(Long userId, String password, String newPassword) {
        return false;
    }

    @Override
    public SysUser getById(Long userId) {
        return sysUserMapper.selectById(userId);
    }

    @Override
    public void deleteByIds(List<Long> asList) {
        sysUserMapper.deleteBatch(asList);
    }

    @Override
    public boolean saveUser(SysUser user) {
        int t = sysUserMapper.insertSelective(user);
        if (t == 0) return false;
        return true;
    }

    @Override
    public boolean updateUser(SysUser user) {
        int t = sysUserMapper.updateByPrimaryKeySelective(user);
        if (t == 0) return false;
        return true;
    }
}
