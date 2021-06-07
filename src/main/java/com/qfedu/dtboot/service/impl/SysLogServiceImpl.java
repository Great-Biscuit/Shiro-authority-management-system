package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysLogMapper;
import com.qfedu.dtboot.entity.SysLog;
import com.qfedu.dtboot.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by helen on 2018/3/9
 */
@Service
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Override
    public void save(SysLog sysLog) {
        sysLogMapper.insertSelective(sysLog);
    }
}
