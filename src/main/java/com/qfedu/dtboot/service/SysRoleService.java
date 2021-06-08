package com.qfedu.dtboot.service;

import com.qfedu.dtboot.utils.DataGridResult;
import com.qfedu.dtboot.utils.Query;

public interface SysRoleService {

    DataGridResult getPageList(Query query);

    void deleteBatch(Long[] id);
}
