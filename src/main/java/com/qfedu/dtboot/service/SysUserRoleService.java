package com.qfedu.dtboot.service;

import java.util.List;

public interface SysUserRoleService {

    List<Long> queryRoleIdList(Long userId);

    void saveOrUpdate(Long userId, List<Long> roleIdList);

    void deleteByRoleIds(Long[] roleIds);

    void deleteByUserIds(Long[] asList);
}
