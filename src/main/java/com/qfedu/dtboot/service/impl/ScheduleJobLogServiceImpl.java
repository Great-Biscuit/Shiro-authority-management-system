package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.ScheduleJobLogMapper;
import com.qfedu.dtboot.entity.ScheduleJobLog;
import com.qfedu.dtboot.service.ScheduleJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by helen on 2018/3/12
 */
@Service
public class ScheduleJobLogServiceImpl implements ScheduleJobLogService {

    @Autowired
    private ScheduleJobLogMapper scheduleJobLogMapper;

    @Override
    public void save(ScheduleJobLog scheduleJobLog) {
        scheduleJobLogMapper.insertSelective(scheduleJobLog);
    }
}
