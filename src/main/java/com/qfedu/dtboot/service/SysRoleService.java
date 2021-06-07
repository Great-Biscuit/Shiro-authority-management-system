package com.qfedu.dtboot.service;

import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;

/**
 * Created by helen on 2018/3/3
 */
public interface SysRoleService {

    DataGridResult getPageList(Query query);

    void deleteBatch(Long[] id);
}
