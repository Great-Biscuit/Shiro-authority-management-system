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

    /**
     * 根据用户名，查询系统用户
     *
     * @param username 用户名
     * @return
     */
    @Override
    public SysUser queryByUserName(String username) {
        return sysUserMapper.queryByUserName(username);
    }

    /**
     * 查询用户的所有权限
     *
     * @param userId 用户ID
     */
    @Override
    public List<String> queryAllPerms(Long userId) {
        return sysUserMapper.queryAllPerms(userId);
    }

    /**
     * 查询用户的所有菜单ID
     *
     * @param userId 用户ID
     * @return 菜单ID列表
     */
    @Override
    public List<Long> queryAllMenuId(Long userId) {
        return sysUserMapper.queryAllMenuId(userId);
    }

    /**
     * 分页模糊查询用户信息
     *
     * @param query 分页模糊查询参数
     * @return 分页模糊查询结果
     */
    @Override
    public DataGridResult getPageList(Query query) {
        List<SysUser> rows = sysUserMapper.queryList(query);
        int total = sysUserMapper.queryTotal(query);

        //创建DataGridResult对象
        DataGridResult dataGridResult = new DataGridResult(rows, total);
        return dataGridResult;
    }

    /**
     * 更新密码
     *
     * @param userId      用户ID
     * @param password    旧密码
     * @param newPassword 新密码
     * @return 更新结果
     */
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

    /**
     * 根据ID查询用户
     *
     * @param userId 用户ID
     * @return 用户
     */
    @Override
    public SysUser getById(Long userId) {
        return sysUserMapper.selectById(userId);
    }

    /**
     * 根据ID列表删除用户
     *
     * @param asList 用户ID列表
     */
    @Override
    public void deleteByIds(Long[] asList) {
        sysUserMapper.deleteBatch(asList);
    }

    /**
     * 保存用户
     *
     * @param user 用户
     * @return 操作结果
     */
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

    /**
     * 更新用户
     *
     * @param user 用户
     * @return 操作结果
     */
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
