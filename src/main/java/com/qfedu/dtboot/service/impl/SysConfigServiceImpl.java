package com.qfedu.dtboot.service.impl;

import com.qfedu.dtboot.dao.SysConfigMapper;
import com.qfedu.dtboot.entity.SysConfig;
import com.qfedu.dtboot.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by helen on 2018/3/8
 */
@Service
public class SysConfigServiceImpl implements SysConfigService {

    @Autowired
    private SysConfigMapper sysConfigMapper;

    public void setSysConfigMapper(SysConfigMapper sysConfigMapper) {
        this.sysConfigMapper = sysConfigMapper;
    }

    @Override
    public List<SysConfig> queryByKeyPrefix(String keyPrefix) {
        return sysConfigMapper.queryByKeyPrefix(keyPrefix);
    }
}
