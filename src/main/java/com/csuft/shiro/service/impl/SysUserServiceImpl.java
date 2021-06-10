package com.csuft.shiro.service.impl;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.dao.SysUserMapper;
import com.csuft.shiro.entity.SysUser;
import com.csuft.shiro.service.SysUserRoleService;
import com.csuft.shiro.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserRoleService sysUserRoleService;

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
        SysUser sysUser = sysUserMapper.selectById(userId);
        if (!sysUser.getPassword().equals(password))
            return false;
        sysUser.setPassword(newPassword);
        int t = sysUserMapper.updateByPrimaryKeySelective(sysUser);
        if (t == 0)
            return false;
        return true;
    }

    @Override
    public SysUser getById(Long userId) {
        return sysUserMapper.selectById(userId);
    }

    @Override
    public void deleteByIds(Long[] asList) {
        sysUserMapper.deleteBatch(asList);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean saveUser(SysUser user) {
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            return false;
        }
        user.setCreateTime(new Date());
        user.setPassword(new Md5Hash(user.getPassword(), user.getUsername(), 1024).toHex());
        long t = sysUserMapper.insertSelective(user);
        if (t == 0L) return false;
        //添加角色列表
        SysUser okUser = sysUserMapper.queryByUserName(user.getUsername());
        sysUserRoleService.saveOrUpdate(okUser.getUserId(), user.getRoleIdList());
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean updateUser(SysUser user) {
        if (StringUtils.isBlank(user.getUsername())) {
            return false;
        }
        if (!StringUtils.isBlank(user.getPassword())) {
            user.setPassword(new Md5Hash(user.getPassword(), user.getUsername(), 1024).toHex());
        }
        long t = sysUserMapper.updateByPrimaryKeySelective(user);
        if (t == 0L) return false;
        //更新角色列表
        sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
        return true;
    }
}
