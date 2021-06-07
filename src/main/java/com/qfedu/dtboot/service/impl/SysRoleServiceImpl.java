package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysRoleMapper;
import com.qfedu.dtboot.entity.SysRole;
import com.qfedu.dtboot.service.SysRoleService;
import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by helen on 2018/3/3
 */
@Service
public class SysRoleServiceImpl implements SysRoleService{

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Override
    public DataGridResult getPageList(Query query) {

        //TODO
        /*if(ShiroUtils.getUserId() != Constant.SUPER_ADMIN){
            query.put("createUserId", ShiroUtils.getUserId());
        }*/

        List<SysRole> rows = sysRoleMapper.queryList(query);
        int total = sysRoleMapper.queryTotal(query);

        //创建DataGridResult对象
        DataGridResult dataGridResult = new DataGridResult(rows, total);
        return dataGridResult;
    }

    @Override
    public void deleteBatch(Long[] roleIds) {
        sysRoleMapper.deleteBatch(roleIds);
    }
}
