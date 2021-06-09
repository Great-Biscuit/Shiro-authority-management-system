package com.qfedu.dtboot;

import com.qfedu.dtboot.dao.SysUserRoleMapper;
import com.qfedu.dtboot.entity.SysRole;
import com.qfedu.dtboot.entity.SysUser;
import com.qfedu.dtboot.service.SysRoleMenuService;
import com.qfedu.dtboot.service.SysRoleService;
import com.qfedu.dtboot.service.SysUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DataTest {

    @Autowired
    SysRoleMenuService sysRoleMenuService;

    @Autowired
    SysUserRoleMapper sysUserRoleMapper;

    @Autowired
    SysRoleService sysRoleService;

    @Autowired
    SysUserService sysUserService;

    @Test
    public void queryMenuIdListTest() {
        System.out.println(sysRoleMenuService.queryMenuIdList(6l));
    }

    @Test
    public void queryRoleIdListTest() {
        System.out.println(sysUserRoleMapper.queryRoleIdList(1L));
    }

    @Test
    public void sysRoleServiceListTest() {
        List<SysRole> list = sysRoleService.list();
        for (SysRole sysRole : list) {
            System.out.println(sysRole);
        }
    }

    @Test
    public void UserCRUDTest() {
        SysUser user = new SysUser();
        user.setUserId(101L);
        user.setUsername("Test");
        user.setPassword("123");
        sysUserService.saveUser(user);
        System.out.println(sysUserService.getById(101L));
        user.setPassword("456");
        sysUserService.updateUser(user);
        System.out.println(sysUserService.getById(101L));
    }

    @Test
    public void saveUserTest() {
        SysUser user = new SysUser();
        user.setUserId(105L);
        user.setUsername("Test105");
        user.setPassword("123");
        List<Long> list = new ArrayList<>();
        list.add(5L);
        user.setRoleIdList(list);
        sysUserService.saveUser(user);
    }

    @Test
    public void saveRoleTest() {
        SysRole role = new SysRole();
        role.setRoleName("Test");
        List<Long> list = new ArrayList<>();
        list.add(1L);
        role.setMenuIdList(list);
        sysRoleService.saveRole(role);
    }

    @Test
    public void selectUserById() {
        System.out.println(sysUserService.getById(1L));
    }

}
