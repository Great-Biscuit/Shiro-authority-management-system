package com.csuft.shiro;

import com.csuft.shiro.dao.SysMenuMapper;
import com.csuft.shiro.entity.SysMenu;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ShiroApplicationTests {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Test
    public void contextLoads() {

    }

    @Test
	public void testSelectByPrimaryKey() {

		SysMenu sysMenu = sysMenuMapper.selectByPrimaryKey(1L);
		System.out.println(sysMenu.getName());
	}
}
