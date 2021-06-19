package com.csuft.shiro.controller;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.utils.R;
import com.csuft.shiro.annotation.MyLog;
import com.csuft.shiro.entity.SysRole;
import com.csuft.shiro.service.SysRoleMenuService;
import com.csuft.shiro.service.SysRoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/sys/role")
public class SysRoleController extends AbstractController {

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
     * 分页、模糊查询
     *
     * @param params 分页及模糊查询参数
     * @return 查询结果
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:role:list")
    public DataGridResult list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);//进一步处理参数
        return sysRoleService.getPageList(query);
    }

    /**
     * 查询角色列表
     *
     * @return 角色列表
     */
    @RequestMapping("/select")
    @RequiresPermissions("sys:role:select")
    public R select() {
        List<SysRole> list = sysRoleService.list();
        return R.ok().put("list", list);
    }

    /**
     * 查询角色对应的菜单列表
     *
     * @param roleId 角色ID
     * @return 菜单列表
     */
    @RequestMapping("/info/{roleId}")
    @RequiresPermissions("sys:role:info")
    public R info(@PathVariable("roleId") Long roleId) {
        SysRole role = sysRoleService.getById(roleId);

        //查询角色对应的菜单
        List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
        role.setMenuIdList(menuIdList);

        return R.ok().put("role", role);
    }

    /**
     * 保存角色
     *
     * @param role 角色信息
     * @return 操作结果
     */
    @MyLog("保存角色")
    @RequestMapping("/save")
    @RequiresPermissions("sys:role:save")
    public R save(@RequestBody SysRole role) {
        role.setCreateUserId(getUserId());
        boolean flag = sysRoleService.saveRole(role);
        if (!flag) {
            return R.error("保存角色失败!");
        }
        return R.ok();
    }

    /**
     * 修改角色
     *
     * @param role 角色信息
     * @return 操作结果
     */
    @MyLog("修改角色")
    @RequestMapping("/update")
    @RequiresPermissions("sys:role:update")
    public R update(@RequestBody SysRole role) {
        boolean flag = sysRoleService.update(role);
        if (!flag) {
            return R.error("修改角色失败!");
        }
        return R.ok();
    }

    /**
     * 删除ID列表对应的角色
     *
     * @param roleIds ID列表
     * @return 操作结果
     */
    @MyLog("删除角色")
    @RequestMapping("/delete")
    @RequiresPermissions("sys:role:delete")
    public R delete(@RequestBody Long[] roleIds) {
        sysRoleService.deleteBatch(roleIds);
        return R.ok();
    }


}
