package com.csuft.shiro.service.impl;

import com.csuft.shiro.dao.SysLogMapper;
import com.csuft.shiro.entity.SysLog;
import com.csuft.shiro.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    /**
     * 保存日志
     * @param sysLog 日志信息
     */
    @Override
    public void save(SysLog sysLog) {
        sysLogMapper.insertSelective(sysLog);
    }
}
