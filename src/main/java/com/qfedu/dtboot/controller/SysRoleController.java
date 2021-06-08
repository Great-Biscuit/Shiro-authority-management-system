package com.qfedu.dtboot.controller;

import com.qfedu.dtboot.annotation.MyLog;
import com.qfedu.dtboot.entity.SysRole;
import com.qfedu.dtboot.service.SysRoleService;
import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;
import com.qfedu.dtboot.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/sys/role")
public class SysRoleController {

    @Autowired
    private SysRoleService sysRoleService;


    @RequestMapping("/list")
    @RequiresPermissions("sys:role:list")
    public DataGridResult list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);//进一步处理参数
        return sysRoleService.getPageList(query);
    }


    @RequestMapping("/select")
    @RequiresPermissions("sys:role:select")
    public R select() {
        List<SysRole> list = sysRoleService.list();

        return R.ok().put("list", list);
    }


    @RequestMapping("/info/{roleId}")
    @RequiresPermissions("sys:role:info")
    public R info(@PathVariable("roleId") Long roleId) {
        SysRole role = sysRoleService.getById(roleId);

        //查询角色对应的菜单
        List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
        role.setMenuIdList(menuIdList);

        //查询角色对应的部门
        List<Long> deptIdList = sysRoleDeptService.queryDeptIdList(new Long[]{roleId});
        role.setDeptIdList(deptIdList);

        return R.ok().put("role", role);
    }

    @MyLog("保存角色")
    @RequestMapping("/save")
    @RequiresPermissions("sys:role:save")
    public R save(@RequestBody SysRole role) {
        sysRoleService.saveRole(role);
        return R.ok();
    }

    @MyLog("修改角色")
    @RequestMapping("/update")
    @RequiresPermissions("sys:role:update")
    public R update(@RequestBody SysRole role) {
        sysRoleService.update(role);
        return R.ok();
    }

    @MyLog("删除角色")
    @RequestMapping("/delete")
    @RequiresPermissions("sys:role:delete")
    public R delete(@RequestBody Long[] roleIds) {
        sysRoleService.deleteBatch(roleIds);
        return R.ok();
    }


}
