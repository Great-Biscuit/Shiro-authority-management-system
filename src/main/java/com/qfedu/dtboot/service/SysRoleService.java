package com.qfedu.dtboot.service;

import com.qfedu.dtboot.entity.SysRole;
import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;

import java.util.List;

public interface SysRoleService {

    DataGridResult getPageList(Query query);

    void deleteBatch(Long[] id);

    SysRole getById(Long roleId);

    List<SysRole> list();

    boolean saveRole(SysRole role);

    boolean update(SysRole role);
}
