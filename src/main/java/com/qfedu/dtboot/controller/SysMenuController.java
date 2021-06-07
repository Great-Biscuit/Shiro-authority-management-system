package com.qfedu.dtboot.controller;

import com.qfedu.dtboot.annotation.MyLog;
import com.qfedu.dtboot.entity.SysMenu;
import com.qfedu.dtboot.service.SysMenuService;
import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;
import com.qfedu.dtboot.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 系统菜单
 *
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
    //@RequiresRoles({"admin"})
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

        sysMenuService.update(menu);
        return R.ok();
    }

    /**
     * 用户菜单列表
     */
    @GetMapping("/user")
    public R user(){
        List<SysMenu> menuList = sysMenuService.getUserMenuList(getUserId());
        Set<String> permissions = sysMenuService.getUserPermissions(getUserId());
        return R.ok().put("menuList", menuList).put("permissions", permissions);
    }
}
