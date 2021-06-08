package com.qfedu.dtboot.dao;

import com.qfedu.dtboot.entity.SysMenu;
import com.qfedu.dtboot.utils.Query;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysMenuMapper {

    int deleteByPrimaryKey(Long menuId);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(Long menuId);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);

    List<SysMenu> queryListAll();

    List<SysMenu> queryList(Query query);

    int queryTotal(Query query);

    /**
     * 批量删除
     *
     * @param menuIds
     * @return
     */
    int deleteBatch(Long[] menuIds);

    /**
     * 获取不包含按钮的菜单列表
     */
    List<SysMenu> queryNotButtonList();


    /**
     * 根据父菜单，查询子菜单
     * @param parentId 父菜单ID
     */
    List<SysMenu> queryListParentId(Long parentId);

}