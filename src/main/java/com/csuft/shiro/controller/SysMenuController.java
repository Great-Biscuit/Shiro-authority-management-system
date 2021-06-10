package com.csuft.shiro.controller;

import com.csuft.shiro.annotation.MyLog;
import com.csuft.shiro.entity.SysMenu;
import com.csuft.shiro.service.SysMenuService;
import com.csuft.shiro.utils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 系统菜单
 */
@RestController
@RequestMapping("/sys/menu")
public class SysMenuController extends AbstractController{
    @Autowired
    private SysMenuService sysMenuService;


    @GetMapping("/listall")
    public List<SysMenu> getAll(){
        //查询列表数据
        return sysMenuService.queryListAll();
    }

    @GetMapping("/list")
    @RequiresPermissions(value={"sys:menu:list"})
    public DataGridResult getPage(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);//进一步处理参数
        return sysMenuService.getPageList(query);
    }

    @MyLog("删除菜单记录")
    @PostMapping("/del")
    @RequiresPermissions(value={"sys:menu:delete"})
    public R deleteBatch(@RequestBody Long[] menuIds) {
        for(Long menuId : menuIds){
            if(menuId.longValue() <= 31){
                return R.error("系统菜单，不能删除");
            }
        }
        sysMenuService.deleteBatch(menuIds);
        return R.ok();
    }

    /**
     * 选择菜单(添加、修改菜单)
     */
    @GetMapping("/select")
    @RequiresPermissions(value={"sys:menu:select"})
    public R select(){
        //查询列表数据
        List<SysMenu> menuList = sysMenuService.queryNotButtonList();

        //添加顶级菜单
        SysMenu root = new SysMenu();
        root.setMenuId(0L);
        root.setName("一级菜单");
        root.setParentId(-1L);
        root.setOpen(true);
        menuList.add(root);

        return R.ok().put("menuList", menuList);
    }

    @MyLog("保存菜单记录")
    @PostMapping("/save")
    @RequiresPermissions(value={"sys:menu:save"})
    public R save(@RequestBody SysMenu menu){
        verifyForm(menu);
        sysMenuService.save(menu);
        return R.ok();
    }

    /**
     * 菜单信息
     */
    @GetMapping("/info/{menuId}")
    @RequiresPermissions(value={"sys:menu:info"})
    public R info(@PathVariable("menuId") Long menuId){
        SysMenu menu = sysMenuService.queryObject(menuId);
        return R.ok().put("menu", menu);
    }

    @MyLog("修改菜单记录")
    @PostMapping("/update")
    @RequiresPermissions(value={"sys:menu:update"})
    public R update(@RequestBody SysMenu menu){
        verifyForm(menu);
        sysMenuService.update(menu);
        return R.ok();
    }

    /**
     * 用户菜单列表
     */
    @GetMapping("/user")
    public R user() {
        List<SysMenu> menuList = sysMenuService.getUserMenuList(getUserId());
        Set<String> permissions = sysMenuService.getUserPermissions(getUserId());
        return R.ok().put("menuList", menuList).put("permissions", permissions);
    }

    /**
     * 验证参数是否正确
     */
    private void verifyForm(SysMenu menu) {
        if (StringUtils.isBlank(menu.getName())) {
            throw new RRException("菜单名称不能为空");
        }

        if (menu.getParentId() == null) {
            throw new RRException("上级菜单不能为空");
        }

        //菜单
        if (menu.getType() == Constant.MenuType.MENU.getValue()) {
            if (StringUtils.isBlank(menu.getUrl())) {
                throw new RRException("菜单URL不能为空");
            }
        }

        //上级菜单类型
        int parentType = Constant.MenuType.CATALOG.getValue();
        if (menu.getParentId() != 0) {
            SysMenu parentMenu = sysMenuService.getById(menu.getParentId());
            parentType = parentMenu.getType();
        }

        //目录、菜单
        if (menu.getType() == Constant.MenuType.CATALOG.getValue() ||
                menu.getType() == Constant.MenuType.MENU.getValue()) {
            if (parentType != Constant.MenuType.CATALOG.getValue()) {
                throw new RRException("上级菜单只能为目录类型");
            }
            return;
        }

        //按钮
        if (menu.getType() == Constant.MenuType.BUTTON.getValue()) {
            if (parentType != Constant.MenuType.MENU.getValue()) {
                throw new RRException("上级菜单只能为菜单类型");
            }
            return;
        }
    }


}
