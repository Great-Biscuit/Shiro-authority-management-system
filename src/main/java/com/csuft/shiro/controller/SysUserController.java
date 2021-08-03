package com.csuft.shiro.controller;

import com.csuft.shiro.service.SysUserRoleService;
import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.utils.R;
import com.csuft.shiro.annotation.MyLog;
import com.csuft.shiro.entity.SysUser;
import com.csuft.shiro.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    /**
     * 获取登录的用户信息
     *
     * @return 登录的用户信息
     */
    @GetMapping("/info")
    public R info() {
        return R.ok().put("user", getUser());
    }

    /**
     * 分页、模糊查询用户列表
     *
     * @param params 参数
     * @return 查询结果
     */
    @RequestMapping("/list")
    @RequiresPermissions(value = {"sys:user:list"})
    public DataGridResult list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        return sysUserService.getPageList(query);
    }

    /**
     * 修改密码
     *
     * @param password    原密码
     * @param newPassword 新密码
     * @return 操作结果
     */
    @MyLog("修改密码")
    @RequestMapping("/password")
    public R updatePassword(String password, String newPassword) {
        if (StringUtils.isBlank(newPassword)) {
            return R.error("新密码不能为空");
        }
        password = new Md5Hash(password, getUser().getUsername(), 1024).toHex();
        newPassword = new Md5Hash(newPassword, getUser().getUsername(), 1024).toHex();

        //尝试更新
        boolean flag = sysUserService.updatePassword(getUserId(), password, newPassword);
        if (!flag) {
            return R.error("原密码不正确");
        }
        return R.ok();
    }

    /**
     * 查询用户信息
     *
     * @param userId 用户ID
     * @return 用户信息
     */
    @RequestMapping("/info/{userId}")
    @RequiresPermissions(value = {"sys:user:info"})
    public R userInfo(@PathVariable("userId") Long userId) {
        SysUser sysUser = sysUserService.getById(userId);
        //获取用户所属的角色列表
        List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
        sysUser.setRoleIdList(roleIdList);

        return R.ok().put("user", sysUser);
    }

    /**
     * 保存用户
     *
     * @param user 用户信息
     * @return 操作结果
     */
    @MyLog("保存用户")
    @RequestMapping("/save")
    @RequiresPermissions(value = {"sys:user:save"})
    public R userSave(@RequestBody SysUser user) {
        user.setCreateUserId(getUserId());
        boolean flag = sysUserService.saveUser(user);
        if (!flag) {
            return R.error("保存用户失败!");
        }
        return R.ok();
    }

    /**
     * 修改用户
     *
     * @param user 用户信息
     * @return 操作结果
     */
    @MyLog("修改用户")
    @RequestMapping("/update")
    @RequiresPermissions(value = {"sys:user:update"})
    public R userUpdate(@RequestBody SysUser user) {
        boolean flag = sysUserService.updateUser(user);
        if (!flag) {
            return R.error("改用户失败!");
        }
        return R.ok();
    }

    /**
     * 批量删除用户
     *
     * @param userIds
     * @return
     */
    @MyLog("删除用户")
    @RequestMapping("/delete")
    @RequiresPermissions(value = {"sys:user:delete"})
    public R userSave(@RequestBody Long[] userIds) {
        if (ArrayUtils.contains(userIds, 1L)) {
            return R.error("系统管理员不可删除!");
        }
        if (ArrayUtils.contains(userIds, getUserId())) {
            return R.error("当前用户不可删除!");
        }
        sysUserService.deleteByIds(userIds);
        return R.ok();
    }

}
