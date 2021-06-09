package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysUserMapper;
import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.service.SysUserRoleService;
import com.qfedu.dtboot.service.SysUserService;
import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return false;
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
    public boolean saveUser(SysUser user) {
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            return false;
        }
        user.setCreateTime(new Date());
        user.setPassword(new Md5Hash(user.getPassword(), user.getUsername(), 1024).toHex());
        int t = sysUserMapper.insertSelective(user);
        if (t == 0) return false;
        SysUser okUser = sysUserMapper.queryByUserName(user.getUsername());
        //添加角色列表
        sysUserRoleService.saveOrUpdate(okUser.getUserId(), user.getRoleIdList());
        return true;
    }

    @Override
    public boolean updateUser(SysUser user) {
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            return false;
        }
        user.setPassword(new Md5Hash(user.getPassword(), user.getUsername(), 1024).toHex());
        int t = sysUserMapper.updateByPrimaryKeySelective(user);
        if (t == 0) return false;
        //更新角色列表
        sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
        return true;
    }
}
