package com.csuft.shiro.service;

import com.csuft.shiro.utils.DataGridResult;
import com.csuft.shiro.utils.Query;
import com.csuft.shiro.entity.SysRole;

import java.util.List;

public interface SysRoleService {

    DataGridResult getPageList(Query query);

    void deleteBatch(Long[] id);

    SysRole getById(Long roleId);

    List<SysRole> list();

    boolean saveRole(SysRole role);

    boolean update(SysRole role);
}
