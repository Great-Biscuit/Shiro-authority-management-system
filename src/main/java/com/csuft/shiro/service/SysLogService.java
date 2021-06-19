package com.csuft.shiro.service;

import com.csuft.shiro.entity.SysLog;

public interface SysLogService {

    /**
     * 保存日志
     * @param sysLog 日志信息
     */
    void save(SysLog sysLog);
}
