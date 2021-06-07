package com.qfedu.dtboot.dao;

import com.qfedu.dtboot.entity.SysRoleMenu;
import org.springframework.stereotype.Component;

@Component(value ="sysRoleMenuMapper")
public interface SysRoleMenuMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_menu
     *
     * @mbggenerated Fri Mar 02 03:58:13 CST 2018
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_menu
     *
     * @mbggenerated Fri Mar 02 03:58:13 CST 2018
     */
    int insert(SysRoleMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_menu
     *
     * @mbggenerated Fri Mar 02 03:58:13 CST 2018
     */
    int insertSelective(SysRoleMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_menu
     *
     * @mbggenerated Fri Mar 02 03:58:13 CST 2018
     */
    SysRoleMenu selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_menu
     *
     * @mbggenerated Fri Mar 02 03:58:13 CST 2018
     */
    int updateByPrimaryKeySelective(SysRoleMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_menu
     *
     * @mbggenerated Fri Mar 02 03:58:13 CST 2018
     */
    int updateByPrimaryKey(SysRoleMenu record);
}