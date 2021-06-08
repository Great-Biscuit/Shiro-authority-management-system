package com.qfedu.dtboot.service;

import java.util.List;

public interface SysUserRoleService {
    List<Long> queryRoleIdList(Long userId);
}
